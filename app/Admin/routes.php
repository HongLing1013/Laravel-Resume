<?php

use App\Models\PortfolioCategory;
use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
    'as'            => config('admin.route.prefix') . '.',
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('home');

    $router->group(['prefix' => 'auth'], function ($router){
        /* 前台選單 */
        $router->resource('frontend-menu', MenuController::class);
        /* 首頁文字 */
        $router->resource('admin-text', IndextextController::class);
        /* 社群連結 */
        $router->resource('social', SocialController::class);
        /* 作品分類 */
        $router->resource('portfolio-category', PortfolioCategoryController::class);
        /* 作品列表 */
        $router->resource('portfolio', PortfolioController::class);
        /* 服務列表 */
        $router->resource('service', ServiceController::class);
        /* 經歷簡介 */
        $router->resource('resume-sumaries', ResumeSumaryController::class);
        /* 教育背景 */
        $router->resource('resume-eductions', ResumeEductionController::class);
        /* 工作經歷 */
        $router->resource('resume-experiences', ResumeExperienceController::class);
        /* 關於我 */
        $router->resource('about-abouts', AboutAboutController::class);
        /* 好評數量 */
        $router->resource('about-counts', AboutCountsController::class);
        /* 技能列表 */
        $router->resource('about-skills', AboutSkillsController::class);
        /* 興趣列表 */
        $router->resource('about-interests', AboutInterestsController::class);
        /* 感言列表 */
        $router->resource('about-testimonials', AboutTestimonialsController::class);
        /* 聯絡我 */
        $router->resource('contacts', ContactController::class);
        /* 留言列表 */
        $router->resource('messages', MessageController::class);
    });



});
