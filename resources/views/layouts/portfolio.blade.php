  <!-- ======= Portfolio Section ======= -->
    <div class="container">

      <div class="section-title">
        <h2>{{ $tagName }}</h2>
        <p>{{ $tagText }}</p>
      </div>

      <div class="row">
        <div class="col-lg-12 d-flex justify-content-center">
          <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
            @foreach ($categories as $category)
              <li data-filter=".filter-{{ $category->name }}">{{ $category->name }}</li>
            @endforeach
          </ul>
        </div>
      </div>

      <div class="row portfolio-container">

        @foreach ($categories as $category)
          @foreach ($category->portfolio as $portfolio)
            <div class="col-lg-4 col-md-6 portfolio-item filter-{{ $category->name }}">
              <div class="portfolio-wrap">
                <img src="{{ $portfolio->image }}" class="img-fluid" alt="">
                <div class="portfolio-info">
                  <h4>{{ $portfolio->text }}</h4>
                  <p>{{ $category->name }}</p>
                  <div class="portfolio-links">
                    <a href="{{ $portfolio->image }}" data-gallery="portfolioGallery" class="portfolio-lightbox" title="{{ $portfolio->text }}"><i class="bx bx-plus"></i></a>
                    <a href="{{ $portfolio->href }}" data-gallery="portfolioDetailsGallery" data-glightbox="type: external" class="portfolio-details-lightbox" title="Portfolio Details"><i class="bx bx-link"></i></a>
                  </div>
                </div>
              </div>
            </div>
          @endforeach
        @endforeach

      </div>

    </div>
<!-- End Portfolio Section -->