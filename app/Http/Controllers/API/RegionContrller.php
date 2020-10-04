<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use App\Region;
use Illuminate\Support\Facades\File;

class RegionController extends Controller
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
            return Region::where('slug','LIKE',"%$slug%")->orderBy("order_item")->first();
        }else{
            $final_result =  $this->getFullListFromDB();
            return $final_result;
        }

    }

    public function allregion()
    {
            return Region::select('title','id')->orderBy("order_item")->get();
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

        $path = public_path().'/img/regions/' . $slug;
        if(!file_exists($path)){
            File::makeDirectory($path, $mode = 0777, true, true);
            File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        }
        $order = Region::max('order_item')+1;
        if($request->display == ''){
            $request->merge(['display' =>0]);
        }

        $create =  Region::create([
            'title' => $request['title'],
            'slug' => $slug,
            'display_image' => $request['display_image'],
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
        $region = Region::findOrFail($id);
        $old_dir = $request->slug;
        $slug = Str::slug($request->title);
        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->title, $request->id)]);
        }
        if($slug != $old_dir){
            $old_path = public_path().'/img/regions/' . $old_dir;
            $new_path = public_path().'/img/regions/' . $slug;
            $rename = rename($old_path , $new_path);
            if(!$rename){
                return ['message'=>'error'];
            }
        }else{
            $path = public_path().'/img/regions/' . $slug;
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
        $region->update($request->all());
        return ['message'=>'Region Info Updated'];
    }

    public function orderregion(Request $request){
        $newlist = $request->newregion;
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

        $region = Region::findOrFail($id);

        //delete the regions
        $delete = $region->delete();

        
        if($delete == true){
            //delete the additional details 
            //delete the image and inage directiory
           


            return ['message' =>'Region Deleted']; 
        }
        else{
            return ['message' =>'Oops! something went wrong.'];
        }
        
        return ['message' =>'Region Deleted'];
    }
    
    //display image
    public function displayimage(Request $request){
        if ($request->display_image){
            $path = public_path().'/img/regions/' . $request->content_slug;
            if(!file_exists($path)){
                File::makeDirectory($path, $mode = 0777, true, true);
                File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
            }
                $imageName = $request->content_slug.'-display';
                $displayImage = $imageName.'.'.explode('/',explode(':', substr($request->display_image, 0, strpos($request->display_image, ';')))[1])[1];
                \Image::make($request->display_image)->save($path.'/'.$displayImage);
                \Image::make($request->display_image)->resize(356, 267)->save($path.'/thumbs/'.$displayImage);//resize image

                $sql = Region::where('id', '=', $request->id)->update(['display_image'=> $displayImage]);
                if($sql){
                    return ['message'=>'Display Image Updated'];
                }else{
                    return ['message'=>'Opps! something went wrong.'];
                }

                //$request->merge(['display_image' => $display_image]);

                //$abc = $this->updatedimage($display_image, $request->id);


                //$sql = Region::where('id', '=', $request->id)->update(['display_image'=> $display_image]);
                // if($abc){
                //     return ['message'=>'Display Image Uploaded'];
                    
                // }
                // else{
                //     return $request->id;
                    
                // }
        }
    }
    //cover image
    public function coverimage(Request $request){
        if ($request->cover_image){
            $path = public_path().'/img/regions/' . $request->content_slug;
            if(!file_exists($path)){
                File::makeDirectory($path, $mode = 0777, true, true);
                File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
            }
                $imageName = $request->content_slug.'-cover';
                $coverImage = $imageName.'.'.explode('/',explode(':', substr($request->cover_image, 0, strpos($request->cover_image, ';')))[1])[1];
                \Image::make($request->cover_image)->save($path.'/'.$coverImage);
                \Image::make($request->cover_image)->resize(720, 460)->save($path.'/thumbs/'.$coverImage);//resize image

                $sql = Region::where('id', '=', $request->id)->update(['cover_image'=> $coverImage]);
                if($sql){
                    return ['message'=>'Cover Image Updated'];
                }else{
                    return ['message'=>'Opps! something went wrong.'];
                }

        }
    }
    //map
public function regionmap(Request $request){
    if ($request->map){
        $path = public_path().'/img/regions/' . $request->content_slug;
        if(!file_exists($path)){
            File::makeDirectory($path, $mode = 0777, true, true);
            File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        }
            $ext = explode('/',explode(':', substr($request->map, 0, strpos($request->map, ';')))[1])[1];
            if($ext=='png'&&'PNG'){
            $imageName = $request->content_slug.'-map';
            $map = $imageName.'.'.$ext;
            \Image::make($request->map)->save($path.'/'.$map);
            \Image::make($request->map)->resize(356, 267)->save($path.'/'.$map);//resize image

            Region::where('id', '=', $request->id)->update(['map'=> $map]);


            return ['message'=>'Region Map Uploaded'];

            }
            else{
                return ['message'=>'use png file format'];

            }
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
        return Region::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/

    /*Generating list to display*/

    protected function getFullListFromDB()
    {
        return Region::orderBy("order_item")->get();
    }
    /*Sorting the region in order and making child*/
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
        $region = Region::findOrFail($id);
        if ($region){
            return Region::where('id', '=', $id)->update(['order_item' => $m_order]);
        }

    }
    protected function updateParent($child, $id)
    {

        return Region::where('id', '=', $id)->update(['child'=> $child]);
    }
    // protected function updatedimage($image, $id)
    // {

    //     return Region::where('id', '=', $id)->update(['display_image'=> $image]);
    // }
}
