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
        Schema::create('employees', function (Blueprint $table) {
            $table->id();           
            $table->string('first_name', 255)->nullable();
            $table->string('contact_no',12)->nullable();
            $table->string('email',255)->nullable();
            $table->string('address_line_1',255)->nullable();
            $table->foreignId('department_id', 11)->nullable();
            $table->foreignId('designation_id', 11)->nullable();
            $table->string('state',20)->nullable();
            $table->string('city',20)->nullable();
            $table->date('dob')->nullable();
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
        Schema::dropIfExists('employees');
    }
};
