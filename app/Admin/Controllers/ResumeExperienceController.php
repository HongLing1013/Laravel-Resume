<?php

namespace App\Admin\Controllers;

use App\Models\ResumeExperience;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ResumeExperienceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '工作經歷';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ResumeExperience());

        /* ============
         * 禁用導出按鈕
         * 禁用列選擇器
         * ============ */

        $grid->disableExport();
        $grid->disableColumnSelector();

        $grid->column('job_title', __('職稱'));
        $grid->column('year_from', __('開始時間'))->display(function ($year_from){
            return date("Y-m" , strtotime($year_from));
        })->sortable();
        $grid->column('year_to', __('結束時間'))->display(function ($year_to){
            return ($year_to != null) ?  date("Y-m" , strtotime($year_to)) :  'Present';
        })->sortable();
        $grid->column('company', __('工作地點'));
        $grid->column('job_description', __('工作敘述'))->display(function ($job_description) {
            return html_entity_decode(nl2br($job_description));
        });
        $grid->column('updated_at', __('更新時間'))->display(function($updated_at) {
            return date("Y-m-d H:i:s" , strtotime($updated_at));
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
        $show = new Show(ResumeExperience::findOrFail($id));

        $show->field('job_title', __('職稱'));
        $show->field('year_from', __('開始時間'));
        $show->field('year_to', __('結束時間'));
        $show->field('company', __('工作地點'));
        $show->field('job_description', __('工作敘述'))->unescape();
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
        $form = new Form(new ResumeExperience());

        $form->number('rcid', __('rcid'));
        $form->text('job_title', __('職稱'));
        $form->datetime('year_from', __('開始時間'))->default(date('Y-m-d H:i:s'));
        $form->datetime('year_to', __('結束時間'))->default(date('Y-m-d H:i:s'));
        $form->text('company', __('工作地點'));
        $form->textarea('job_description', __('工作敘述'));
        return $form;
    }
}
