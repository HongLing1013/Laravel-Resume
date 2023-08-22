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
    protected $title = 'Skills';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AboutSkills());

        $grid->column('id', __('Id'))->hide();
        $grid->column('name', __('技能'));
        $grid->column('degree', __('程度'));
        $grid->column('created_at', __('創建時間'));
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

        $form->text('name', __('技能'));
        $form->text('degree', __('程度'));

        if($form->isCreating()){
            $form->hidden('acid')->default('3');
        }

        return $form;
    }
}
