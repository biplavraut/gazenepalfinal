<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Blog;
use App\Sliders;
use App\Menu;
use App\Contents;
use App\Detail;
use App\Region;
use App\RegionDetail;
use App\Activities;
use App\ActivitiesDetail;






class FrontController extends Controller
{
    public function list()
    {
        $sliders = Sliders::get()->sortBy('order_item');
        $regions = Region::get()->sortBy('order_item')->take(8);
        $activities = Activities::get()->sortBy('order_item');
        $blogs = Blog::get()->sortBy('order_item');
        
        //dd($blog);
        return view('frontend.index' , 
        [
            'region_list' => $regions,
            'sliders_list' => $sliders,
            'activities_list' => $activities,
            'blog_list' => $blogs


        ]);
    }
    public function slug($slug)
    {
        $activities = Activities::get()->sortByDesc('order_item');
        $regions = Region::get()->sortBy('order_item')->take(8);
        return view('frontend.regiondetail' , 
        [
            'region_list' => $regions,
            'activities_list' => $activities,

        ]);
    }
    public function region()
    {
        $regions = Region::get()->sortBy('order_item')->take(8);
        return view('frontend.region' , 
        [
            'regions' => $regions,
        ]);
    }
}
