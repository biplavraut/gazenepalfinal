<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Menu;
use App\Devmenu;

class MenuController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    
    public function list(){
        $regions= Menu::get();
        return view('frontend.index' , ['region_list' => $regions]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
            // The current user can update the post...
        $menu_id = Devmenu::select('id')->where('slug','LIKE',\Request::get('menu_slug'))->first();
        $final_result = $this->getFullListFromDB(0, $menu_id->id);
        return $final_result;
        /*if($slug = \Request::get('slug')){
            $menus = Menu::latest()->where('menu_id','LIKE',"%$slug%")->get();
            //$images = $this->getImages($slug);
        }else{
            $menus = ['message'=>'No Content Reference'];
        }
        //return $details;
        return ["detail_data"=>$menus];*/
    }
    public function allmenu()
    {
            return Menu::select('title','id')->where('child','<>', 1)->orderBy("order_item")->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $menu_id = Devmenu::select('id')->where('slug','LIKE',$request->menu_slug)->first();
        $menu_id = $menu_id->id;
        try{
            $slug = $this->createSlug($request->title,'');
        }catch (Exception $e) {
            /*report($e);
            return $e;*/
        }
        $path = public_path().'/img/menu';
        if(!file_exists($path)){
            File::makeDirectory($path, $mode = 0777, true, true);
            File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        }
        if ($request->image){
            $imageName = $slug;
            $image_name = $imageName.'.'.explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            \Image::make($request->image)->save($path.'/'.$image_name);
            \Image::make($request->image)->resize(500, 500)->save($path.'/thumbs'.$image_name);//resize image
            \Image::make($request->image)->resize(356, 267)->save($path.'/thumbs/rect_'.$image_name);//resize image
            \Image::make($request->image)->resize(468, 312)->save($path.'/thumbs/block_'.$image_name);//resize image


        }else{
            $image_name = "no-image.png";
        }
        $order = Menu::max('order_item')+1;
        if($request->display == ''){
            $request->merge(['display' =>0]);
        }
        if($request->type == ''){
            $request->merge(['type' =>0]);
        }

        return Menu::create([
            'menu_id' => $menu_id,
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
        $menu = Menu::findOrFail($id);

        $slug = Str::slug($request->title);

        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->title, $request->id)]);
        }
        if($request->image){
            $old_image = json_decode(Menu::select('image')->where('id', 'like', $request->id)->get()->first());
            $old_image =  $old_image->image;
            if($request->image != $old_image){
                $menuPhoto = public_path('img/menu/').$old_image;
                $menuThumb = public_path('img/menu/thumbs/').$old_image;
                if(file_exists($menuPhoto)){
                    unlink($menuPhoto);
                    unlink($menuThumb);
                }
                $path = public_path().'/img/menu';
                $imageName = $slug;
                $image_name = $imageName.'.'.explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                \Image::make($request->image)->save($path.'/'.$image_name);
                \Image::make($request->image)->resize(500, 500)->save($path.'/thumbs'.$image_name);//resize image
                \Image::make($request->image)->resize(356, 267)->save($path.'/thumbs/rect_'.$image_name);//resize image
                \Image::make($request->image)->resize(468, 312)->save($path.'/thumbs/block_'.$image_name);//resize image

                $request->merge(['image' => $image_name]);
            }
        }
        //return $request->slug;
        $menu->update($request->all());
        return ['message'=>'Menu Info Updated'];
    }

    public function orderlist(Request $request){
        $newlist = $request->newmenu;
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
        //$this->authorize('isAdmin');
        if (\Gate::allows('isAuthorized')) {
            $menu = Menu::findOrFail($id);
            //delete the user
            $menu->delete();

            return "deleted";
        }
        else{
            return "access-denied";
        }
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
        return Menu::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/

    /*Generating list to display*/
    public function getFullListFromDB($parent_id, $menu_id)
    {
        // global declaration
        $result = $this->getChildList($parent_id , $menu_id);

        foreach ($result as &$value) {
            $subresult = $this->getFullListFromDB($value["id"] , $menu_id);

            if (count($subresult) > 0) {
                $value['children'] = $subresult;
            }else{
                $value['children'] = [];
            }
        }
        unset($value);

        return $result;
    }
    protected function getChildList($parent_id, $menu_id)
    {
        return Menu::where('parent_id','=', $parent_id)->where('menu_id','=',$menu_id)->orderBy("order_item")->get();
    }

    /*Sorting the content in order and making child*/
    public function saveList($list, $parent_id = 0, $child = 0, &$m_order = 0)
    {
        /*return $list;
        exit();*/
        /*$count = count($list);
        return $count;*/
        foreach ($list as $item) {

            $m_order++;
            /*return $item;
            exit();*/
            $this->updateOrder($parent_id, $child, $m_order, $item['id']);

            if (array_key_exists("children", $item)) {
                if (count($item['children']) >= 1){
                    $this->updateParent($child = 1, $item["id"]);
                }else{
                    $this->updateParent($child = 0, $item["id"]);
                }
                $this->saveList($item["children"], $item["id"], 0, $m_order);
            }
        }
    }
    protected function updateOrder($parent_id, $child, $m_order, $id)
    {
        $menu = Menu::findOrFail($id);
        if ($menu){
            return Menu::where('id', '=', $id)->update(['parent_id' => $parent_id,
                'child'=> $child,
                'order_item' => $m_order]);
        }

    }
    protected function updateParent($child, $id)
    {

        return Menu::where('id', '=', $id)->update(['child'=> $child]);
    }
}
