<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use App\Activities;
use Illuminate\Support\Facades\File;

class ActivityController extends Controller
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
        if($slug = \Request::get('slug')){
            //return Regions::latest()->where('slug','LIKE',"%$slug%")->get();
            return Activities::where('slug','LIKE',"%$slug%")->orderBy("order_item")->first();
        }else{
            $final_result =  $this->getFullListFromDB();
            return $final_result;
        }

    }

    public function allactivity()
    {
            return Activities::select('title','id')->orderBy("order_item")->get();
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

        $path = public_path().'/img/activities/' . $slug;
        if(!file_exists($path)){
            File::makeDirectory($path, $mode = 0777, true, true);
            File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        }
        /*if ($request->image){
            $imageName = $slug;
            $image_name = $imageName.'.'.explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            \Image::make($request->image)->save($path.'/'.$image_name);
        }else{
            $image_name = "no-image.png";
        }*/

        $order = Activities::max('order_item')+1;
        if($request->display == ''){
            $request->merge(['display' =>0]);
        }

        $create =  Activities::create([
            'title' => $request['title'],
            'slug' => $slug,
            'display' => $request['display'],
            'order_item' => $order,
        ]);
        if($create){
            return ['message'=>'created','slug'=>$slug];
        }else{
            return ['message'=>'error'];
        }
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
        $activity = Activities::findOrFail($id);
        $old_dir = $request->slug;
        $slug = Str::slug($request->title);
        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->title, $request->id)]);
        }
        if($slug != $old_dir){
            $old_path = public_path().'/img/activities/' . $old_dir;
            $new_path = public_path().'/img/activities/' . $slug;
            rename($old_path , $new_path);
        }else{
            $path = public_path().'/img/activities/' . $slug;
            if(!file_exists($path)){
                File::makeDirectory($path, $mode = 0777, true, true);
                File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
            }
        }

        $menu_categories = json_encode($request['menu_categories']);
        $request->merge(['menu_categories' => $menu_categories]);

        $difficulty = json_encode($request['difficulty']);
        $request->merge(['difficulty' => $difficulty]);

        $best_season = json_encode($request['best_season']);
        $request->merge(['best_season' => $best_season]);

        $group_size = json_encode($request['group_size']);
        $request->merge(['group_size' => $group_size]);

        $types = json_encode($request['types']);
        $request->merge(['types' => $types]);

        //return $request->slug;
        $activity->update($request->all());
        return ['message'=>'Activity Info Updated'];
    }
    
    //display image
    public function displayimage(Request $request){
        if ($request->displayimages){
            $path = public_path().'/img/activities/' . $request->content_slug;
            if(!file_exists($path)){
                File::makeDirectory($path, $mode = 0777, true, true);
                File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
            }
                $imageName = 'display_'.$request->content_slug;
                $display_image = $imageName.'.'.explode('/',explode(':', substr($request->displayimages, 0, strpos($request->displayimages, ';')))[1])[1];
                \Image::make($request->displayimages)->save($path.'/'.$display_image);
                \Image::make($request->displayimages)->resize(468, 312)->save($path.'/'.$display_image);//resize image

                Activities::where('id', '=', $request->id)->update(['display_image'=> $display_image]);

        }
    }
    //cover image
    public function coverimage(Request $request){
        if ($request->coverimage){
            $path = public_path().'/img/activities/' . $request->content_slug;
            if(!file_exists($path)){
                File::makeDirectory($path, $mode = 0777, true, true);
                File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
            }
                $imageName = 'cover_'.$request->content_slug;
                $cover_image = $imageName.'.'.explode('/',explode(':', substr($request->coverimage, 0, strpos($request->coverimage, ';')))[1])[1];
                \Image::make($request->coverimage)->save($path.'/'.$cover_image);
                \Image::make($request->coverimage)->resize(720, 460)->save($path.'/'.$cover_image);//resize image

                Activities::where('id', '=', $request->id)->update(['cover_image'=> $cover_image]);

        }
    }
    public function orderactivity(Request $request){
        $newlist = $request->newactivity;
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

        $activity = Activities::findOrFail($id);

        //delete the activity
        $delete = $activity->delete();

        
        if($delete == true){
            //delete the additional details 
            //delete the image and inage directiory
           


            return ['message' =>'Activity Deleted']; 
        }
        else{
            return ['message' =>'Oops! something went wrong.'];
        }
        
        return ['message' =>'Activity Deleted'];
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
        //return ($allSlugs); slug exist
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
        return Activities::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/

    /*Generating list to display*/

    protected function getFullListFromDB()
    {
        return Activities::orderBy("order_item")->get();
    }
    /*Sorting the activity in order and making child*/
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
        $activity = Activities::findOrFail($id);
        if ($activity){
            return Activities::where('id', '=', $id)->update(['order_item' => $m_order]);
        }

    }
    protected function updateParent($child, $id)
    {

        return Activities::where('id', '=', $id)->update(['child'=> $child]);
    }
}
