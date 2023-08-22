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
         * 禁用列選擇器
         * 禁用新增按鈕
         * 禁用分頁功能
         * 禁用删除功能
         * ============ */

        $grid->disableFilter();
        $grid->disableExport();
        $grid->disableRowSelector();
        $grid->disableColumnSelector();
        $grid->disableCreateButton();
        $grid->disablePagination();
        $grid->actions(function ($actions) {
            $actions->disableDelete();
        });

        $grid->column('id', __('Id'))->hide();
        $grid->column('title', __('標題'));
        $grid->column('content', __('內容'))->display(function ($content) {
            return html_entity_decode(nl2br($content));
        });
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
        $show->field('title', __('標題'));
        $show->field('content', __('內容'))->unescape();
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
        $form = new Form(new Indextext());

        /* ===================
         * 編輯時進用刪除按鈕
         * 編輯時進用顯示按鈕
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
        
        $form->text('title', __('標題'));
        $form->textarea('content', __('內容'))->attribute(['id' => 'ckeditor']);

        return $form;
    }
}
