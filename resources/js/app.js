
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/*Start of Form Validation*/
import { Form, HasError, AlertError } from 'vform'; //form validation
window.Form = Form;

Vue.component(HasError.name, HasError);
Vue.component(AlertError.name, AlertError);


/*Start of Progress Bar*/
// Progress bar include
import VueProgressBar from 'vue-progressbar';
/*Define Options for progress bar*/
const options = {
    color: '#bffaf3',
    failedColor: '#874b4b',
    thickness: '5px',
    transition: {
        speed: '0.2s',
        opacity: '0.6s',
        termination: 300
    },
    autoRevert: true,
    location: 'top',
    inverse: false
};
/*End of defination*/
/*Call the progress bar*/
Vue.use(VueProgressBar, options)
/*End of Progress Bar*/

/*Sweet alert start*/
import Swal from "sweetalert2";
window.swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 3000
});

window.Toast = Toast;
/*End of sweet alert*/

/*Vue Nestable*/
import Vue from 'vue';
import VueNestableHandle from 'vue-nestable';
Vue.use(VueNestableHandle);

/*Start of Vue Routes*/
import VueRouter from 'vue-router';
Vue.use(VueRouter);


/*Defining all the routes*/
let routes = [
    { path: '/dashboard', component: require('./components/Dashboard.vue').default},
    { path: '/developer', component: require('./components/Developer.vue').default},
    { path: '/profile', component: require('./components/Profile.vue').default},
    { path: '/users', component: require('./components/Users.vue').default},
    //{ path: '/menus', component: require('./components/Menus.vue').default},
    { path: '/menus/:menu_slug', component: require('./components/Menus.vue').default, props:true},

    { path: '/devmenus', component: require('./components/Devmenus.vue').default},
    { path: '/contents', component: require('./components/Contents.vue').default},
    { path: '/regions', component: require('./components/Regions.vue').default},
    { path: '/addregions/:slug', component: require('./components/Addregions.vue').default, props:true},

    { path: '/activities', component: require('./components/Activities.vue').default},
    { path: '/addactivities/:slug', component: require('./components/Addactivities.vue').default, props:true},



    { path: '/blogs', component: require('./components/Blogs.vue').default},
    { path: '/testimonials', component: require('./components/Testimonials.vue').default},
    { path: '/contacts', component: require('./components/Contacts.vue').default},
    { path: '/adddetails/:slug', component: require('./components/Adddetails.vue').default, props:true},
    { path: '/slider', component: require('./components/Slider.vue').default},
    { path: '/team', component: require('./components/Team.vue').default},

    { path: '/partner', component: require('./components/Partner.vue').default},
    { path: '/seo', component: require('./components/Seo.vue').default},
    { path: '/addtrip', component: require('./components/Addtrip.vue').default},

    { path: '/*', component: require('./components/NotFound.vue').default}
]
const router = new VueRouter({
    mode: 'history',
    routes, // short for `routes: routes`
    linkActiveClass: 'active'
});


/*This is global filters for Vue JS*/
/*Upper case Filter*/
Vue.filter('upText', function(text){
    return text.charAt(0).toUpperCase() + text.slice(1);
});

/*Moment JS to format Date*/
import moment from 'moment'; //format date in vue
Vue.filter('myDate', function(created){
    return moment(created).format('Do MMMM  YYYY'); // April 7th 2019,(h:mm:ss a) 3:34:44 pm
});

/*End of date format*/

/*Start of Custom Event Listner Vue - Fires an event after a change*/
let Fire = new Vue();
window.Fire = Fire;

/*End of Custom event listner*/

/*Gate for Vue ACL in frontend*/
import Gate from "./Gate";
Vue.prototype.$gate = new Gate(window.user);
/*End of ACL authontication*/

/*Laravel Vue Pagination Starts*/
Vue.component('pagination', require('laravel-vue-pagination'));



/*End of Laravel vue pagination*/

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue').default
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue').default
);
Vue.component(
    'not-found',
    require('./components/NotFound.vue').default
);

Vue.component('example-component', require('./components/ExampleComponent.vue').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    router,
    data:{
        search:''
    },
    methods:{
        searchit: _.debounce(() =>{
            Fire.$emit('searching');
        },1000)
    }
});
