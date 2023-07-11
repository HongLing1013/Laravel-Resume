<nav id="navbar" class="navbar">
    <ul>
        @foreach($menus as $menu)
            @if($menu->title == 'home')
                <li><a class="nav-link" href="#header">{{ ucfirst($menu->title) }}</a></li>
            @else
                <li><a class="nav-link" href="#{{ $menu->title }}">{{ ucfirst($menu->title) }}</a></li>
            @endif
        @endforeach
    </ul>
    <i class="bi bi-list mobile-nav-toggle"></i>
</nav><!-- .navbar -->