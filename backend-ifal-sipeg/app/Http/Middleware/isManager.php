<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class isManager
{
    public function handle(Request $request, Closure $next)
    {

        if (session("hak_akses") != 1) {
            abort(401);
        }
        return $next($request);
    }
}
