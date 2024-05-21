<?php

namespace App\Models;

use App\Models\Author;
use App\Models\BorrowedBook;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    protected $primaryKey = 'BookID';
    protected $fillable = ['PublishedDate', 'Title', 'AvailableCopies', 'ISBN', 'TotalCopies', 'AuthorID', 'BookCover_Image',];

    public function author()
    {
        return $this->belongsTo(Author::class, 'AuthorID');
    }

    public function borrowedBooks()
    {
        return $this->hasMany(BorrowedBook::class, 'BookID');
    }
}
