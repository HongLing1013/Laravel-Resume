@php
$tagName = ['about' , 'resume' , 'services' , 'portfolio' , 'contact' ];
@endphp

@extends('layouts.home')

@section('readMe')
    <h1><a href="index.html">Emily Jones</a></h1>
    <!-- Uncomment below if you prefer to use an image logo -->
    <!-- <a href="index.html" class="mr-auto"><img src="/assets/img/logo.png" alt="" class="img-fluid"></a> -->
    <h2>I'm a passionate <span>graphic designer</span> from New York</h2>
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
  @foreach ($tagName as $tag)
      <section id="{{$tag}}" class="{{$tag}}">
        @include('layouts.' . $tag )
      </section>
  @endforeach
@endsection

@section('footer')
Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
@endsection