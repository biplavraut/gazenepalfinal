<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::group(['middleware' => 'auth:api'], function() {
    Route::apiResources(['blog'=>'API\BlogController']);
    Route::get('findBlog','API\BlogController@search');
    Route::post('orderBlog','API\BlogController@ordercontent');


Route::apiResources(['user'=>'API\UserController']);
Route::get('profile','API\UserController@profile');
Route::get('findUser','API\UserController@search');
Route::put('profile','API\UserController@updateProfile');
Route::post('updatePassword','API\UserController@updatePassword');

Route::apiResources(['menu'=>'API\MenuController']);
Route::get('findMenu','API\MenuController@search');
Route::post('orderList','API\MenuController@orderlist');

Route::apiResources(['devmenu'=>'API\DevmenuController']);
Route::get('findDevmenu','API\DevmenuController@search');
Route::post('orderDevList','API\DevmenuController@orderlist');

Route::get('menuCatList','API\MenuController@allmenu');



Route::apiResources(['content'=>'API\ContentController']);
Route::get('findContent','API\ContentController@search');
Route::post('orderContent','API\ContentController@ordercontent');

//region

Route::apiResources(['regions'=>'API\RegionController']);
Route::get('findRegion','API\RegionController@search');
Route::post('orderRegion','API\RegionController@orderregion');
Route::post('regionDisplayImage','API\RegionController@displayimage');
Route::post('regionCoverImage','API\RegionController@coverimage');
Route::post('regionMap','API\RegionController@regionmap');



Route::apiResources(['regiondetail'=>'API\RegionsDetailController']);




//Activities
Route::apiResources(['activities'=>'API\ActivityController']);
Route::get('findActivity','API\ActivityController@search');
Route::post('orderActivity','API\ActivityController@orderactivity');
Route::post('activityDisplayImage','API\ActivityController@displayimage');
Route::post('activityCoverImage','API\ActivityController@coverimage');

Route::apiResources(['activitydetail'=>'API\ActivitiesDetailController']);


//trip detail
Route::apiResources(['detail'=>'API\DetailController']);
//Route::post('detail_add','API\DetailController@store');
/*Route::get('findContent','API\ContentController@search');
*/
Route::post('detailDisplayImage','API\ContentController@displayimage');
Route::post('detailCoverImage','API\ContentController@coverimage');
Route::post('contentMap','API\ContentController@map');



 Route::apiResources(['blog'=>'API\BlogController']);
 Route::get('findBlog','API\BlogController@search');
 Route::post('orderBlog','API\BlogController@ordercontent');

Route::apiResources(['contact'=>'API\ContactController']);
Route::get('findContact','API\ContactController@search');

Route::apiResources(['testimonial'=>'API\TestimonialController']);
Route::get('findTestimonial','API\TestimonialController@search');
Route::post('orderTestimonial','API\TestimonialController@orderTestimonial');
Route::get('contentList','API\ContentController@allcontent');
//Route::post('testimonial','API\TestimonialController@updateImage');

Route::apiResources(['slider'=>'API\SliderController']);
Route::get('findSlider','API\SliderController@search');
Route::post('orderSlider','API\SliderController@orderSlider');

Route::apiResources(['partner'=>'API\PartnerController']);
Route::get('findPartner','API\PartnerController@search');
Route::post('orderPartner','API\PartnerController@orderPartner');

Route::apiResources(['member'=>'API\TeamController']);
Route::get('findMember','API\TeamController@search');
Route::post('orderMember','API\TeamController@orderPartner');

Route::apiResources(['seo'=>'API\SeoController']);
Route::put('updateSeo','API\SeoController@updateSeo');
Route::get('updateseoprofile','API\SeoController@profile');

});
