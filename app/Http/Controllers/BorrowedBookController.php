<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\BorrowedBook;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class BorrowedBookController extends Controller
{
    public function index()
    {
        $borrowedBooks = BorrowedBook::with('member', 'book')->get();
        return response()->json($borrowedBooks);
    }

    public function store(Request $request)
    {
        $request->validate([
            'MemberID' => 'required',
            'BookID' => 'required',
        ]);

        try {
            // Check if the member has already borrowed the same book
            $existingBorrowedBook = BorrowedBook::where('MemberID', $request->MemberID)
                ->where('BookID', $request->BookID)
                ->where('Status', 'Borrowed')
                ->first();

            if ($existingBorrowedBook) {
                // Member has already borrowed the same book, return error
                return response()->json(['success' => false, 'message' => 'You have already borrowed this book.'], 400);
            }

            // Create the borrowed book
            $borrowedBook = BorrowedBook::create($request->all());

            // Decrement the AvailableCopies of the corresponding book
            $book = Book::find($request->BookID);
            if ($book) {
                $book->decrement('AvailableCopies');
            }

            return response()->json(['success' => true, 'borrowedBook' => $borrowedBook], 201);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to create borrowed book', 'error' => $e->getMessage()], 500);
        }
    }

    public function returnBook(Request $request, $borrowID, $memberID)
    {
        try {
            $borrowedBook = BorrowedBook::findOrFail($borrowID);

            // Check if the book has already been returned
            if ($borrowedBook->Status === 'Returned') {
                return response()->json(['success' => false, 'message' => 'Book has already been returned.'], 400);
            }

            // Check if the member ID matches the borrower's member ID
            if ($borrowedBook->MemberID != $memberID) {
                return response()->json(['success' => false, 'message' => 'You are not authorized to return this book.'], 403);
            }

            // Update the status to 'Returned'
            $borrowedBook->update(['Status' => 'Returned']);

            // Increment the AvailableCopies of the corresponding book
            $book = Book::find($borrowedBook->BookID);
            if ($book) {
                $book->increment('AvailableCopies');
            }

            return response()->json(['success' => true, 'message' => 'Book returned successfully.'], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to return book.', 'error' => $e->getMessage()], 500);
        }
    }


    public function show($BorrowID)
    {
        try {
            $borrowed_book = BorrowedBook::where('BorrowID', $BorrowID)->first();
            return response()->json(['success' => true, 'borrowed_book' => $borrowed_book]);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Borrowed book not found', 'error' => $e->getMessage()], 404);
        }
    }

    public function update(Request $request, $BorrowID)
    {
        try {
            $borrowedBook = BorrowedBook::findOrFail($BorrowID);

            //original status before the update
            $originalStatus = $borrowedBook->Status;

            // Update the borrowed book
            $borrowedBook->update($request->all());

            // Check if the status has changed
            if ($originalStatus !== $borrowedBook->Status) {

                if ($originalStatus !== 'Borrowed' && $borrowedBook->Status === 'Borrowed') {
                    $book = Book::find($borrowedBook->BookID);
                    if ($book) {
                        $book->decrement('AvailableCopies');
                    }
                } elseif ($originalStatus !== 'Returned' && $borrowedBook->Status === 'Returned') {
                    $book = Book::find($borrowedBook->BookID);
                    if ($book) {
                        $book->increment('AvailableCopies');
                    }
                }
            }

            return response()->json(['success' => true, 'borrowedBook' => $borrowedBook], 200);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to update', 'error' => $e->getMessage()], 500);
        }
    }


    public function destroy($BorrowID)
    {
        try {
            $borrowedBook = BorrowedBook::findOrFail($BorrowID);
            $borrowedBook->delete();
            return response()->json(['success' => true, 'message' => 'Deleted successfully']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Failed to delete author', 'error' => $e->getMessage()], 500);
        }
    }
}
