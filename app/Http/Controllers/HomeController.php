<?php

namespace App\Http\Controllers;

use App\Models\AboutCategory;
use App\Models\Contact;
use App\Models\Indextext;
use App\Models\Menu;
use App\Models\Message;
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
        $abouts = AboutCategory::with('aboutAbout', 'aboutCounts', 'aboutInterests', 'aboutSkills', 'aboutTestimonials')->get();
        $contact = Contact::first();

        return view('index', [ 'menus' => $menus , 'indexText' => $indextext , 'socials' => $social , 'categories' => $categories , 'services' => $service , 'resumes' => $resumes , 'abouts' => $abouts , 'contact' => $contact ]);
    }

    public function message(){

        $message = Message::create([
            'name' => $_POST['name'],
            'email' => $_POST['email'],
            'subject' => $_POST['subject'],
            'message' => $_POST['message'],
            'status' => 0
        ]);

        if ($message) {
            return 'OK';
        } else {
            return '請再試一次';
        }

    }
}
