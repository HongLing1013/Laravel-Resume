@extends('layouts.home')

@section('readMe')
    <h1><a href="/">{{$indexText->title}}</a></h1>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html" class="mr-auto"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a> -->
    <h2>{!! $indexText->content !!}</h2>
@endsection

@section('social')
    <div class="social-links">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
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