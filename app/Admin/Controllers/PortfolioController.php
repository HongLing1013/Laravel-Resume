<?php

namespace App\Admin\Controllers;

use App\Models\Portfolio;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PortfolioController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '作品列表';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Portfolio());
        $pcidMap = [ '1' => 'app' , '2' => 'card' , '3' => 'web' ]; 

        /* ===============
         * 禁用匯出按鈕
         *    列選擇器
         *    搜尋常態性開啟
         * =============== */
        $grid->disableExport()
             ->disableColumnSelector()
             ->expandFilter();

        /* ===============
         * 回收站入口
         * =============== */
        $grid->filter(function ($filter) {
            $filter->scope('trashed', '回收桶')->onlyTrashed();
        });
            
        /* ===============
         * 搜尋列 -
         *      分兩行顯示 
         * =============== */
        $grid->filter(function ($filter) use ($pcidMap) {
            $filter->column(1/2 , function ($filter) use($pcidMap){ //左
                $filter->like('text', __('標題'));
                $filter->equal('pcid', __('分類'))->select ($pcidMap);
            });
            $filter->column(1/2 , function ($filter) { //右
                $filter->between('created_at', '創建時間')->datetime();
                $filter->between('updated_at', '更新時間')->datetime();
            });
        });

        $grid->column('id', __('Id'))->hide();
        $grid->column('portfolioCategory.name', __('分類'))->sortable();
        $grid->column('text', __('標題'));
        $grid->column('image', __('圖片連結'))->display(function ($content) {
            return $content ? "<img src='{$content}' style='width:200px;height:150px'></img>" : '';
        });
        $grid->column('href', __('網址'));
        $grid->column('created_at', __('創建時間'))->hide();
        $grid->column('updated_at', __('更新時間'))->display(function($updated_at){
            return date('Y-m-d H:i:s' , strtotime($updated_at));
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
        $show = new Show(Portfolio::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('pcid', __('分類'));
        $show->field('text', __('標題'));
        $show->field('image', __('圖片'))->image();
        $show->field('href', __('網址'));
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
        $form = new Form(new Portfolio());

        /* ===================
         * 編輯時禁用刪除按鈕
         * 編輯時禁用顯示按鈕
         * 禁用查看 checkbox
         * 禁用繼續創建 checkbox
         * 禁用繼續編輯 checkbox
         * =================== */
        if($form->isEditing()){
            $form->tools(function (Form\Tools $tools) {
                $tools->disableDelete();
                $tools->disableView();
            });
        }
        $form->disableViewCheck();
        $form->disableCreatingCheck();
        $form->disableEditingCheck();

        /* ========
         * 設置變數
         * ======== */
        $appMap = [ 1 => 'app', 2 => 'card', 3 => 'web'];

        $form->select('pcid', __('分類'))->options($appMap);
        $form->text('text', __('標題'));
        $form->image('image', __('圖片'));
        $form->text('href', __('網址'));

        return $form;
    }
}
