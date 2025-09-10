<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TableController extends Controller
{
    public function tableData()
    {
        return view('table/tableData');
    }

    public function tableUsers()
    {
        // Data statis dulu untuk testing
        $users = collect([
            (object)[
                'id' => 1,
                'display_name' => 'Akbar',
                'full_name' => 'Fajar Achmad Akbar',
                'email' => 'akbar@powerpro.co.id',
                'tier' => 'Tier 3',
                'user_role' => 'User',
                'start_work' => '2017-03-09',
                'birthday' => '1994-12-02'
            ],
            (object)[
                'id' => 2,
                'display_name' => 'Komeng',
                'full_name' => 'Rudianto',
                'email' => 'pms@powerpro.id',
                'tier' => 'Tier 3',
                'user_role' => 'Administrator',
                'start_work' => '2010-04-05',
                'birthday' => '1990-01-01'
            ]
        ]);

        return view('table/tableUsers', compact('users'));
    }

    
}
