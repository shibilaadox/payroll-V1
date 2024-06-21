<!-- header start -->
<header class=" main-header bg-white d-flex justify-content-between p-2">
    <div class="logo">
        <img src="{{asset('assets/images/logo.png')}}" alt="" style="height:auto;width:55%;">
    </div>

    <div class="header-toggle">
        <div class="menu-toggle mobile-menu-icon">
            <div></div>
            <div></div>
            <div>
            </div>
        </div>
       

    </div>
    <div class="header-part-right">
        <!-- Full screen toggle -->
        <i class="i-Full-Screen header-icon d-none d-sm-inline-block" data-fullscreen=""></i>
              <!-- User avatar dropdown -->
              <div class="dropdown">
                <div class="user col align-self-end">
                    <img src="{{asset('assets/images/faces/1.jpg')}}" id="userDropdown" alt="" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">
    
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <div class="dropdown-header">
                            <i class="i-Lock-User mr-1"></i> {{auth()->user()->name}}
                        </div>
                       
                        <a class="dropdown-item" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">{{ __('Logout') }}</a><form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">@csrf</form>
                        {{-- <a class="dropdown-item" href="{{route('signIn')}}">Sign out</a> --}}
                    </div>
                </div>
            </div>
        {{-- <!-- Grid menu Dropdown --> --}}
        {{-- <div class="dropdown dropleft">
            <i class="i-Safe-Box text-muted header-icon" role="button" id="dropdownMenuButton" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false"></i>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <div class="menu-icon-grid">
                    <a href="#"><i class="i-Shop-4"></i> Home</a>
                    <a href="#"><i class="i-Library"></i> UI Kits</a>
                    <a href="#"><i class="i-Drop"></i> Apps</a>
                    <a href="#"><i class="i-File-Clipboard-File--Text"></i> Forms</a>
                    <a href="#"><i class="i-Checked-User"></i> Sessions</a>
                    <a href="#"><i class="i-Ambulance"></i> Support</a>
                </div>
            </div>
        </div> --}}
</header>
<!-- header close -->