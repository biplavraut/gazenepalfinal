<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Devmenu extends Model
{
    protected $fillable = [
        'title','slug','image','icon','type','display','child','order_item','excerpt'
    ];
}
