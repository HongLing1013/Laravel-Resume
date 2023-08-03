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
        $grid->column('year_from', __('開始時間'))->display(function ($year_from){
            return date("Y-m" , strtotime($year_from));
        })->sortable();
        $grid->column('year_to', __('結束時間'))->display(function ($year_to){
            return ($year_to != null) ?  date("Y-m" , strtotime($year_to)) :  'Present';
        })->sortable();
        $grid->column('institution', __('學校名稱'));
        $grid->column('description', __('描述'))->display(function ($description){
            return html_entity_decode(nl2br($description));
        });
        $grid->column('updated_at', __('更新時間'))->display(function ($updated_at) {
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

        $form->text('degree', __('學歷'));
        $form->datetime('year_from', __('開始時間'))->default(date('Y-m-d H:i:s'));
        if($form->isCreating()){
           $form->radioButton('over_time','結束時間')
                ->options([
                    1 => '選擇時間' ,
                    2 => '學習中',
                ])->when( 1, function (Form $form){
                    $form->datetime('year_to', __(''))->default(date('Y-m-d H:i:s'));
                })->when( 2, function (Form $form){
                    $form->radio('year_to', __(''))->value('');
                });
        }else{
            $path = explode('/', $_SERVER['REQUEST_URI'], -1);
            if(isset($path[4]) && is_numeric($path[4])){
                $id = $path[4];
                $over_time = ResumeEduction::where('id',$id)->first();
                if($over_time){
                    $year_to = $over_time->year_to ?? null;
                    $over_time = $over_time->year_to == null ? 2 : 1;
                    $form->radioButton('over_time','結束時間')
                        ->options([
                            1 => '選擇時間' ,
                            2 => '學習中',
                        ])->value($over_time)
                        ->when( 1, function (Form $form) use($year_to){
                            $form->datetime('year_to', __(''))->default(date('Y-m-d H:i:s'))->value($year_to);
                        })->when( 2, function (Form $form){
                            $form->radio('year_to', __(''))->value('');
                        });
                }
            }
        }
        $form->text('institution', __('學校名稱'));
        $form->text('description', __('描述'));

        /* =======
         * 隱藏欄位
         * ======= */
        if($form->isCreating()){
            $form->hidden('rcid')->default('2');
        }

        /* =======
         * 忽略欄位
         * ======= */
        $form->ignore(['over_time']);

        /* =====
         * 回調
         * ===== */
        $form->saved(function (Form $form){
            $eduction = $form->model();
            $year_to = $_POST['year_to'] ?? null;
            ResumeEduction::where('id',$eduction->id)->update([ 'year_to'=>$year_to ]);
        });

        return $form;
    }
}
