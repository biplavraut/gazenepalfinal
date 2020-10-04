<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $fillable = [
        //'pool','cleaning','internet','price','duration','accmmodation','transportation',
        'menu_id','title','slug','image','icon','type','display','parent_id','child','order_item','excerpt'
    ];
}
