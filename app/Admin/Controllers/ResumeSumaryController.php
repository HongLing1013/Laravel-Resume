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

        /* ============
         * 禁用刪除按鈕
         * ============ */
        $show->panel()->tools(function($tools) {
            $tools->disableDelete();
        });

        $show->field('name', __('名字'));
        $show->field('address', __('地址'));
        $show->field('phone', __('電話'));
        $show->field('email', __('Email'));
        $show->field('summary', __('簡介'))->unescape();
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
        $form = new Form(new ResumeSumary());

        /* ==================
         * 禁用上方刪除按鈕
         * ================== */
        $form->tools(function (Form\Tools $tools) {
            $tools->disableDelete();
        });

        /* ==================
         * 禁用下方查看按鈕
         * 禁用下方編輯按鈕
         * 禁用下方繼續創建按鈕
         * ================== */
        $form->footer(function ($footer) {
            $footer->disableViewCheck();
            $footer->disableEditingCheck();
            $footer->disableCreatingCheck();
        });
        
        $form->text('name', __('名字'));
        $form->text('address', __('地址'));
        $form->mobile('phone', __('電話'));
        $form->email('email', __('Email'));
        $form->text('summary', __('簡介'));

        return $form;
    }
}
