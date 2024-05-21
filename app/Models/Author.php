<?php
namespace App\Models;

use App\Models\Book;
use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    protected $primaryKey = 'AuthorID';
    protected $fillable = ['AuthorName', 'AuthorBio'];

    public function books()
    {
        return $this->hasMany(Book::class, 'AuthorID');
    }
}
