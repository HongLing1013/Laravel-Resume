<?php

namespace App\Admin\Controllers;

use App\Models\AboutInterests;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AboutInterestsController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'AboutInterests';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutInterests());

        $grid->column('id', __('Id'));
        $grid->column('acid', __('Acid'));
        $grid->column('name', __('Name'));
        $grid->column('icon', __('Icon'));
        $grid->column('color', __('Color'));
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
        $show = new Show(AboutInterests::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('acid', __('Acid'));
        $show->field('name', __('Name'));
        $show->field('icon', __('Icon'));
        $show->field('color', __('Color'));
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
        $form = new Form(new AboutInterests());

        $form->number('acid', __('Acid'));
        $form->text('name', __('Name'));
        $form->text('icon', __('Icon'));
        $form->color('color', __('Color'));

        return $form;
    }
}
