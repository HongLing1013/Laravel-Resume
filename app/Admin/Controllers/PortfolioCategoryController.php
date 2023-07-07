<?php

namespace App\Admin\Controllers;

use App\Models\PortfolioCategory;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PortfolioCategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '作品分類';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PortfolioCategory());

        /* ===================
         * 禁用篩選按鈕
         * 禁用匯出按鈕
         * 禁用列選擇器
         * 禁用行選擇器
         * =================== */
        $grid->disableFilter();
        $grid->disableExport();
        $grid->disableColumnSelector();
        $grid->disableRowSelector();

        $grid->column('id', __('Id'))->hide();
        $grid->column('name', __('分類名稱'));
        $grid->column('created_at', __('創建時間'))->hide();
        $grid->column('updated_at', __('更新時間'))->display(function ($updated_at) {
            return date('Y-m-d H:i:s' , strtotime($updated_at));
        })->sortable();

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
        $show = new Show(PortfolioCategory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('分類名稱'));
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
        $form = new Form(new PortfolioCategory());

        /* ===================
         * 編輯時禁用刪除按鈕
         * 編輯時禁用顯示按鈕
         * 禁用查看 checkbox
         * 禁用繼續創建 checkbox
         * 禁用繼續編輯 checkbox
         * =================== */
        if($form->isEditing())
        {
            $form->tools(function (Form\Tools $tools) 
            {
                $tools->disableDelete();
                $tools->disableView();
            });
        }
        $form->disableViewCheck();
        $form->disableCreatingCheck();
        $form->disableEditingCheck();

        $form->text('name', __('分類名稱'));

        return $form;
    }
}
