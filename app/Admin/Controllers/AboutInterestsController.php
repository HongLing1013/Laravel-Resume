<?php

namespace App\Admin\Controllers;

use App\Models\AboutInterests;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AboutInterestsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '興趣列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutInterests());

        $grid->column('id', __('Id'));
        $grid->column('name', __('興趣'));
        $grid->column('icon', __('Icon'));
        $grid->column('color', __('顏色'));
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
        $show = new Show(AboutInterests::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('興趣'));
        $show->field('icon', __('Icon'));
        $show->field('color', __('顏色'));
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
        $form = new Form(new AboutInterests());

        $form->text('name', __('興趣'));
        $form->text('icon', __('Icon'));
        $form->color('color', __('顏色'));

        if($form->isCreating()){
            $form->hidden('acid')->default('4');
        }

        return $form;
    }
}
