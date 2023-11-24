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
        Schema::table('employees', function (Blueprint $table) {
            $table->string('middle_name', 50)->nullable()->after('first_name');
            $table->string('last_name', 50)->nullable()->after('middle_name');
            $table->date('date_of_joining')->nullable()->after('designation_id');
            $table->string('country', 50)->nullable()->after('date_of_joining');
            $table->integer('pincode')->unsigned()->nullable()->after('city');
            $table->string('address_line_2', 255)->nullable()->after('address_line_1');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('employees', function (Blueprint $table) {
            //
        });
    }
};
