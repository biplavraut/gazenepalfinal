<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use App\Devmenu;

class DevmenuController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
            // The current user can update the post...
            $final_result =  $this->getFullListFromDB();
            return $final_result;
    }
    static public function showMenu(){
        return Devmenu::orderBy("order_item")->get();
        /*$final_result =  $this->getFullListFromDB();
        return $final_result;*/
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        try{
            $slug = $this->createSlug($request->title,'');
        }catch (Exception $e) {
            /*report($e);
            return $e;*/
        }
        $path = public_path().'/img/devmenu';
        if(!file_exists($path)){
            \File::makeDirectory($path, $mode = 0777, true, true);
            \File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        }
        if ($request->image){
            $imageName = $slug;
            $image_name = $imageName.'.'.explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            \Image::make($request->image)->save($path.'/'.$image_name);
            \Image::make($request->image)->resize(500, 500)->save(public_path('img/devmenu/thumbs/').$image_name);//resize image
        }else{
            $image_name = "no-image.png";
        }
        $order = Devmenu::max('order_item')+1;
        if($request->display == ''){
            $request->merge(['display' =>0]);
        }
        if($request->type == ''){
            $request->merge(['type' =>0]);
        }

        return Devmenu::create([
            'title' => $request['title'],
            'slug' => $slug,
            'image' => $image_name,
            'icon' => $request['icon'],
            'type' => $request['type'],
            'display' => $request['display'],
            'parent_id' => 0,
            'child'=> 0,
            'order_item' => $order,
            'excerpt' => $request['excerpt']
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $menu = Devmenu::findOrFail($id);

        $slug = Str::slug($request->title);

        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->title, $request->id)]);
        }
        if($request->image){
            $old_image = json_decode(Devmenu::select('image')->where('id', 'like', $request->id)->get()->first());
            $old_image =  $old_image->image;
            if($request->image != $old_image){
                $menuPhoto = public_path('img/devmenu/').$old_image;
                $menuThumb = public_path('img/devmenu/thumbs/').$old_image;
                if(file_exists($menuPhoto)){
                    unlink($menuPhoto);
                    unlink($menuThumb);
                }
                $path = public_path().'/img/devmenu';
                $imageName = $slug;
                $image_name = $imageName.'.'.explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                \Image::make($request->image)->save($path.'/'.$image_name);
                \Image::make($request->image)->resize(500, 500)->save(public_path('img/devmenu/thumbs/').$image_name);//resize image
                $request->merge(['image' => $imageName]);
            }
        }
        //return $request->slug;
        $menu->update($request->all());
        return ['message'=>'Menu Info Updated'];
    }
    public function orderlist(Request $request){
        $newlist = $request->newdevmenu;
        //return var_dump($newlist);
        return $this->saveList($newlist);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authorize('isAdmin');

        $menu = Menu::findOrFail($id);

        //delete the user
        $menu->delete();

        return ['message' =>'Menu Deleted'];
    }
    /*Generating Unique Slug*/
    public function createSlug($title, $id)
    {
        if(!($id)):
            $id = 0;
        endif;
        // Normalize the title
        $slug = Str::slug($title);

        // Get any that could possibly be related.
        // This cuts the queries down by doing it once.
        $allSlugs = $this->getRelatedSlugs($slug, $id);
        /*$allSlugs = Menu::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();*/

        // If we haven't used it before then we are all good.
        if (! $allSlugs->contains('slug', $slug)){
            return $slug;
        }

        // Just append numbers like a savage until we find not used.
        for ($i = 1; $i <= 100; $i++) {
            $newSlug = $slug.'-'.$i;
            if (! $allSlugs->contains('slug', $newSlug)) {
                return $newSlug;
            }
        }

        throw new \Exception('Can not create a unique slug- Many Menu of same Name');
    }

    protected function getRelatedSlugs($slug, $id = 0)
    {
        return Devmenu::select('slug')->where('slug', 'like', '%'.$slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/

    /*Generating list to display*/
    public function getFullListFromDB()
    {
        return Devmenu::orderBy("order_item")->get();
    }

    /*Sorting the content in order and making child*/
    public function saveList($list, &$m_order = 0)
    {
        /*return $list;
        exit();*/
        /*$count = count($list);
        return $count;*/
        foreach ($list as $item) {

            $m_order++;
            /*return $item;
            exit();*/
            $this->updateOrder($m_order, $item['id']);
        }
    }
    protected function updateOrder($m_order, $id)
    {
        $menu = Devmenu::findOrFail($id);
        if ($menu){
            return Devmenu::where('id', '=', $id)->update(['order_item' => $m_order]);
        }

    }
}
