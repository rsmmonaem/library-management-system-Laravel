<?php

namespace App\Http\Controllers;

use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;

class MemberController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $members = Member::all();
        return response()->json($members);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'PhoneNumber' => 'required',
            'FirstName' => 'required',
            'LastName' => 'required',
            'Email' => 'required|email|unique:members',
            'RegistrationDate' => 'required|date',
            'password' => 'required|min:6',
        ]);

        $member = Member::create([
            'PhoneNumber' => $request->PhoneNumber,
            'FirstName' => $request->FirstName,
            'LastName' => $request->LastName,
            'Email' => $request->Email,
            'RegistrationDate' => $request->RegistrationDate,
            'password' => Hash::make($request->password),
        ]);
        $user = User::create([
            'Email' => $request->Email,
            'password' => Hash::make($request->password),
            'user_type' => 'member',
        ]);
        return response()->json(['success' => true, 'member' => $member], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($MemberID)
    {
        $members = Member::where('MemberID', $MemberID)->first();
        return response()->json($members);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
