  <!-- ======= Services Section ======= -->
    <div class="container">

      <div class="section-title">
        <h2>{{$tagName}}</h2>
        <p>{{$tagText}}</p>
      </div>

      <div class="row">
        @foreach ($services as $service)
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4">
            <div class="icon-box">
              <div class="icon"><i class="{{ $service->icon }}"></i></div>
              <h4><a href="">{{ $service->title }}</a></h4>
              <p>{{ $service->content }}</p>
            </div>
          </div>
        @endforeach
      </div>

    </div>
<!-- End Services Section -->