<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contents', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('slug')->unique();
            $table->string('image')->default('no-image.png')->nullable();
            $table->string('map')->default('map.png')->nullable();
            $table->string('display_image')->default('no-display-image.png')->nullable();
            $table->string('cover_image')->default('no-cover-image.png')->nullable();
            $table->tinyInteger('display')->default(0)->nullable();
            $table->tinyInteger('featured')->default(0)->nullable();
            $table->tinyInteger('top_trending')->default(0)->nullable();
            $table->tinyInteger('trip_of_month')->default(0)->nullable();
            $table->tinyInteger('rating')->default(10)->nullable();
            $table->string('accommodatiom')->default('hotel')->nullable();
            $table->string('departure_date')->nullable();
            $table->string('price')->nullable();
            $table->integer('discount')->nullable();
            $table->string('duration')->nullable();
            $table->string('altitude')->nullable();
            $table->longText('menu_categories')->nullable();
            $table->longText('best_season')->nullable();
            $table->longText('difficulty')->nullable();
            $table->longText('group_size')->nullable();
            $table->longText('types')->nullable();
            $table->bigInteger('order_item')->nullable();
            $table->Text('meta_title')->nullable();
            $table->longText('meta_keywords')->nullable();
            $table->longText('meta_tags')->nullable();
            $table->longText('meta_categories')->nullable();
            $table->longText('excerpt')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('contents');
    }
}
