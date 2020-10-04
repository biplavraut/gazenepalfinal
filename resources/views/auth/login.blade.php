@extends('layouts.app')

@section('content')
    <body class="hold-transition login-page">
    <div class="container">
        <div class="row justify-content-center">

            <div class="login-box">
                <div class="card">
                    <div class="card-body login-card-body">
                        <p class="login-box-msg">Sign in to start your session</p>

                        <form method="POST" action="{{ route('travelcms') }}">
                            @csrf
                            <div class="input-group mb-3">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                                <div class="input-group-append">
                                    <span class="fa fa-envelope input-group-text"></span>
                                </div>
                            </div>
                            <div class="input-group mb-3">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                    <strong>{{ $errors->first('password') }}</strong>
                </span>
                                @endif
                                <div class="input-group-append">
                                    <span class="fa fa-lock input-group-text"></span>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="checkbox icheck">
                                        <input type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                        <label class="form-check-label" for="remember">
                                            {{ __('Remember Me') }}
                                        </label>
                                    </div>
                                </div>
                                <!-- /.col -->
                                <div class="col-12 mt-3">
                                    <button type="submit"  class="btn btn-primary">
                                        {{ __('Login') }}
                                    </button>
                                </div>
                                <!-- /.col -->
                            </div>
                        </form>
                        <p class="mb-1 mt-3">
                            @if (Route::has('password.request'))
                                <a class="btn-link" href="{{ route('password.request') }}">
                                    {{ __('Forgot Your Password?') }}
                                </a>
                            @endif
                        </p>
                    </div>
                    <!-- /.login-card-body -->
                </div>
            </div>
            <!-- /.login-box -->
        </div>
    </div>
    </body>

@endsection
