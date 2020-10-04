<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Str;
use App\Seo;

class SeoController extends Controller
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
        if (\Gate::allows('isAdmin') || \Gate::allows('isEditor')) {
            // The current user can update the post...
            return seo::latest()->get();
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return seo::create([
            'title' => $request['title'],
            'keyword' => $request['keyword'],
            'subject' => $request['subject'],
            'topic' => $request['topic'],
            'summary' => $request['summary'],
            'classification' => $request['classification'],
            'categories' => $request['categories'],
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
    //Show user profile
    public function profile()
    {
        $seo = seo::findOrFail(1);
        return $seo;

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
        $seo = seo::findOrFail($id);

        $seo->update($request->all());
        return ['message'=>'seo  Updated'];
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {

    }
    public function updateSeo(Request $request)
    {

        $seo->update($request->all());
        return ['message'=>'seo  Updated'];
    }
}
