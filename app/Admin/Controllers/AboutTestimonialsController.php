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
    protected $title = 'AboutTestimonials';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutTestimonials());

        $grid->column('id', __('Id'));
        $grid->column('acid', __('Acid'));
        $grid->column('name', __('Name'));
        $grid->column('job_title', __('Job title'));
        $grid->column('image', __('Image'));
        $grid->column('content', __('Content'));
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
        $show = new Show(AboutTestimonials::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('acid', __('Acid'));
        $show->field('name', __('Name'));
        $show->field('job_title', __('Job title'));
        $show->field('image', __('Image'));
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
        $form = new Form(new AboutTestimonials());

        $form->number('acid', __('Acid'));
        $form->text('name', __('Name'));
        $form->text('job_title', __('Job title'));
        $form->image('image', __('Image'));
        $form->text('content', __('Content'));

        return $form;
    }
}
