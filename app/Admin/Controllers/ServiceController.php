<?php

namespace App\Admin\Controllers;

use App\Models\Service;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ServiceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '服務列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Service());

        /* ===============
         * 禁用匯出按鈕
         *    列選擇器
         *    搜尋常態性開啟
         * =============== */
        $grid->disableExport()
             ->disableColumnSelector();

        /* ============
         * 禁用篩選按鈕
         * 禁用導出按鈕
         * 禁用行選擇器
         * ============ */
        $grid->disableFilter();
        $grid->disableExport();
        $grid->disableRowSelector();


        $grid->column('id', __('Id'))->hide();
        $grid->column('icon', __('Icon'))->icon([
            'bx bxl-dribbble' => 'dribbble' ,
            'bx bx-file' => 'file' , 
            'bx bx-tachometer' => 'tachometer' , 
            'bx bx-world' => 'world' , 
            'bx bx-slideshow' => 'slideshow' , 
            'bx bx-arch' => 'arch' 
        ]);
        $grid->column('title', __('標題'));
        $grid->column('content', __('敘述'));
        $grid->column('created_at', __('創建時間'))->display(function ($created_at) {
            return date('Y-m-d H:i:s' , strtotime($created_at));
        })->sortable();
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
        $show = new Show(Service::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('icon', __('Icon'));
        $show->field('title', __('標題'));
        $show->field('content', __('敘述'));
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
        $form = new Form(new Service());

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

        $form->text('icon', __('Icon'));
        $form->text('title', __('標題'));
        $form->textarea('content', '敘述')->attribute(['id' => 'ckeditor']);

        return $form;
    }
}
