<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use App\Blog;
use App\Sliders;


class BlogController extends Controller
{
    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list()
    {
        $slider = Sliders::latest()->paginate(10);
        $blog = Blog::get();

        //dd($blog);
        return view('index' , ['blog_list' => $blog, 'slider_list' => $slider]);
    }
    // public function list()
    // {
         // $list = Blog::latest()->paginate(10);
        // //dd($list);
         // return view('index' , ['item_list' => $list]);



    // }
    public function index()
    {
            // The current user can update the post...
            $final_result =  $this->getFullListFromDB();
            return $final_result;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try{
            $slug = $this->createSlug($request->title,'');
        }catch (Exception $e) {
            /*report($e);
            return $e;*/
        }
        $path = public_path().'/img/blog';
        if(!file_exists($path)){
            File::makeDirectory($path, $mode = 0777, true, true);
            File::makeDirectory($path . '/thumbs', $mode = 0777, true, true);
        }
        if ($request->image){
            $extension = explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
            $imageName = $slug;
            $image_name = $imageName.'.'.$extension;
            \Image::make($request->image)->save($path.'/'.$image_name);
            resize_crop_image(60, 60, $path."/". $image_name, $path."/thumbs/rect_" . $image_name, $extension);
            resize_crop_image(720, 405, $path."/". $image_name, $path."/thumbs/" . $image_name, $extension);
                $request->merge(['image' => $image_name]);
        }else{
            $image_name = "no-image.png";
        }
        $order = Blog::max('order_item')+1;
        if($request->display == ''){
            $request->merge(['display' =>0]);
        }

        return Blog::create([
            'title' => $request['title'],
            'slug' => $slug,
            'image' => $image_name,
            'author' => $request['author'],
            'date' => $request['date'],
            'display' => $request['display'],
            'meta_keywords' => $request['meta_keywords'],
            'meta_tags' => $request['meta_tags'],
            'meta_categories' => $request['meta_categories'],
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
        $content = Blog::findOrFail($id);

        $slug = Str::slug($request->title);
        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->title, $request->id)]);
        }
        if($request->image){
            $old_image = json_decode(Blog::select('image')->where('id', 'like', $request->id)->get()->first());
            $old_image =  $old_image->image;
            if($request->image != $old_image){
                $blogPhoto = public_path('img/blog/').$old_image;
                $blogThumb = public_path('img/blog/thumbs/').$old_image;
                if(file_exists($blogPhoto)){
                    unlink($blogPhoto);
                    unlink($blogThumb);
                }
                $path = public_path().'/img/blog';
                $extension = explode('/',explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];
                $imageName = $slug;
                $image_name = $imageName.'.'.$extension;
                \Image::make($request->image)->save($path.'/'.$image_name);
                resize_crop_image(60, 60, $path."/". $image_name, $path."/thumbs/rect_" . $image_name, $extension);
                resize_crop_image(720, 405, $path."/" . $image_name, $path."/thumbs/" . $image_name, $extension);
                $request->merge(['image' => $image_name]);
            }
        }
        //return $request->slug;
        $content->update($request->all());
        return ['message'=>'Blog Info Updated'];
    }
    public function ordercontent(Request $request){
        $newlist = $request->newblog;
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
        $content = Blog::findOrFail($id);
        $old_image = json_decode(Blog::select('image')->where('id', 'like', $id)->get()->first());
        $old_image =  $old_image->image;
        $blogPhoto = public_path('img/blog/').$old_image;
        $blogThumb = public_path('img/blog/thumbs/').$old_image;
        $blogThumbRect = public_path('img/blog/thumbs/rect_').$old_image;
            if(file_exists($blogPhoto)){
                unlink($blogPhoto);
                unlink($blogThumb);
                unlink($blogThumbRect);
            }
        $content->delete();

        

        return ['message' =>'Blog Deleted'];
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
        return Blog::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/

    /*Generating list to display*/

    protected function getFullListFromDB()
    {
        return Blog::orderBy("order_item")->get();
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
        $content = Blog::findOrFail($id);
        if ($content){
            return Blog::where('id', '=', $id)->update(['order_item' => $m_order]);
        }

    }
    protected function updateParent($child, $id)
    {

        return Blog::where('id', '=', $id)->update(['child'=> $child]);
    }
}
