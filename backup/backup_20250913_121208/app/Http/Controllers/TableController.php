<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class TableController extends Controller
{
    public function tableData()
    {
        return view('table/tableData');
    }

    public function tableUsers()
    {
        // Fetch users from database
        $users = User::orderBy('display_name')->get();

        return view('table/tableUsers', compact('users'));
    }


}
