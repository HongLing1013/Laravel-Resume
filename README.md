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
3. 已存在的表要新增欄位
    ```php artisan make:migration add_icon_to_about_counts_table --table=about_counts```
4. 已存在的表要更新欄位
    ```php artisan make:migration change_details_str_to_text_in_about_about --table=about_about```
#### 執行與還原 Migration

- 當寫好了 Migration 以後，可執行下面指令創建資料表
    ```php artisan migrate```
- 當創建資料表後可執行下面指令還原資料表，確保創建與還原的程式碼都可正常運行
    ```php artisan migrate:rollback```

#### 創建一個關聯表
- 使用 $table->foreign()方法設定外鍵關聯
    references()填寫對應外鍵
    on()為對應的資料表
    ```php
    Schema::create('user_favorite', function (Blueprint $table) {
        $table->id();
        $table->unsignedBigInteger('website_id');
        $table->foreign('website_id')->references('id')->on('website');
        $table->timestamps();
    });
    ```
- 或者使用 constrained('資料表名') 方法創建關聯
    ```php
    Schema::create('post', function (Blueprint $table) {
        $table->id();
        $table->foreignId('user_id')->constrained('post_user');
    });
    ```

#### 修改一個關聯表
- 使用 change() 方法修改欄位
    ```php
    Schema::table('resume_experiences', function (Blueprint $table) {
        $table->string('year_from')->change();
        $table->string('year_to')->change();
    });
    ```

#### 紀錄被刪除時自訂處理方式

- 主鍵資料表中記錄被刪除時，該主鍵的外鍵資料表相關記錄也會自動刪除
    ```onDelete('cascade')```
- 主鍵資料表中記錄被刪除時，該主鍵的外鍵資料表中如存在相關記錄，刪除將中止，除非相關的記錄被刪除
    ```onDelete('restrict')```
- 主鍵資料表中記錄被刪除時，該主鍵的外鍵資料表的記錄中，外鍵值將被設置為null。
    ```onDelete('set null')```
- 主鍵資料表中記錄被刪除時，該主鍵關聯的外鍵資料表中存在相關的記錄，刪除操作將被阻止。
    ```onDelete('no action')```

#### 刪除外鍵

- 當執行 down 還原資料表時，如果該表為關聯表會出現錯誤，故要先移除外鍵
```php
$table->DropForeign(['category_id']);
```

## Model

#### 屬性設定

- 設定允許賦值的參數
```php
protected $fillable = ['欄位名稱'];
```

#### 關聯設定

- 一對一關聯 : 
```php
// User Model - 一個 User 對象只能擁有一個 HealthInsurance 對象
class User extends Model
{
    public function healthInsurance()
    {
        return $this->hasOne(HealthInsurance::class);
        // 另一種寫法
        // return $this->hasOne('App\Models\HealthInsurance');
    }
}

// HealthInsurance Model - 一個 HealthInsurance 對象必須歸屬於一個 User 對象
class HealthInsurance extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class);
        // 另一種寫法
        // return $this->belongsTo('App\Models\User');
    }
}
```

- 一對多關聯 : 一個人可以有多個手機號碼
```php
// User Model - 一個 User 對象可以有多個 PhoneNum 對象
class User extends Model
{
    public function phoneNum()
    {
        return $this->hasMany(PhoneNum::class);
        // 另一種寫法
        // return $this->hasMany('App\Models\PhoneNum');
    }
}

// PhoneNum Model - 一個 PhoneNum 對象必須歸屬於一個 User 對象
class PhoneNum extends Model
{
    public function user()
    {
        return $this->belongsTo(User::class);
        // 另一種寫法
        // return $this->belongsTo('App\Models\User');
    }
}
```

- 多對多關聯 : 一個用戶可以有多個角色，多個角色也可分配給多個用戶
```php
// User Model - 一個 User 對象可以有多個 Role 對象
class User extends Model
{
    public function roles()
    {
        return $this->belongsToMany(Role::class);
        // 另一種寫法
        // return $this->belongsToMany('App\\Role');
    }
}

// Role Model - 一個 Role 對象可以屬於多個 User 對象
class Role extends Model
{
    public function users()
    {
        return $this->belongsToMany(User::class);
        // 另一種寫法
        // return $this->belongsToMany('App\\User');
    }
}
```

## Controller

#### 創建一個沒有 Model 的 Controller

- 沒有方法的版本 
```php artisan make:controller HomeController```
- 有方法的版本 
```php artisan make:controller HomeController --resource```

#### 傳參數到視圖
```php
return view('頁面名稱', ['blade使用的變數名稱' => $controller使用的變數名稱]);
```

## 開啟laravel的軟刪除
1. cmd輸入指令創建遷移文件
    ```php artisan make:migration update_portfolios_add_soft_delete --table portfolios```
2. 遷移文件當中加入欄位
```php
//up
Schema::table('資料表', function (Blueprint $table) {
    $table->softDeletes(); 
});
//down
Schema::table('portfolios', function (Blueprint $table) {
    $table->dropSoftDeletes();
});
```
3. 在model上方use軟刪除
```php
use Illuminate\Database\Eloquent\SoftDeletes;
```
4. model的class當中use軟刪除
```php
use SoftDeletes;
```
5. 可用字段當中加入軟刪除的欄位使其可編輯
```php
protected $fillable = [ 'deleted_at' ];
```



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
- 可將前綴相同的部分進行群組，例如 admin/dashboard、admin/users、admin/posts 可群組寫成下面範例
```php
Route::group(['prefix' => 'admin'], function () {
    Route::get('/dashboard', 'AdminController@dashboard');
    Route::get('/users', 'AdminController@users');
    Route::get('/posts', 'AdminController@posts');
});
```

## Grid

- 禁用按鈕
```php
$grid->disableActions();
$grid->disablePagination();
$grid->disableCreateButton();
$grid->disableFilter();
$grid->disableRowSelector();
$grid->disableColumnSelector();
$grid->disableTools();
$grid->disableExport();
$grid->actions(function (Grid\Displayers\Actions $actions) {
    $actions->disableView();
    $actions->disableEdit();
    $actions->disableDelete();
});
```

- 搜尋列分兩列
```php
$grid->filter(function ($filter) {
    $filter->column(1/2 , function ($filter) {
        //左
    });
    $filter->column(1/2 , function ($filter) { 
        //右
    });
});
```

- grid 顯示 html tag
```php
$grid->column('summary', __('簡介'))->display(function ($summary) {
    return html_entity_decode(nl2br($summary));
);
```

## Show

- 資料庫內存有html不想要顯示成字串的話
    (例如有<img>想直接顯示圖片)
```php
$show->field('image', __('Image'))->unescape()->as(function ($image) {
    return "<img src='{$image}' />";
});
```

## From

- 禁用按鈕
```php
$form->disableEditingCheck();
$form->disableCreatingCheck();
$form->disableViewCheck();

$form->tools(function (Form\Tools $tools) {
    $tools->disableDelete();
    $tools->disableView();
    $tools->disableList();
});
```

- 判斷新增或編輯
```php
if($form->isCreating()){
    // 新增的邏輯
}

if($form->isEditing()){
    // 編輯時的邏輯
} 
```

- 送出時忽略欄位
```php
$form->ignore(['欄位名稱']);
```

- 回調參數
```php
$form->submitted(function (Form $form) {
    // 送出前回調
});

$form->saving(function (Form $form) {
    // 儲存前回調
});

$form->saved(function (Form $form) {
    //儲存後回調
});
```

## CKeditor

1. 安裝 ```composer require ckeditor/ckeditor```
2. 找到 app/Admin/bootstrap.php 進行綁定
```php
Admin::js('https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js');
Admin::script('CKEDITOR.replace("ckeditor");');
```
3. 用 attribute 方法使用
```php
$form->textarea('content', 'Content')->attribute(['id' => 'ckeditor']);
```

## 使用laravel-admin的軟刪除功能
1. 先開啟laravel內建軟刪除功能
2. 接著加入代碼製作一個回收桶的入口
```php
$grid->filter(function ($filter) {
    $filter->scope('trashed', '回收站')->onlyTrashed();
});
```

## 軟刪除的單一恢復操作
1. 使用指令創建Restore的檔案
```php artisan admin:action Post\\Restore --grid-row --name="恢復"```
2. Restore的內容如下
```php
namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Restore extends RowAction
{
	public $name = '恢復';

	public function handle(Model $model)
	{
	    $model->restore();

	    return $this->response()->success('已恢復')->refresh();
	}

	public function dialog()
	{
	    $this->confirm('確定恢復吗？');
	}
}
```
3. 回到admin的控制器上方use    
```php
use App\Admin\Actions\Post\Restore;
```
4. 增加恢復的按鈕
    config/admin.php 的 grid_action_class 
    如果設定為『圖型化操作介面』會造成無法添加自定義操作按鈕的錯誤
```php
$grid->actions(function ($actions) {
    if (\request('_scope_') == 'trashed') {
        $actions->add(new Restore());
    }
});
```

## 軟刪除的多行恢復操作
1. 使用指令創建Restore的檔案
```php artisan admin:action Post\\BatchRestore --grid-batch --name="批量恢復"```
2. Restore的內容如下
```php
namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;

class BatchRestore extends BatchAction
{
    public $name = '批量恢復';

    public function handle(Collection $collection)
    {
        // foreach ($collection as $model) {
        //     // ...
        // }
        $collection->each->restore();

        return $this->response()->success('Success message...')->refresh();
    }

}
```
3. 回到admin的控制器上方use    
```php
use App\Admin\Actions\Post\BatchRestore;
```
4. 增加恢復的按鈕
    config/admin.php 的 grid_action_class 
    如果設定為『圖型化操作介面』會造成無法添加自定義操作按鈕的錯誤
```php
$grid->batchActions(function ($batch) {
    if (\request('_scope_') == 'trashed') {
        $batch->add(new BatchRestore());
    }
});
```


## 軟刪除內使用不同的操作介面
1. 控制器上方use
```php
// 圖形按鈕，如沒有要使用單一恢復或者其他自定義操作的按鈕時才可使用
use Encore\Admin\Grid\Displayers\Actions; 
// 下拉選單
use Encore\Admin\Grid\Displayers\DropdownActions;
// 右鍵選單
use Encore\Admin\Grid\Displayers\ContextMenuActions; 
```
2. 添加按鈕
```php
// 添加右鍵選單
if(\request('_scope_') == 'trashed'){
    $grid->setActionClass(ContextMenuActions::class);
}
// 添加下拉選單
if(\request('_scope_') == 'trashed'){
    $grid->setActionClass(DropdownActions::class);
}
// 添加圖型選單
if(\request('_scope_') == 'trashed'){
    $grid->setActionClass(Actions::class);
}
```