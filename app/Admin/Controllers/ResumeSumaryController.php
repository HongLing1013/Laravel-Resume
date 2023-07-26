<?php

namespace App\Admin\Controllers;

use App\Models\ResumeSumary;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ResumeSumaryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '經歷簡介';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ResumeSumary());

        /* ============
         * 禁用篩選按鈕
         * 禁用導出按鈕
         * 禁用行選擇器
         * 禁用列選擇器
         * 禁用分頁功能
         * 禁用新增按鈕
         * 禁用刪除按鈕
         * ============ */
        $grid->disableFilter();
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableColumnSelector();
        $grid->disablePagination();
        $grid->disableCreateButton();
        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableDelete();
        });

        $grid->column('name', __('名字'));
        $grid->column('address', __('地址'));
        $grid->column('phone', __('電話'));
        $grid->column('email', __('Email'));
        $grid->column('summary', __('簡介'));
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
        $show = new Show(ResumeSumary::findOrFail($id));

        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('phone', __('Phone'));
        $show->field('email', __('Email'));
        $show->field('summary', __('Summary'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new ResumeSumary());

        $form->text('name', __('Name'));
        $form->text('address', __('Address'));
        $form->mobile('phone', __('Phone'));
        $form->email('email', __('Email'));
        $form->text('summary', __('Summary'));

        return $form;
    }
}
