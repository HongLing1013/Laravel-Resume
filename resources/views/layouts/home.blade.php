<!DOCTYPE html>
<html lang="en">

<head>
  @include('layouts.head')
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header">
    @include('layouts.header')
  </header><!-- End Header -->

  @yield('content')

  <div class="credits">
    @yield('footer')
  </div>

@include('layouts.js')

</body>

</html>