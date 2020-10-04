<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('index');
// });
// Route::get('/', 'API\BlogController@list');
Route::get('/', 'FrontController@list');

Route::get('/about', function(){
    return view('frontend.about');
});
Route::get('/contact', function(){
    return view('frontend.contact');
});
Route::get('/faq', function(){
    return view('frontend.faq');
});
Route::get('/terms', function(){
    return view('frontend.terms');
});
Route::get('/region', 'FrontController@region');

Route::get('/package', function(){
    return view('frontend.package');
});

Route::get('region-detail/{slug}','FrontController@slug');


Route::get('travelcms', 'Auth\LoginController@showLoginForm')->name('travelcms');
Route::post('travelcms', 'Auth\LoginController@login');
Route::post('logout', 'Auth\LoginController@logout')->name('logout');


Route::get('404',['as'=>'404','uses'=>'ErrorController@errorCode404']);




Route::get('/home', 'HomeController@index')->name('home');

Route::get('{path}', 'HomeController@index')->where('path','([A-z\/_.\d-]+)?');
