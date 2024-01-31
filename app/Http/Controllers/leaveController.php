<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB as DB;
use Illuminate\Support\Facades\Session as Session;

class leaveController extends Controller
{
    public function namefun()
    {
        $res = DB::table('employee')->get();
        return response()->json($res);
    }

    public function leavefun()
    {
        $res = DB::table('leave_master')->get();
        return response()->json($res);
    }

    public function totalfun(Request $request)
    {
        $input = $request->all();
        $res = DB::table('leave_emp_assign')
            ->select('no_of_leave')
            ->where('emp_id', $input['eid'])
            ->where('leave_id', $input['lid'])
            ->first();
        return response()->json($res);
    }

    public function leaveform(Request $request)
    {
        $input = $request->all();
        $date = date("Y-m-d");

        DB::table('leave_apply')->insert([
            'emp_id' => $input['ename'],
            'date_of_leave' => $date,
            'leave_id' => $input['ltype'],
            'num_of_leave' => $input['aleave']
        ]);

        $res = $input['total'] - $input['aleave'];

        DB::table('leave_emp_assign')
            ->where('emp_id', $input['ename'])
            ->where('leave_id', $input['ltype'])
            ->update(['no_of_leave' => $res]);
        $message = "Leave Applied...!!";
        return view('index', ['message' => $message]);
    }
}
