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
        $grid->column('created_at', __('創建時間'))->hide();
        $grid->column('updated_at', __('更新時間'))->hide();

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
        
        /* ============
         * 禁用刪除按鈕
         * ============ */
        
         $show->panel()->tools(function($tools) {
            $tools->disableDelete();
        });

        $show->field('img', __('大頭照'))->image();
        $show->field('title', __('職稱'));
        $show->field('description', __('職業敘述'));
        $show->field('birthday', __('生日'))->as(function ($birthday){
            return \Carbon\Carbon::parse($birthday)->format('Y-m-d');
        });
        $show->field('website', __('個人頁'));
        $show->field('degree', __('程度'));
        $show->field('phone', __('電話'));
        $show->field('phemailone', __('E-mail'));
        $show->field('city', __('居住城市'));
        $show->field('freelance', __('自由職業'));
        $show->field('details', __('詳細敘述'));
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
        $form = new Form(new AboutAbout());

        $form->number('acid', __('Acid'));
        $form->image('img', __('大頭照'));
        $form->text('title', __('職稱'));
        $form->text('description', __('職業敘述'));
        $form->datetime('birthday', __('生日'))->default(date('Y-m-d H:i:s'));
        $form->text('website', __('個人頁'));
        $form->text('degree', __('程度'));
        $form->mobile('phone', __('電話'));
        $form->text('phemailone', __('E-mail'));
        $form->text('city', __('居住城市'));
        $form->text('freelance', __('自由職業'));
        $form->textarea('details', __('詳細敘述'));

        return $form;
    }
}
