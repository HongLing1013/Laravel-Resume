<?php

namespace App\Admin\Controllers;

use App\Models\AboutSkills;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AboutSkillsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '技能列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutSkills());

        /* ============
         * 禁用篩選按鈕
         * 禁用導出按鈕
         * 禁用行選擇器
         * 禁用列選擇器
         * ============ */

        $grid->disableFilter();
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableColumnSelector();

        $grid->column('id', __('Id'))->hide();
        $grid->column('name', __('技能'));
        $grid->column('degree', __('程度'))->progressBar($style = 'info' , $size = 'sm' , $max = 100)->sortable();
        $grid->column('created_at', __('創建時間'))->sortable();
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
        $show = new Show(AboutSkills::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('技能'));
        $show->field('degree', __('程度'));
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
        $form = new Form(new AboutSkills());

        /* ===================
         * 編輯時禁用刪除按鈕
         * 編輯時禁用顯示按鈕
         * 禁用查看 checkbox
         * 禁用繼續創建 checkbox
         * 禁用繼續編輯 checkbox
         * =================== */
        if($form->isEditing()){
            $form->tools(function (Form\Tools $tools) {
                $tools->disableDelete();
                $tools->disableView();
            });
        }
        $form->disableViewCheck();
        $form->disableCreatingCheck();
        $form->disableEditingCheck();

        $form->text('name', __('技能'));
        $form->number('degree', __('程度'));

        if($form->isCreating()){
            $form->hidden('acid')->default('3');
        }

        return $form;
    }
}
