<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Testimonials extends Model
{
    protected $fillable = [
        'name','slug','image','display','order_item','country','client_posts','trip_testimonial','excerpt'
    ];
}
