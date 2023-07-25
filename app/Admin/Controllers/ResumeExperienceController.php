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
    protected $title = 'ResumeExperience';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ResumeExperience());

        $grid->column('id', __('Id'));
        $grid->column('rcid', __('Rcid'));
        $grid->column('job_title', __('Job title'));
        $grid->column('year_from', __('Year from'));
        $grid->column('year_to', __('Year to'));
        $grid->column('company', __('Company'));
        $grid->column('job_description', __('Job description'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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

        $show->field('id', __('Id'));
        $show->field('rcid', __('Rcid'));
        $show->field('job_title', __('Job title'));
        $show->field('year_from', __('Year from'));
        $show->field('year_to', __('Year to'));
        $show->field('company', __('Company'));
        $show->field('job_description', __('Job description'));
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
        $form = new Form(new ResumeExperience());

        $form->number('rcid', __('Rcid'));
        $form->text('job_title', __('Job title'));
        $form->datetime('year_from', __('Year from'))->default(date('Y-m-d H:i:s'));
        $form->datetime('year_to', __('Year to'))->default(date('Y-m-d H:i:s'));
        $form->text('company', __('Company'));
        $form->textarea('job_description', __('Job description'));

        return $form;
    }
}
