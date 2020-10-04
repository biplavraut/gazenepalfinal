<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Seo extends Model
{
    protected $fillable = [
        'title','keyword','subject','topic','summary','classification','category','excerpt'
    ];
}
