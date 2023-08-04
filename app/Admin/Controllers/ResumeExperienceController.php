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
    protected $title = '工作經歷';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new ResumeExperience());

        /* ============
         * 禁用導出按鈕
         * 禁用列選擇器
         * ============ */

        $grid->disableExport();
        $grid->disableColumnSelector();

        $grid->column('job_title', __('職稱'));
        $grid->column('year_from', __('開始時間'))->display(function ($year_from){
            return date("Y-m" , strtotime($year_from));
        })->sortable();
        $grid->column('year_to', __('結束時間'))->display(function ($year_to){
            return ($year_to != null) ?  date("Y-m" , strtotime($year_to)) :  'Present';
        })->sortable();
        $grid->column('company', __('工作地點'));
        $grid->column('job_description', __('工作敘述'))->display(function ($job_description) {
            return html_entity_decode(nl2br($job_description));
        });
        $grid->column('updated_at', __('更新時間'))->display(function($updated_at) {
            return date("Y-m-d H:i:s" , strtotime($updated_at));
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
        $show = new Show(ResumeExperience::findOrFail($id));

        $show->field('job_title', __('職稱'));
        $show->field('year_from', __('開始時間'));
        $show->field('year_to', __('結束時間'));
        $show->field('company', __('工作地點'));
        $show->field('job_description', __('工作敘述'))->unescape();
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
        $form = new Form(new ResumeExperience());

        $form->text('job_title', __('職稱'));
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
                 $over_time = ResumeExperience::where('id',$id)->first();
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
        $form->text('company', __('工作地點'));
        $form->textarea('job_description', __('工作敘述'))->attribute(['id' => 'ckeditor']);;

        if($form->isCreating()){
            $form->hidden('rcid')->default('3');
        }
        
        $form->ignore(['over_time']);

        $form->saved(function (Form $form){
            $eduction = $form->model();
            $year_to = $_POST['year_to'] ?? null;
            ResumeExperience::where('id',$eduction->id)->update([ 'year_to'=>$year_to ]);
        });

        return $form;
    }
}
