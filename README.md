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

## Routing 的設定方式


| 請求方式 | 特色 |
|---|---|
| resource | resource表示全部請求方式皆可通過 |
| get | 只接受get的傳值 通常使用於簡單的顯示 |
| post | 用於傳送提交 |
| put |  |
| patch | | 
| delete | 刪除的時候使用 |
| options | |


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
