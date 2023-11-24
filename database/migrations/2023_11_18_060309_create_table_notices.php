<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('notices', function (Blueprint $table) {
            $table->id();
            $table->string('sr_no', 20)->nullable();
            $table->date('notice_date')->nullable();
            $table->string('notice', 255)->nullable();
            $table->foreignId('department_id', 11)->nullable();
            $table->foreignId('designation_id', 11)->nullable();
            $table->string('attachment',255)->nullable();
            $table->text('description')->nullable();
            $table->integer('created_by')->unsigned()->nullable();
            $table->integer('updated_by')->unsigned()->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('notices');
    }
};
