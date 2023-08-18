  <!-- ======= About Section ======= -->
  @foreach($abouts as $about)
    @if($about->name == 'about')
      <!-- ======= About Me ======= -->
      <div class="about-me container">

        <div class="section-title">
          <h2>{{ $tagName }}</h2>
          <p>{{ $tagText }}</p>
        </div>
    
        @foreach($about->aboutAbout as $about)
          <div class="row">
            <div class="col-lg-4" data-aos="fade-right">
              <img src="{{ $about->img }}" class="img-fluid" alt="">
            </div>
            <div class="col-lg-8 pt-4 pt-lg-0 content" data-aos="fade-left">
              <h3>{{ $about->title }}</h3>
              <p class="fst-italic">
                {{ $about->description }}
              </p>
              <div class="row">
                <div class="col-lg-6">
                  <ul>
                    <li><i class="bi bi-chevron-right"></i> <strong>Birthday:</strong> <span>{{ \Carbon\Carbon::parse($about->birthday)->format('Y-m-d') }}</span></li>
                    <li><i class="bi bi-chevron-right"></i> <strong>Website:</strong> <span>{{ $about->website }}</span></li>
                    <li><i class="bi bi-chevron-right"></i> <strong>Phone:</strong> <span>{{ $about->phone }}</span></li>
                    <li><i class="bi bi-chevron-right"></i> <strong>City:</strong> <span>{{ $about->city }}</span></li>
                  </ul>
                </div>
                <div class="col-lg-6">
                  <ul>
                    <li><i class="bi bi-chevron-right"></i> <strong>Age:</strong> <span>{{ \Carbon\Carbon::parse($about->birthday)->age }}</span></li>
                    <li><i class="bi bi-chevron-right"></i> <strong>Degree:</strong> <span>{{ $about->degree }}</span></li>
                    <li><i class="bi bi-chevron-right"></i> <strong>PhEmailone:</strong> <span>{{ $about->phemailone }}</span></li>
                    <li><i class="bi bi-chevron-right"></i> <strong>Freelance:</strong> <span>{{ $about->freelance }}</span></li>
                  </ul>
                </div>
              </div>
              <p>{{ $about->details }}</p>
            </div>
          </div>
        @endforeach
      </div><!-- End About Me -->
    @endif

    @if($about->name == 'counts')
      <!-- ======= Counts ======= -->
      <div class="counts container">
        <div class="row">
          @foreach($about->aboutCounts as $count)
            <div class="col-lg-3 col-md-6  mt-5 mt-md-0">
              <div class="count-box">
                <i class="{{ $count->icon }}"></i>
                <span data-purecounter-start="0" data-purecounter-end="{{ $count->int }}" data-purecounter-duration="1" class="purecounter"></span>
                <p>{{ $count->name }}</p>
              </div>
            </div>
          @endforeach
        </div>
      </div><!-- End Counts -->
    @endif
    
    @if($about->name == 'skills')
      <!-- ======= Skills  ======= -->
      <div class="skills container">

        <div class="section-title">
          <h2>{{ $about->name }}</h2>
        </div>

        <div class="row skills-content">
          @foreach($about->aboutSkills as $key => $skills)
              <div class="col-lg-6">
                <div class="progress">
                  <span class="skill">{{ $skills->name }} <i class="val">{{ $skills->degree }}%</i></span>
                  <div class="progress-bar-wrap">
                    <div class="progress-bar" role="progressbar" aria-valuenow="{{ $skills->degree }}" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div>
              </div>
          @endforeach
        </div>

      </div><!-- End Skills -->
    @endif

    @if($about->name == 'interests')
      <!-- ======= Interests ======= -->
      <div class="interests container">

        <div class="section-title">
          <h2>{{ $about->name }}</h2>
        </div>

        <div class="row">
          @foreach($about->aboutInterests as $key => $interests)
            <div class="col-lg-3 col-md-4 mt-4 @if($key <= 3) mt-md-0 @endif">
              <div class="icon-box">
                <i class="{{ $interests->icon }}" style="color: {{ $interests->color }}"></i>
                <h3>{{ $interests->name }}</h3>
              </div>
            </div>
          @endforeach
        </div>

      </div><!-- End Interests -->
    @endif

    @if($about->name == 'testimonials')
      <!-- ======= Testimonials ======= -->
      <div class="testimonials container">

        <div class="section-title">
          <h2>{{ $about->name }}</h2>
        </div>

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">
            @foreach($about->aboutTestimonials as $testimonials)
              <div class="swiper-slide">
                <div class="testimonial-item">
                  <p>
                    <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                    {{ $testimonials->content }}
                    <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                  </p>
                  <img src="{{ $testimonials->image }}" class="testimonial-img" alt="">
                  <h3>{{ $testimonials->name }}</h3>
                  <h4>{{ $testimonials->job_title }}</h4>
                </div>
              </div><!-- End testimonial item -->
            @endforeach
          </div>
          <div class="swiper-pagination"></div>
        </div>

        <div class="owl-carousel testimonials-carousel"></div>

      </div><!-- End Testimonials  -->
    @endif

  @endforeach

<!-- End About Section -->