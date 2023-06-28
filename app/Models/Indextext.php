<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Indextext extends Model
{
    use HasFactory;

    protected $table = 'indextext';
    protected $primaryKey = 'id';
    public $timetamps = true;
    
}
