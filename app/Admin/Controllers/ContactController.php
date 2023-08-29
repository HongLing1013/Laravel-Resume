<?php

namespace App\Admin\Controllers;

use App\Models\Contact;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ContactController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '聯絡我';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Contact());

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

        $grid->column('id', __('Id'))->hide();
        $grid->column('address', __('地址'));
        $grid->column('email', __('E-mail'));
        $grid->column('call', __('電話'));
        $grid->column('created_at', __('新增時間'))->sortable();
        $grid->column('updated_at', __('更新時間'))->sortable();

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
        $show = new Show(Contact::findOrFail($id));

        /* ============
         * 禁用刪除按鈕
         * ============ */
        $show->panel()->tools(function($tools) {
            $tools->disableDelete();
        });

        $show->field('id', __('Id'));
        $show->field('address', __('地址'));
        $show->field('email', __('E-mail'));
        $show->field('call', __('電話'));
        $show->field('created_at', __('新增時間'));
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
        $form = new Form(new Contact());

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

        $form->text('address', __('地址'));
        $form->email('email', __('E-mail'));
        $form->text('call', __('電話'));

        return $form;
    }
}
