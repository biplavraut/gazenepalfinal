<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use App\Detail;

class DetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if($slug = \Request::get('slug')){
            $details = Detail::latest()->where('content_slug','LIKE',"%$slug%")->get();
            $images = $this->getImages($slug);
        }else{
            $details = ['message'=>'No Content Reference'];
        }
        //return $details;
        return ["detail_data"=>$details,"all_images"=>$images];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // if ($request->displayimages){
        //     $path = public_path().'/img/contents/' . $request->content_slug;
        //     if(!file_exists($path)){
        //         File::makeDirectory($path, $mode = 0777, true, true);
        //         File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        //     }
        //         $imageName = 'display_'.$request->content_slug;
        //         $image_name = $imageName.'.'.explode('/',explode(':', substr($request->displayimages, 0, strpos($request->displayimages, ';')))[1])[1];
        //         \Image::make($request->displayimages)->save($path.'/'.$image_name);
        //         \Image::make($request->displayimages)->resize(1080, 600)->save($path.'/'.$image_name);//resize image


        //     return ['message'=>'Cover Image Uploaded'];

        // }

        // if ($request->coverimages){
        //     $path = public_path().'/img/contents/' . $request->content_slug;
        //     if(!file_exists($path)){
        //         File::makeDirectory($path, $mode = 0777, true, true);
        //         File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        //     }
        //         $imageName = 'cover_'.$request->content_slug;
        //         $image_name = $imageName.'.'.explode('/',explode(':', substr($request->coverimages, 0, strpos($request->coverimages, ';')))[1])[1];
        //         \Image::make($request->coverimages)->save($path.'/'.$image_name);
        //         \Image::make($request->coverimages)->resize(1080, 600)->save($path.'/'.$image_name);//resize image


        //     return ['message'=>'Cover Image Uploaded'];

        // }
        if ($request->image){
            $path = public_path().'/img/contents/' . $request->content_slug;
            if(!file_exists($path)){
                File::makeDirectory($path, $mode = 0777, true, true);
                File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
            }
                $imageName = $request->content_slug .'-'. time();
                $image_name = $imageName.'.'.explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                \Image::make($request->image)->save($path.'/'.$image_name);

            return ['message'=>'Image Uploaded'];

        }else{
            try{
                $slug = $this->createSlug($request->title,'');
            }catch (Exception $e) {
                /*report($e);
                return $e;*/
            }
            if($request->display == ''){
                $request->merge(['display' =>0]);
            }

            return Detail::create([
                'title' => $request['title'],
                'slug' => $slug,
                'content_slug' => $request['content_slug'],
                'display' => $request['display'],
                'excerpt' => $request['excerpt']
            ]);
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
        $detail = Detail::findOrFail($id);

        $slug = Str::slug($request->title);

        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->title, $request->id)]);
        }
        //return $request->slug;
        $detail->update($request->all());
        return ['message'=>'Detail Info Updated'];
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

        $detail = Detail::findOrFail($id);

        //delete the user
        $detail->delete();

        return ['message' =>'Detail Deleted'];
    }
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
        return Detail::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/

    public function getImages($slug){
        //$mainFolder = public_path().'/img/contents/' . $slug;
        $extensions = array(".jpg", ".png", ".gif",".jpeg",".JPEG", ".JPG", ".PNG", ".GIF");
        $src_folder = public_path().'/img/contents/' . $slug;
        $src_files = scandir($src_folder);
        $files = array();
        if(file_exists($src_folder)) {
            foreach ($src_files as $file) {
                $ext = strrchr($file, '.');
                if (in_array($ext, $extensions)) {
                    $thumb = $src_folder . '/thumbs/' . $file;
                    if (!file_exists($thumb)) {
                        array_push($files, $file);
                    }

                }
            }
        }
        return $files;
    }
    
    
}
