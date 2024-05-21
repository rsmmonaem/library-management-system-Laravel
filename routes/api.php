<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\BookController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\BorrowedBookController;

// Authentication routes
Route::post('/login', [AuthController::class, 'login'])->name('login');


// Protected routes (requires authentication)
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::resource('members', MemberController::class);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    Route::get('books', [BookController::class, 'index']);
    Route::resource('authors', AuthorController::class);

});
Route::resource('members', MemberController::class);
Route::get('member/{MemberID}', [MemberController::class, 'show']);

Route::get('borrowed-books-list', [BorrowedBookController::class, 'index']);

Route::get('borrowed-books/{MemberId}', [BorrowedBookController::class, 'showByMember']);

Route::get('borrowed-book/{BorrowID}', [BorrowedBookController::class, 'show']);
Route::post('borrow-book', [BorrowedBookController::class, 'store']);
Route::put('borrowed-books/{borrowID}/return/{memberID}', [BorrowedBookController::class, 'returnBook']);
Route::patch('update-borrow-book/{BorrowID}', [BorrowedBookController::class, 'update']);
Route::delete('delete-borrow-book/{BorrowID}', [BorrowedBookController::class, 'destroy']);

Route::resource('authors', AuthorController::class);
Route::post('add_author', [AuthorController::class, 'store']);
Route::get('author/{AuthorID}', [AuthorController::class, 'show']);
Route::patch('update_author/{AuthorID}', [AuthorController::class, 'update']);
Route::delete('delete_author/{AuthorID}', [AuthorController::class, 'destroy']);


Route::post('add_book', [BookController::class, 'store']);
Route::get('books', [BookController::class, 'index']);
Route::get('book/{BookID}', [BookController::class, 'show']);
Route::get('books/author/{slug}', [BookController::class, 'by_author']);
Route::patch('update_book/{BookID}', [BookController::class, 'update']);
Route::delete('delete_book/{BookID}', [BookController::class, 'destroy']);
