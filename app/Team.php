<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    protected $fillable = [
        'title','member_posts','facebook_link','slug','image','display','order_item','instagram_link','excerpt',
    ];
}
