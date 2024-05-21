<?php

namespace App\Http\Controllers;
use App\Models\Author;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class AuthorController extends Controller
{
    public function index()
    {
        return response()->json(Author::all());
    }

    public function store(Request $request)
    {
        try {
            $author = Author::create($request->all());
            return response()->json(['success' => true, 'author' => $author], 201);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to create author', 'error' => $e->getMessage()], 500);
        }
    }

    public function show($AuthorID)
    {
        try {
            $author = Author::findOrFail($AuthorID);
            return response()->json(['success' => true, 'author' => $author]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Author not found', 'error' => $e->getMessage()], 404);
        }
    }

    public function update(Request $request, $AuthorID)
    {
        try {
            $author = Author::findOrFail($AuthorID);
            $author->update($request->all());
            return response()->json(['success' => true, 'author' => $author], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to update author', 'error' => $e->getMessage()], 500);
        }
    }

    public function destroy($AuthorID)
    {
        try {
            $author = Author::findOrFail($AuthorID);
            $author->delete();
            return response()->json(['success' => true, 'message' => 'Author deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to delete author', 'error' => $e->getMessage()], 500);
        }
    }
}

