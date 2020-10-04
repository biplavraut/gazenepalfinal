<?php

namespace App\Providers;
use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('isAuthorized',function($user){
            if ($user->type==='supdev' || $user->type==='dev' || $user->type==='supadmin' || $user->type==='admin'){
                return true;
            }else{
                return false;
            }
        });
        Gate::define('isSupDev',function($user){
            return $user->type === 'supdev';
        });
        Gate::define('isDev',function($user){
            return $user->type === 'dev';
        });
        Gate::define('isSupAdmin',function($user){
            return $user->type === 'supadmin';
        });
        Gate::define('isAdmin',function($user){
            return $user->type === 'admin';
        });
        Gate::define('isEditor',function($user){
            return $user->type === 'editor';
        });
        Gate::define('isUser',function($user){
            return $user->type === 'user';
        });

        Passport::routes();
        //
    }
}
