<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Sliders extends Model
{
    protected $fillable = [
        'title','slug','sub_title','image','display','order_item','link'
    ];
}
