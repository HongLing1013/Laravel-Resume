<?php

namespace App\Admin\Controllers;

use App\Models\Message;
use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class MessageController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '留言列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Message());

        /* ============
         * 名稱陣列
         * ============ */

        $statusMap = ['0' => '未讀' , '1' => '已讀'];

        /* ============
         * 禁用導出按鈕
         * 禁用列選擇器
         * 禁用新增按鈕
         * 搜尋常態開啟
         * ============ */

        $grid->disableExport();
        $grid->disableColumnSelector();
        $grid->disableCreateButton();
        $grid->actions(function (Grid\Displayers\Actions $actions) {
            $actions->disableEdit();
            $actions->disableView();
        });
        $grid->expandFilter();

        /* ============
         * 搜尋列
         * ============ */
        $grid->filter(function ($filter) use ($statusMap) {
            $filter->column(1/2 , function ($filter){ //左
                $filter->like('subject', __('留言主題'));
                $filter->like('message', __('留言內容'));
            });
            $filter->column(1/2 , function ($filter) use ($statusMap)  { //右
                $filter->like('email', __('Email'));
                $filter->equal('status', __('狀態'))->select ($statusMap);
                $filter->between('created_at', '留言時間')->datetime();
            });
        });

        $grid->column('id', __('Id'))->sortable();
        $grid->column('name', __('名稱'));
        $grid->column('email', __('Email'));
        $grid->column('subject', __('留言主題'));
        $grid->column('message', __('留言內容'));
        $grid->column('status', __('狀態'));
        $grid->column('created_at', __('留言時間'))->sortable();
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
        $show = new Show(Message::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('名稱'));
        $show->field('email', __('Email'));
        $show->field('subject', __('留言主題'));
        $show->field('message', __('留言內容'));
        $show->field('status', __('狀態'));
        $show->field('created_at', __('留言時間'));
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
        $form = new Form(new Message());

        $form->text('name', __('名稱'));
        $form->email('email', __('Email'));
        $form->text('subject', __('留言主題'));
        $form->textarea('message', __('留言內容'));
        $form->switch('status', __('狀態'));

        return $form;
    }
}
