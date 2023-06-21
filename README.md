<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## 個人履歷

使用 Laravel 做履歷頁面，後台的部分選用 Laravel-Admin 搭建，練習從無到有建置前後台。

## 安裝

#### Laravel
1. 安裝 Laravel 安裝器 ```composer global require "laravel/installer"```

2. 新增一個 Laravel 專案 ```composer create-project laravel/laravel ProjectName```

3. 進入專案資料夾內，運行 Laravel 伺服器 ```php artisan serve```


#### Laravel-Admin
1. 安裝 Laravel-Admin ```composer require encore/laravel-admin```

2. 設定 congif/app.php ，最上方加入一行 code 註冊服務
    ```Encore\Admin\Providers\AdminServiceProvider::class;```

3. 進入專案資料夾內，產生配置文件(config/admin.php)```php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"```

4. 安裝 Laravel-Admin ```php artisan admin:install```

5. 設定檔(config/admin.php)內的disk改成public目錄

## Routing

#### 請求方式一覽

| 請求方式 | 特色 |
|---|---|
| resource | resource表示全部請求方式皆可通過 |
| get | 只接受get的傳值 通常使用於簡單的顯示 |
| post | 用於傳送提交 |
| put |  |
| patch | | 
| delete | 刪除的時候使用 |
| options | |

#### Routing的幾種設定方式

1. 直接return頁面內容
```php
Route::請求方法('網址的path',function(){
return view('blade的檔案名稱');
})
```
2. 將Routng導到Controller程式碼的function
    - Laravel 8 之前
    ```php
    Route::請求方法('/網址的path','控制器檔案名稱@function名稱');
    ```
    - Laravel 8 之後
    ```php
    Route::請求方法('網址的path',[控制器檔案名稱::class, 'function名稱']);
    ```

## Blade 模板/視圖

- 樣板大多都會放在 resources/views/layouts 資料夾內

#### @extends
- @extends 在視圖中，用來繼承樣板，例如我有一個樣板，位置在 resources/views/layouts/app.blade.php ，我想要在index的頁面繼承它，那我在resources/views/index.blade.php 的頁面最上方就要使用 @extends('資料夾.blade檔案名稱')
```php
@extends('layouts.app')

//其他程式碼..
```

#### @yield
- @yield 在視圖中，用來定義一個section，設定要挖空的區域。
- 範例：
1. 在 resources/views/layouts/app.blade.php 樣板當中挖空一個區塊，取名為content
```php
<!DOCTYPE html>
<html>
<head>
    <title>Hello Everybody</title>
</head>
<body>
    <div class="container">
        @yield('content')
    </div>
</body>
</html>
```
2. 在 resources/views/index.blade.php 中，使用@section('區塊名稱')填空
```php
@extends('layouts.app')

@section('content')
    <h1>Hello World!!</h1>
@endsection
``` 

#### @include
- @include 用法同 php 的 include 

- 傳值：
    可使用下列方式
    ```php
    @include('layouts.app' , 'title' => 'hello world')
    ``` 
    將參數title傳進去layouts/app.blade.php，
    取用方式如下
    ```html
    <h1>{{$title}}</h1>
    ```

## Migrate

#### 創建 Migration 的方法
1. 單純創建一個 Migration
    ```php artisan make:migration create_menu_table```
2. 創建 Migration 時順便創建一個 Model
    ```php artisan make:model Menu --migration```

#### 執行與還原 Migration

- 當寫好了 Migration 以後，可執行下面指令創建資料表
    ```php artisan migrate```
- 當創建資料表後可執行下面指令還原資料表，確保創建與還原的程式碼都可正常運行
    ```php artisan migrate:rollback```

## Model

- 設定允許賦值的參數
```php
protected $fillable = ['欄位名稱'];
```

## Controller

#### 創建一個沒有 Model 的 Controller

- 沒有方法的版本 
```php artisan make:controller HomeController```
- 有方法的版本 
```php artisan make:controller HomeController --resource```




# Laravel-Admin

## 建立 Admin Controller

使用指令創建 Admin 的控制器

-  Mac os、 Linux - 有 model 的創建指令 

```php artisan admin:make MenuController --model=App\\Models\\Menu```

- Windows - 有 model 的創建指令 

```php artisan admin:make MenuController --model=App\Menu```

- Mac os、 Linux - 沒 model 的創建指令 

```php artisan admin:make MenuController```

- Windows - 沒 model 的創建指令 

```php artisan admin:make MenuController```

## Routing

- Admin 的路由設定並不在 routes/web.php ，而是在 app/Admin/routes.php
- 在 function 當中加入下列代碼新增可通行路徑
```php
$router->resource('auth/frontend-menu', MenuController::class);
```
