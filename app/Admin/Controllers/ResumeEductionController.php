<?php

namespace App\Admin\Controllers;

use App\Models\ResumeEduction;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class ResumeEductionController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '教育背景';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ResumeEduction());

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

        $grid->column('degree', __('學歷'));
        $grid->column('year_from', __('開始時間'));
        $grid->column('year_to', __('結束時間'));
        $grid->column('institution', __('學校名稱'));
        $grid->column('description', __('描述'))->display(function ($description){
            return html_entity_decode(nl2br($description));
        });
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
        $show = new Show(ResumeEduction::findOrFail($id));

        $show->field('degree', __('學歷'));
        $show->field('year_from', __('開始時間'));
        $show->field('year_to', __('結束時間'));
        $show->field('institution', __('學校名稱'));
        $show->field('description', __('描述'))->unescape();
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
        $form = new Form(new ResumeEduction());

        $form->number('rcid', __('Rcid'));
        $form->text('degree', __('學歷'));
        $form->datetime('year_from', __('開始時間'))->default(date('Y-m-d H:i:s'));
        $form->datetime('year_to', __('結束時間'))->default(date('Y-m-d H:i:s'));
        $form->text('institution', __('學校名稱'));
        $form->text('description', __('描述'));

        return $form;
    }
}
