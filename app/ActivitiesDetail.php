<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActivitiesDetail extends Model
{
    protected $fillable = [
        'title','slug','content_slug','display','excerpt'
    ];
}
