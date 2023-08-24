<?php

namespace App\Admin\Controllers;

use App\Models\AboutTestimonials;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AboutTestimonialsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '感言列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutTestimonials());

        /* ============
         * 禁用導出按鈕
         * 禁用列選擇器
         * ============ */
        $grid->disableExport();
        $grid->disableColumnSelector();

        /* ============
         * 搜尋功能
         * ============ */
        $grid->filter(function($filter){
            $filter->like('name', '姓名');
            $filter->like('job_title', '工作職稱');
            $filter->like('content', '感言內容');  
        });

        $grid->column('id', __('Id'))->hide();
        $grid->column('name', __('姓名'));
        $grid->column('job_title', __('工作職稱'));
        $grid->column('image', __('照片'))->image();
        $grid->column('content', __('感言內容'));
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
        $show = new Show(AboutTestimonials::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('姓名'));
        $show->field('job_title', __('工作職稱'));
        $show->field('image', __('照片'))->image();
        $show->field('content', __('感言內容'));
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
        $form = new Form(new AboutTestimonials());

        $form->text('name', __('姓名'));
        $form->text('job_title', __('工作職稱'));
        $form->image('image', __('照片'));
        $form->text('content', __('感言內容'));

        if($form->isCreating()){
            $form->hidden('acid')->default('5');
        }

        return $form;
    }
}
