<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Region extends Model
{
    protected $fillable = [
        'title','slug','image','display_image','map','cover_image','menu_categories','elevation','display','featured','top_trending','trip_of_month','rating','departure_date','price','discount','duration','difficulty','best_season','altitude','types','group_size','order_item','meta_title','meta_keywords','meta_tags','meta_categories','excerpt'
    ];
}
