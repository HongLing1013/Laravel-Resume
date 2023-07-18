<?php

namespace App\Http\Controllers;

use App\Models\Indextext;
use App\Models\Menu;
use App\Models\PortfolioCategory;
use App\Models\ResumeCategory;
use App\Models\Service;
use App\Models\Social;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $menus = Menu::all();
        $indextext = Indextext::where('id' , 1)->first();
        $social = Social::all();
        $categories = PortfolioCategory::with('portfolio')->get();
        $service = Service::all();
        $resumes = ResumeCategory::with('resumeEduction', 'resumeExperience', 'resumeSumary')->get();

        return view('index', [ 'menus' => $menus , 'indexText' => $indextext , 'social' => $social , 'categories' => $categories , 'services' => $service , 'resumes' => $resumes ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
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
