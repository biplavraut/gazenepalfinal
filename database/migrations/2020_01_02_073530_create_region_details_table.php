<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRegionDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('region_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->string('display_image')->default('no-display-image.png')->nullable();
            $table->string('slug')->unique();
            $table->string('content_slug');
            $table->tinyInteger('display')->default(0);
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
        Schema::dropIfExists('region_details');
    }
}