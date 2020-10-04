<?php
use \App\Http\Controllers\API\DevmenuController;
use \App\Devmenu;
$trip_menu = DevmenuController::showMenu();
?>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Travel CMS</title>

    <link rel="stylesheet" href="{{asset('css/app.css')}}">
    <link rel="stylesheet" href="{{asset('css/nestable.css')}}">
    <link rel="stylesheet" href="{{asset('css/vendor.css')}}">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper" id="app">

    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand bg-secondary navbar-light border-bottom">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
        </ul>

        <!-- SEARCH FORM -->
        <form class="form-inline ml-3">
            <div class="input-group input-group-sm">
                <input @keyup="searchit" v-model="search" class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-navbar" @click="searchit">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="fas fa-user"></i>
                    {{--<span class="badge badge-danger navbar-badge">3</span>--}}
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="/img/profile/thumbs/{{ Auth::user()->photo }}" alt="User Image" class="img-size-50 mr-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title green">
                                    {{ Auth::user()->name }}
                                </h3>
                                <p class="text-sm text-muted teal initialism"><i class="fa fa-clock-o mr-1"></i>{{ Auth::user()->type }}</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <router-link to="/profile"  class="dropdown-item dropdown-footer blue">
                        <i class="nav-icon teal fas fa-eye"></i> <span class="black">View Profile</span>
                    </router-link>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item dropdown-footer red" href="{{ route('logout') }}"
                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                        <i class="nav-icon red fas fa-power-off"></i>
                            <span class="black">{{ __('Logout') }}</span>
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </div>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->
        <router-link to="/dashboard" class="brand-link bg-secondary">
            <img src="/img/logo.png" alt="Company Logo" class="brand-image img-rounded elevation-5"
                 style="opacity:1">
            <span class="brand-text font-weight-light">Pers Creation</span>
        </router-link>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user panel (optional) -->
            {{--<div class="user-panel mt-3 mb-3 d-flex">
                <div class="image">
                    <img src="/img/developer.png" class="img-rounded elevation-5" alt="Developed by Pers Creation">
                </div>
                <div class="info">
                    <router-link to="/profile" class="d-block">{{ Auth::user()->name }}</router-link>
                    <p class="teal initialism">{{ Auth::user()->type }}</p>
                </div>
            </div>--}}

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <router-link  to="/dashboard" class="nav-link">
                            <i class="nav-icon  fas fa-tachometer-alt"></i>
                            <p>
                                Dashboard
                            </p>
                        </router-link>
                    </li>
                    @if(Gate::check('isSupDev') || Gate::check('isDev'))
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon orange fas fa-cogs"></i>
                                <p>
                                    Development Mode
                                    <i class="right fa fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview pl-2">
                                <li class="nav-item">
                                    <router-link to="/devmenus" class="nav-link">
                                        <i class="fas fa-bars nav-icon green"></i>
                                        <p>Add Trip Menus</p>
                                    </router-link>
                                </li>
                                {{--<li class="nav-item">
                                    <router-link to="/contents" class="nav-link">
                                        <i class="fas fa-folder nav-icon teal"></i>
                                        <p>Add Package Form</p>
                                    </router-link>
                                </li>--}}
                                <div class="dropdown-divider"></div>
                            </ul>

                        </li>
                    @endif
                    <li class="nav-item has-treeview">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fa fa-mountain"></i>
                            <p>
                                Trips Categories
                                <i class="right fa fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview pl-2">
                            @foreach ($trip_menu as $t_menu)
                                @if ($t_menu->display == 1)
                                    <li class="nav-item">
                                        <router-link to="/menus/{{$t_menu->slug}}" class="nav-link">
                                            <i class="fas fa-bars nav-icon green"></i>
                                            <p>{{ $t_menu->title }}</p>
                                        </router-link>
                                    </li>
                                @endif
                            @endforeach
                            {{--<li class="nav-item">
                                <router-link to="/menus" class="nav-link">
                                    <i class="fas fa-bars nav-icon green"></i>
                                    <p>Add Trip Categories</p>
                                </router-link>
                            </li>--}}

                            <div class="dropdown-divider"></div>
                        </ul>

                    </li>
                    
                    <li class="nav-item">
                        <router-link to="/regions" class="nav-link">
                        <i class="fas fa-map-marked  nav-icon green"></i>
                        <p>Region</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/activities" class="nav-link">
                        <i class="fas fa-hiking nav-icon orange"></i>
                         <p>Activity</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/contents" class="nav-link">
                            <i class="fas fa-folder nav-icon teal"></i>
                            <p>Add Trip Packages</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/slider" class="nav-link">
                            <i class="fas fa-sliders-h nav-icon cyan"></i>
                            <p>Slider Management</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/blogs" class="nav-link">
                            <i class="fas fa-blog nav-icon gray-dark"></i>
                            <p>Blogs Management</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/testimonials" class="nav-link">
                            <i class="fas fa-comment-dots nav-icon purple"></i>
                            <p>Testimonials Management</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/partner" class="nav-link">
                            <i class="fas fa-handshake nav-icon red"></i>
                            <p>Partner Management</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/contacts" class="nav-link">
                            <i class="fa fa-phone nav-icon yellow"></i>
                            <p>Contact Management</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/team" class="nav-link">
                        <i class="fas fa-users-cog nav-icon blue"></i>
                            <p>Team</p>
                        </router-link>
                    </li>
                    <li class="nav-item">
                        <router-link to="/seo" class="nav-link">
                            <i class="fas fa-star nav-icon teal"></i>
                            <p>SEO</p>
                        </router-link>
                    </li>
                    @if(Gate::check('isSupDev') || Gate::check('isDev') || Gate::check('isSupAdmin')|| Gate::check('isAdmin'))
                    <li class="nav-item">
                        <router-link to="/users" class="nav-link">
                            <i class="fas fa-users indigo nav-icon"></i>
                            <p>Users Management</p>
                        </router-link>
                    </li>
                    @endif
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper" id="app">

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <router-view :key="$route.fullPath"></router-view>

                <vue-progress-bar></vue-progress-bar>
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="float-right d-none d-sm-inline">
            Company Name
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2018-2019 <a href="https://perscreation.com" traget="_blank">Pers Creation </a><span class="fa fa-code"> </span> by <a href="https://biplavrajraut.com.np"  traget="_blank">Biplav</a></strong> All rights reserved.
    </footer>
</div>
<!-- ./wrapper -->
@auth
    <script>
        window.user = @json(auth()->user());
    </script>
@endauth

<!-- REQUIRED SCRIPTS -->

<script src="{{asset('js/app.js')}}"></script>
<script>
    //const app = new Vue({ router }).$mount('#app');
</script>
</body>
</html>
