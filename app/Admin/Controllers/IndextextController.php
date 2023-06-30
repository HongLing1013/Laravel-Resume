<?php

namespace App\Admin\Controllers;

use App\Models\Indextext;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class IndextextController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '首頁文案';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Indextext());

        /* ============
         * 禁用篩選按鈕
         * 禁用導出按鈕
         * 禁用行選擇器
         * 禁用新增按鈕
         * 禁用分頁功能
         * 禁用删除功能
         * ============ */
        $grid->disableFilter();
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableCreateButton();
        $grid->disablePagination();
        $grid->actions(function ($actions) {
            $actions->disableDelete();
        });

        $grid->column('id', __('Id'))->hide();
        $grid->column('title', __('Title'));
        $grid->column('content', __('Content'));
        $grid->column('created_at', __('創建時間'))->hide();
        $grid->column('updated_at', __('更新時間'))->display(function ($updated_at) {
            return date('Y-m-d H:i:s' , strtotime($updated_at));
        });

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
        $show = new Show(Indextext::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('content', __('Content'));
        $show->field('created_at', __('Created at'));
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
        $form = new Form(new Indextext());

        $form->text('title', __('Title'));
        $form->text('content', __('Content'));

        return $form;
    }
}
