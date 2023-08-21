<?php

namespace App\Admin\Controllers;

use App\Models\AboutAbout;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class AboutAboutController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '關於我詳情';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutAbout());

        $grid->column('id', __('Id'));
        $grid->column('acid', __('Acid'))->hide();
        $grid->column('img', __('Img'));
        $grid->column('title', __('Title'));
        $grid->column('description', __('Description'));
        $grid->column('birthday', __('Birthday'));
        $grid->column('website', __('Website'));
        $grid->column('degree', __('Degree'));
        $grid->column('phone', __('Phone'));
        $grid->column('phemailone', __('Phemailone'));
        $grid->column('city', __('City'));
        $grid->column('freelance', __('Freelance'));
        $grid->column('details', __('Details'));
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
        $show = new Show(AboutAbout::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('acid', __('Acid'));
        $show->field('img', __('Img'));
        $show->field('title', __('Title'));
        $show->field('description', __('Description'));
        $show->field('birthday', __('Birthday'));
        $show->field('website', __('Website'));
        $show->field('degree', __('Degree'));
        $show->field('phone', __('Phone'));
        $show->field('phemailone', __('Phemailone'));
        $show->field('city', __('City'));
        $show->field('freelance', __('Freelance'));
        $show->field('details', __('Details'));
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
        $form = new Form(new AboutAbout());

        $form->number('acid', __('Acid'));
        $form->image('img', __('Img'));
        $form->text('title', __('Title'));
        $form->text('description', __('Description'));
        $form->datetime('birthday', __('Birthday'))->default(date('Y-m-d H:i:s'));
        $form->text('website', __('Website'));
        $form->text('degree', __('Degree'));
        $form->mobile('phone', __('Phone'));
        $form->text('phemailone', __('Phemailone'));
        $form->text('city', __('City'));
        $form->text('freelance', __('Freelance'));
        $form->textarea('details', __('Details'));

        return $form;
    }
}
