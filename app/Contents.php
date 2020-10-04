<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Contents extends Model
{
    protected $fillable = [
        'title','slug','image','map','display_image','cover_image','menu_categories','display','featured','top_trending','trip_of_month','rating','accommodatiom','departure_date','price','discount','duration','difficulty','best_season','altitude','types','group_size','order_item','meta_title','meta_keywords','meta_tags','meta_categories','excerpt'
    ];
}
