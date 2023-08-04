<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Portfolio extends Model
{
    use SoftDeletes;

    protected $fillable = [ 'pcid' , 'text' , 'image' , 'href' , 'deleted_at' ];

    public function portfolioCategory()
    {
        return $this->belongsTo(PortfolioCategory::class , 'pcid');
    }
}
