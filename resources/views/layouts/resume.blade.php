  <!-- ======= Resume Section ======= -->
    <div class="container">

      <div class="section-title">
        <h2>{{$tagName}}</h2>
        <p>{{$tagText}}</p>
      </div>


      <div class="row">
        @foreach($resumes as $resume)
          @switch($resume->name)
              @case('Sumary')
              <div class="col-lg-6">
              
                <h3 class="resume-title">{{ $resume->name }}</h3>
                <div class="resume-item pb-0">

                  @if(!empty($resume->resumeSumary))
                    @foreach($resume->resumeSumary as $summary)
                      <h4>{{ $summary->name }}</h4>
                      <p>{!! $summary->summary !!}</p>
                      <p>
                      <ul>
                        <li>{{ $summary->address }}</li>
                        <li>{{ $summary->phone }}</li>
                        <li>{{ $summary->email }}</li>
                      </ul>
                      </p>
                    @endforeach
                  @endif

                </div>

                  @break
              @case('Education')

                <h3 class="resume-title">{{ $resume->name }}</h3>

                @if(!empty($resume->resumeEduction))
                  @foreach($resume->resumeEduction as $education)

                    <div class="resume-item">
                      <h4>{{ $education->degree }}</h4>
                      <h5>{{ \Carbon\Carbon::parse($education->year_from)->format('Y') }} - {{ \Carbon\Carbon::parse($education->year_to)->format('Y') }}</h5>
                      <p>{{ $education->institution }}</p>
                      <p>{{ $education->description }}</p>
                    </div>

                  @endforeach
                @endif

              </div>  <!-- col-lg-6 -->  
                  @break
              @case('Professional Experience')
              <div class="col-lg-6">

                <h3 class="resume-title">{{ $resume->name }}</h3>
                <div class="resume-item">
                  <h4>Senior graphic design specialist</h4>
                  <h5>2019 - Present</h5>
                  <p><em>Experion, New York, NY </em></p>
                  <p>
                  <ul>
                    <li>Lead in the design, development, and implementation of the graphic, layout, and production communication materials</li>
                    <li>Delegate tasks to the 7 members of the design team and provide counsel on all aspects of the project. </li>
                    <li>Supervise the assessment of all graphic materials in order to ensure quality and accuracy of the design</li>
                    <li>Oversee the efficient use of production project budgets ranging from $2,000 - $25,000</li>
                  </ul>
                  </p>
                </div>
                <div class="resume-item">
                  <h4>Graphic design specialist</h4>
                  <h5>2017 - 2018</h5>
                  <p><em>Stepping Stone Advertising, New York, NY</em></p>
                  <p>
                  <ul>
                    <li>Developed numerous marketing programs (logos, brochures,infographics, presentations, and advertisements).</li>
                    <li>Managed up to 5 projects or tasks at a given time while under pressure</li>
                    <li>Recommended and consulted with clients on the most appropriate graphic design</li>
                    <li>Created 4+ design presentations and proposals a month for clients and account managers</li>
                  </ul>
                  </p>
                </div>

              </div>
                  @break
              @default
                  
          @endswitch
        @endforeach
      </div><!-- row -->
    </div>
<!-- End Resume Section -->