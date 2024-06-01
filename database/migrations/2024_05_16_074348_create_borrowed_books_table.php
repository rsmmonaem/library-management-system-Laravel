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
        Schema::create('borrowed_books', function (Blueprint $table) {
            $table->id('BorrowID');
            $table->date('BorrowDate');
            $table->date('ReturnDate')->nullable();
            $table->enum('Status', ['Borrowed', 'Returned', 'Overdue']);
            $table->foreignId('MemberID')->constrained('members', 'MemberID');
            $table->foreignId('BookID')->constrained('books', 'BookID');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('borrowed_books');
    }
};
