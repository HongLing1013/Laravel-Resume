<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;

class BatchRestore extends BatchAction
{
    public $name = '批量恢復';

    public function handle(Collection $collection)
    {
        // foreach ($collection as $model) {
        //     // ...
        // }
        $collection->each->restore();

        return $this->response()->success('Success message...')->refresh();
    }

}