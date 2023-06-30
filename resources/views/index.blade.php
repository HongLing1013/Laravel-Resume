@extends('layouts.home')

@section('readMe')
    <h1><a href="/">{{$indexText->title}}</a></h1>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html" class="mr-auto"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a> -->
    <h2>{!! $indexText->content !!}</h2>
@endsection

@section('social')
    <div class="social-links">
        @foreach ($social as $social)
          <a href="@if(empty($social->href)) # @else {{$social->href}} @endif" class="{{$social->name}}"><i class="{{$social->icon}}"></i></a>
        @endforeach
    </div>
@endsection

@section('content')
  @foreach ($menus as $menu)
    <section id="{{$menu->title}}" class="{{$menu->title}}">
      @include('layouts.' . $menu->title , ['tagName' => $menu->title , 'tagText' => $menu->content])
    </section>
  @endforeach
@endsection

@section('footer')
Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
@endsection