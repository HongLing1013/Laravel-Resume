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

                @if(!empty($resume->resumeExperience))
                  @foreach($resume->resumeExperience as $experience)

                  <div class="resume-item">
                    <h4>{{ $experience->job_title }}</h4>
                    <h5>{{ \Carbon\Carbon::parse($experience->year_from)->format('Y') }} - 
                      @if (is_null($experience->year_to))
                        Present
                      @else
                        {{ \Carbon\Carbon::parse($experience->year_to)->format('Y') }}
                      @endif
                    </h5>
                    <p>{!! $experience->company !!}</p>
                    <p><ul>{!! $experience->job_description !!}</ul></p>
                  </div>

                  @endforeach
                @endif

              </div>
                  @break
              @default
                  
          @endswitch
        @endforeach
      </div><!-- row -->
    </div>
<!-- End Resume Section -->