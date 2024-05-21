<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class BorrowedBook extends Model
{
    protected $primaryKey = 'BorrowID';
    protected $fillable = ['BorrowDate', 'ReturnDate', 'Status', 'MemberID', 'BookID'];

    public function member()
    {
        return $this->belongsTo(Member::class, 'MemberID');
    }

    public function book()
    {
        return $this->belongsTo(Book::class, 'BookID');
    }
}

