<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Str;
use App\Testimonials;

class TestimonialController extends Controller
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

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required|string|max:191',
        ]);

        try{
            $slug = $this->createSlug($request->name,'');
        }catch (Exception $e) {
            /*report($e);
            return $e;*/
        }
        if($request->image != ""){
            $upload = $this->uploadImage($request->image, $slug);
            $image = $upload;
        }

        $order = Testimonials::max('order_item')+1;
        if($request->display == ''){
            $request->merge(['display' =>0]);
        }

        return Testimonials::create([
            'name' => $request['name'],
            'slug' => $slug,
            'image' => $image,
            'display' => $request['display'],
            'order_item' => $order,
            'country' => $request['country'],
            'date' => $request['date'],
            'client_posts' => $request['client_posts'],
            'trip_testimonial' => json_encode($request['trip_testimonial']),
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
        $this->validate($request,[
            'name' => 'required|string|max:191',
        ]);
        $content = Testimonials::findOrFail($id);

        $slug = Str::slug($request->name);
        if ($request->slug != $slug){
            $request->merge(['slug' => $this->createSlug($request->name, $request->id)]);
        }
        if($request->image){
            $old_image = json_decode(Testimonials::select('image')->where('id', 'like', $request->id)->get()->first());
            $old_image =  $old_image->image;
            if($request->image != $old_image){
                $userPhoto = public_path('img/testimonial/').$old_image;
                $userThumb = public_path('img/testimonial/thumbs/').$old_image;
                if(file_exists($userPhoto)){
                    unlink($userPhoto);
                    unlink($userThumb);
                }
                $upload = $this->uploadImage($request->image, $slug);
                $image = $upload;
                $request->merge(['image' => $image]);
            }
        }
        $trip_testimonial = json_encode($request['trip_testimonial']);
        $request->merge(['trip_testimonial' => $trip_testimonial]);

        $content->update($request->all());
        return ['message'=>'Testimonial Updated'];
    }
    public function orderTestimonial(Request $request){
        $newlist = $request->newtestimonial;
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

        $content = Testimonials::findOrFail($id);

        //delete the user
        $content->delete();

        return ['message' =>'Testimonial Deleted'];
    }

    //search
    public function search(){

        if($search = \Request::get('q')){
            $testimonials = Testimonials::where(function($query) use($search){
                $query->where('name','LIKE',"%$search%");
            })->get();
        }else{
            $testimonials = Testimonials::latest()->get();

        }
        return $testimonials;

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
        return Testimonials::select('slug')->where('slug', 'like', $slug.'%')
            ->where('id', '<>', $id)
            ->get();
    }
    /*End of generating Unique slug*/

    /*Generating list to display*/

    protected function getFullListFromDB()
    {
        return Testimonials::orderBy("order_item")->get();
    }

    public function uploadImage($img, $img_name)
    {

        /*Upload the image in server*/
        //$currentPhoto = $testimonials->image;
        //$slug = Str::slug($request->name);

        $imageName = $img_name;

        $name = $imageName.'.'.explode('/',explode(':', substr($img, 0, strpos($img, ';')))[1])[1];
        \Image::make($img)->save(public_path('img/testimonial/').$name);
        \File::makeDirectory('img/testimonial/thumbs', $mode = 0777, true, true);//making directory
        \Image::make($img)->fit(100, 100)->save(public_path('img/testimonial/thumbs/').$name);//resize image

        return $name;

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
        $testimonial = Testimonials::findOrFail($id);
        if ($testimonial){
            return Testimonials::where('id', '=', $id)->update(['order_item' => $m_order]);
        }

    }
    protected function updateParent($child, $id)
    {

        return Testimonials::where('id', '=', $id)->update(['child'=> $child]);
    }
}
