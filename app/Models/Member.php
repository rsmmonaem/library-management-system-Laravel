<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User;
use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    protected $primaryKey = 'MemberID';
    protected $fillable = ['PhoneNumber', 'FirstName', 'LastName', 'Email', 'RegistrationDate'];

    public function user()
    {
        return $this->hasOne(User::class, 'MemberID');
    }


}

