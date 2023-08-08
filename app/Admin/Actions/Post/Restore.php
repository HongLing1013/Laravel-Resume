<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Restore extends RowAction
{
    public $name = '恢復';

    public function handle(Model $model)
    {
        $model->restore();
        
        return $this->response()->success('Success message.')->refresh();
    }

}