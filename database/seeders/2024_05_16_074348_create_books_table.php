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
        Schema::create('books', function (Blueprint $table) {
            $table->id('BookID');
            $table->date('PublishedDate');
            $table->string('Title');
            $table->integer('AvailableCopies');
            $table->string('ISBN');
            $table->integer('TotalCopies');
            $table->foreignId('AuthorID')->constrained('authors', 'AuthorID');
            $table->string('BookCover_Image')->nullable();
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('books');
    }
};
