<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenusTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('menus', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('menu_id');
            $table->string('title');
            $table->string('slug')->unique();
            $table->string('image')->default('no-image.png')->nullable();
            $table->string('icon')->nullable();
            $table->tinyInteger('type')->default(0);
            $table->tinyInteger('display')->default(0);
            // $table->tinyInteger('internet')->default(0);
            // $table->tinyInteger('pool')->default(0);
            // $table->tinyInteger('cleaning')->default(0);
            // $table->string('duration')->default('1D/2N');
            // $table->integer('price')->default('80');
            // $table->string('transportation')->default('Tourist Bus');

            $table->bigInteger('parent_id')->default(0);
            $table->tinyInteger('child')->default(0);
            $table->bigInteger('order_item')->nullable();
            $table->longText('excerpt')->nullable();
            $table->timestamps();
        });
        //Schema::rename('tbl_menus', 'menus');
        //Schema::drop('tbl_menus');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('menus');
    }
}
