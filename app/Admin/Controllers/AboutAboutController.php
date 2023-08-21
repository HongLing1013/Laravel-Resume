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

        /* ============
         * 禁用篩選按鈕
         * 禁用導出按鈕
         * 禁用行選擇器
         * 禁用列選擇器
         * 禁用分頁功能
         * 禁用新增按鈕
         * 禁用刪除按鈕
         * ============ */

         $grid->disableFilter();
         $grid->disableExport();
         $grid->disableRowSelector();
         $grid->disableColumnSelector();
         $grid->disablePagination();
         $grid->disableCreateButton();
         $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableDelete();
         });
        $grid->column('id', __('Id'))->hide();
        $grid->column('acid', __('Acid'))->hide();
        $grid->column('img', __('大頭照'))->display(function ($content) {
            return $content ? "<img src='{$content}' style='width:150px'></img>" : '';
        });
        $grid->column('title', __('職稱'));
        $grid->column('description', __('職業敘述'));
        $grid->column('birthday', __('生日'));
        $grid->column('website', __('個人頁'));
        $grid->column('degree', __('程度'));
        $grid->column('phone', __('電話'));
        $grid->column('phemailone', __('E-mail'));
        $grid->column('city', __('居住城市'));
        $grid->column('freelance', __('自由職業'));
        $grid->column('details', __('詳細敘述'));
        $grid->column('created_at', __('Created at'))->hide();
        $grid->column('updated_at', __('Updated at'))->hide();

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
