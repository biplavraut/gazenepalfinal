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
            $table->tinyInteger('display')->default(0);
            $table->string('duration');
            $table->string('altitude');
            $table->longText('menu_categories')->nullable();
            $table->longText('best_season')->nullable();
            $table->longText('difficulty')->nullable();
            $table->longText('group_size')->nullable();
            $table->longText('types')->nullable();
            $table->bigInteger('order_item')->nullable();
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
