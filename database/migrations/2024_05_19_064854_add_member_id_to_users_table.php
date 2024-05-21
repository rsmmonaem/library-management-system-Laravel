<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->bigInteger('MemberID')->unsigned()->nullable();
            $table->foreign('MemberID')->references('MemberID')->on('members')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['MemberID']);
            $table->dropColumn('MemberID');
        });
    }
};
