<?php

namespace App\Admin\Controllers;

use App\Models\AboutCounts;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AboutCountsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '好評數量';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutCounts());

        $grid->column('id', __('Id'))->hide();
        $grid->column('name', __('好評分類'));
        $grid->column('icon', __('Icon'));
        $grid->column('int', __('數量'));
        $grid->column('created_at', __('創建時間'));
        $grid->column('updated_at', __('更新時間'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(AboutCounts::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('好評分類'));
        $show->field('icon', __('Icon'));
        $show->field('int', __('數量'));
        $show->field('created_at', __('創建時間'));
        $show->field('updated_at', __('更新時間'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new AboutCounts());

        $form->text('name', __('好評分類'));
        $form->text('icon', __('Icon'));
        $form->text('int', __('數量'));

        if($form->isCreating()){
            $form->hidden('acid')->default('2');
        }

        return $form;
    }
}
