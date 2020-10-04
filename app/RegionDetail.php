<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RegionDetail extends Model
{
    protected $fillable = [
        'title','slug','display_image','content_slug','display','excerpt'
    ];
}
