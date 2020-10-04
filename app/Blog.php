<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Blog extends Model
{
    protected $fillable = [
        'title','slug','image','author','date','display','order_item','meta_keywords','meta_tags','meta_categories','excerpt'
    ];
}
