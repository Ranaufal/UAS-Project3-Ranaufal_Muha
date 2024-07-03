<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class isAdmin
{
    public function handle(Request $request, Closure $next)
    {
        // if (!Auth::guard('web')->check()) {
        if (!session("pegawai_id")) {
            return redirect('/login');
        }
        return $next($request);


        // if (Auth::check()) {
        //     return $next($request);
        // }
        // return redirect('/login');
        // abort(401);
    }
}
