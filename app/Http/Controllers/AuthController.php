<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user()->load('member');

            try {
                $token = $user->createToken('authToken')->plainTextToken;
                $msg = "Successfully Logged in";
                return response()->json(['success' => true,'token' => $token,'msg'=>$msg, 'user' => $user], 201);
            } catch (\Exception $e) {
                return response()->json(['success' => false, 'message' => 'Failed to create token', 'error' => $e->getMessage()], 500);
            }
        } else {
            return response()->json(['success' => false, 'message' => 'Unauthorized'], 401);
        }

    }


    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return response()->json(['message' => 'Logged out']);
    }
}
