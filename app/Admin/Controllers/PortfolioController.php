<?php

namespace App\Admin\Controllers;

use App\Models\Portfolio;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PortfolioController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '作品列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Portfolio());

        $grid->column('id', __('Id'))->hide();
        $grid->column('pcid', __('分類'));
        $grid->column('text', __('標題'));
        $grid->column('image', __('圖片連結'));
        $grid->column('href', __('網址'));
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
        $show = new Show(Portfolio::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('pcid', __('分類'));
        $show->field('text', __('標題'));
        $show->field('image', __('圖片'));
        $show->field('href', __('網址'));
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
        $form = new Form(new Portfolio());

        $form->number('pcid', __('分類'));
        $form->text('text', __('標題'));
        $form->image('image', __('圖片'));
        $form->url('href', __('網址'));

        return $form;
    }
}
