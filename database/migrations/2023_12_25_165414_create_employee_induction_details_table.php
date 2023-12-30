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
        Schema::create('employee_induction_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('induction_id', 11)->nullable();
            $table->foreignId('quiz_id', 11)->nullable();
            $table->string('answer', 255)->nullable();
            $table->enum('check', ['0', '1'])->nullable();
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
        Schema::dropIfExists('employee_induction_details');
    }
};
