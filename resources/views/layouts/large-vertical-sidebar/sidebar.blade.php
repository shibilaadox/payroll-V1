
<div class="side-content-wrap">
    <div class="sidebar-left open rtl-ps-none" data-perfect-scrollbar data-suppress-scroll-x="true" style="
    background: rgba(56, 10, 16, 0.9803921568627451);">
        <ul class="navigation-left">
            <li class="nav-item {{ request()->is('home/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('home')}}">
                    <i class="nav-icon i-Bar-Chart" style="color:white"></i>
                    <span class="nav-text" style="color:white">Dashboard</span>
                </a>
                <div class="triangle"></div>
            </li>
            @can('Roles')
            <li class="nav-item {{ request()->is('roles/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('roles.index')}}">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">Roles</span>
                </a>
                <div class="triangle"></div>
            </li>
            @endcan

            @can('Users')
            <li class="nav-item {{ request()->is('users/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('users.index')}}">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">Users</span>
                </a>
                <div class="triangle"></div>
            </li>
            @endcan

           
            <li class="nav-item {{ request()->is('users/*') ? 'active' : '' }}" data-item="organization">
                <a class="nav-item-hold" href="">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">Organization</span>
                </a>
                <div class="triangle"></div>
            </li>
           
            @can('Payroll')
            <li class="nav-item {{ request()->is('payrolls_hourly/*') ? 'active' : '' }}" data-item="payroll">
                <a class="nav-item-hold" href="">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">Payroll</span>
                </a>
                <div class="triangle"></div>
            </li>
            @endcan

            
            @can('Leave Tracker')
            <li class="nav-item {{ request()->is('holidays/*') ? 'active' : '' }}" data-item="leavetracker">
                <a class="nav-item-hold" href="">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">Leave Tracker</span>
                </a>
                <div class="triangle"></div>
            </li>
            @endcan
            
            @can('Clients')
            <li class="nav-item {{ request()->is('clients/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('clients.index')}}">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">{{__('Clients')}}</span>
                </a>
                <div class="triangle"></div>
            </li>
            @endcan
            
            @can('Projects')
             <li class="nav-item {{ request()->is('projects/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('projects.index')}}">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">{{__('Projects')}}</span>
                </a>
                <div class="triangle"></div>
            </li>
            @endcan

            @can('Assets')
            <li class="nav-item {{ request()->is('assets/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('machines.index')}}">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">{{__('Assets')}}</span>
                </a>
                <div class="triangle"></div>
            </li>

            @endcan
            
            @can('Track Employee')
            <li class="nav-item {{ request()->is('track/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('track')}}">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">{{__('Track Employees')}}</span>
                </a>
                <div class="triangle"></div>
            </li>

            @endcan
            @can('News')
            <li class="nav-item {{ request()->is('news/*') ? 'active' : '' }}">
                <a class="nav-item-hold" href="{{route('news.index')}}">
                    <i class="nav-icon i-Library" style="color:white"></i>
                    <span class="nav-text" style="color:white">{{__('News')}}</span>
                </a>
                <div class="triangle"></div>
            </li>

            @endcan
            
         </ul>
    </div>

    <div class="sidebar-left-secondary rtl-ps-none emdad_side_bar" data-perfect-scrollbar data-suppress-scroll-x="true">
        <!-- Submenu Dashboards -->
        
        <ul class="childNav" data-parent="organization">
        
            @can('Employee')
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='employee.index' ? 'open' : '' }}" href="{{route('employee.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Employee')}}</span>
                </a>
            </li>
            @endcan

            @can('Deductions')
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='deductions.index' ? 'open' : '' }}" href="{{route('deductions.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Deductions')}}</span>
                </a>
            </li>
            @endcan
            @can('Departments')
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='departments.index' ? 'open' : '' }}" href="{{route('departments.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Departments')}}</span>
                </a>
            </li>
            @endcan
            @can('Designations')
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='designations.index' ? 'open' : '' }}" href="{{route('designations.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Designations')}}</span>
                </a>
            </li>
            @endcan
            
            @can('Locations')
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='locations.index' ? 'open' : '' }}" href="{{route('locations.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Locations')}}</span>
                </a>
            </li>
            @endcan
            
            
        </ul>
       
        <ul class="childNav" data-parent="leavetracker">
            
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='holidays.index' ? 'open' : '' }}" href="{{route('holidays.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Holidays')}}</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='leaves.index' ? 'open' : '' }}" href="{{route('leaves.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Leave Requests')}}</span>
                </a>
            </li>
            
            
            
        </ul>
        
        <ul class="childNav" data-parent="payroll">
            
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='import-excel' ? 'open' : '' }}" href="{{route('import-excel')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Upload Timesheet')}}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='payrolls_hourly.index' ? 'open' : '' }}" href="{{route('payrolls_hourly.index')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Pay Runs')}}</span>
                </a>
            </li>
            
            <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='payrolls_hourly.payroll_history_hourly' ? 'open' : '' }}" href="{{route('payrolls_hourly.payroll_history_hourly')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">{{__('Payroll History')}}</span>
                </a>
            </li>
            
           <li class="nav-item">
                <a class="{{ Route::currentRouteName()=='payrolls_hourly.payroll_employee_hourly' ? 'open' : '' }}" href="{{route('payrolls_hourly.payroll_employee_hourly')}}">
                    <i class="nav-icon i-File-Clipboard-Text--Image"></i>
                    <span class="item-name">Employee's Payroll</span>
                </a>
            </li>
            
           
        </ul>
        
         
    </div>
    <div class="sidebar-overlay"></div>
</div>
<!--=============== Left side End ================-->