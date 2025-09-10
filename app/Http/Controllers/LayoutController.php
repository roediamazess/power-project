<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class LayoutController extends Controller
{
    /**
     * Switch layout between horizontal and sidebar
     */
    public function switchLayout(Request $request)
    {
        $layout = $request->input('layout', 'horizontal');
        
        // Validate layout type
        if (!in_array($layout, ['horizontal', 'sidebar'])) {
            return response()->json(['error' => 'Invalid layout type'], 400);
        }
        
        // Store layout preference in session
        Session::put('layout_preference', $layout);
        
        return response()->json([
            'success' => true,
            'layout' => $layout,
            'message' => 'Layout switched to ' . $layout
        ]);
    }
    
    /**
     * Get current layout preference
     */
    public function getLayout()
    {
        $layout = Session::get('layout_preference', 'horizontal');
        
        return response()->json([
            'layout' => $layout
        ]);
    }
    
    /**
     * Reset layout to default
     */
    public function resetLayout()
    {
        Session::forget('layout_preference');
        
        return response()->json([
            'success' => true,
            'layout' => 'horizontal',
            'message' => 'Layout reset to default'
        ]);
    }
}




