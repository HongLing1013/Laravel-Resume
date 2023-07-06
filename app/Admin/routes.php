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

    /* 前台選單 */
    $router->resource('auth/frontend-menu', MenuController::class);
    /* 首頁文字 */
    $router->resource('auth/admin-text', IndextextController::class);
    /* 社群連結 */
    $router->resource('auth/social', SocialController::class);
    /* 作品分類 */
    $router->resource('auth/portfolio-category', PortfolioCategoryController::class);

});
