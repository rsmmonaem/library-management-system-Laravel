<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Book;
class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $books = Book::with('author')->get();
        return response()->json($books);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $book = Book::create($request->all());
            return response()->json(['success' => true, 'book' => $book], 201);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to create author', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Display the specified resource.
     */

    public function show($BookID)
    {
        try {
            $Books = Book::with('author')->where('BookID', $BookID)->first();
            return response()->json(['success' => true, 'book' => $Books]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Author not found', 'error' => $e->getMessage()], 404);
        }
    }
    public function by_author($slug)
    {
        $Books = Book::where('AuthorID', $slug)->get();
        return response()->json($Books);

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $book = Book::findOrFail($id);
            $book->update($request->all());
            return response()->json(['success' => true, 'book' => $book], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to update book', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $Book = Book::findOrFail($id);
            $Book->delete();
            return response()->json(['success' => true, 'message' => 'Book deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to delete book', 'error' => $e->getMessage()], 500);
        }
    }
}
