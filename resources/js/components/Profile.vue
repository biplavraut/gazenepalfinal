<style>
    .is-equal{
        border-color: green;
        box-shadow: 0 0 0 0.2rem rgba(73, 231, 25, 0.25) !important;
    }
</style>

<template>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-3">
                <!-- Profile Image -->
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <div class="text-center">
                            <img class="profile-user-img img-fluid img-circle" :src="getProfilePhoto()" alt="User profile picture">
                        </div>

                        <h3 class="profile-username text-center">{{form.name}}</h3>

                        <p class="text-muted text-center">{{form.type}}</p>

                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b>Facebook</b>
                                <a href="" traget="blank" class="float-right"><i class="fas fa-link"></i></a>
                            </li>
                            <li class="list-group-item">
                                <b>Instagram</b><a href="" traget="blank" class="float-right"><i class="fas fa-link"></i> </a>
                            <li class="list-group-item">
                                <b>Github</b> <a href="" traget="blank" class="float-right"><i class="fas fa-link"></i> </a>
                            </li>
                        </ul>
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#socialLink">
                                Add Social Link
                            </button>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header p-2">
                        <ul class="nav nav-pills">
                            <li class="nav-item"><a class="nav-link active show" href="#settings" data-toggle="tab">Settings</a></li>
                            <li class="nav-item"><a class="nav-link" href="#activity" data-toggle="tab">Update Password</a></li>

                        </ul>
                    </div><!-- /.card-header -->
                    <div class="card-body">
                        <div class="tab-content">
                            <div class="tab-pane" id="activity">
                                <!-- Post -->
                                <div class="post">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label for="oldpassword" class="col-sm-2 control-label">Old password</label>

                                            <div class="col-sm-12">
                                                <input type="password" v-model="form.oldpassword" class="form-control" id="oldpassword" placeholder="Password" :class="{ 'is-invalid': form.errors.has('password') }">
                                                <has-error :form="form" field="oldpassword"></has-error>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="newpassword" class="col-sm-2 control-label">New password</label>
                                            <div class="col-sm-12">
                                                <input type="password" v-model="form.newpassword" class="form-control" v-bind:class="{ 'is-invalid': isActive, 'is-equal':fc}"  id="newpassword" placeholder="Password">
                                                <has-error :form="form" field="newpassword"></has-error>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="confirmpassword" class="col-sm-2 control-label">Confirm password</label>
                                            <div class="col-sm-12">
                                                <input type="password" v-model="form.confirmpassword" @input="check" class="form-control" v-bind:class="{ 'is-invalid': isActive, 'is-equal':fc}" id="confirmpassword" placeholder="Password">
                                                <has-error :form="form" field="confirmpassword"></has-error>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button @click.prevent="updatePassword" type="submit" class="btn btn-success">Update</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.post -->
                            </div>
                            <div class="tab-pane active show" id="settings">
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputName" class="col-sm-2 control-label">Name</label>

                                        <div class="col-sm-12">
                                            <input type="" v-model="form.name" class="form-control" id="inputName" placeholder="Name" :class="{ 'is-invalid': form.errors.has('name') }">
                                            <has-error :form="form" field="name"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>

                                        <div class="col-sm-12">
                                            <input type="" v-model="form.email" class="form-control" id="inputEmail" placeholder="Email" :class="{ 'is-invalid': form.errors.has('email') }">
                                            <has-error :form="form" field="email"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputExperience" class="col-sm-2 control-label">Experience</label>

                                        <div class="col-sm-12">
                                            <textarea type="" v-model="form.bio" class="form-control" id="inputExperience" placeholder="Experience" :class="{ 'is-invalid': form.errors.has('bio') }"></textarea>
                                            <has-error :form="form" field="bio"></has-error>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="photo" class="col-sm-2 control-label">Profile Photo</label>
                                        <div class="col-sm-12">
                                            <input type="file" id="photo" @change="updateProfile" name="photo" class="form-input">
                                        </div>

                                    </div>

                                    <!-- <div class="form-group">
                                                  <label for="password" class="col-sm-2 control-label">Password (Leave empty if not changing)</label>

                                                  <div class="col-sm-12">
                                                  <input type="password" v-model="form.password" class="form-control" id="password" placeholder="Password" :class="{ 'is-invalid': form.errors.has('password') }">
                                                  <has-error :form="form" field="password"></has-error>
                                                  </div>
                                              </div> -->
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button @click.prevent="updateInfo" type="submit" class="btn btn-success">Update</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div><!-- /.card-body -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </div>
        <div class="modal fade" id="socialLink" tabindex="-1" role="dialog" aria-labelledby="socialLinkLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="socialLinkLabel">Add social link</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form @submit.prevent="getSocialLink">
                            <div class="form-group">
                                <i class="fab fa-facebook-f blue"></i>
                                <input v-model="form.facebook" type="text" name="facebook"
                                       placeholder="Facebook"
                                       class="form-control" :class="{ 'is-invalid': form.errors.has('facebook') }">
                                <has-error :form="form" field="facebook"></has-error>
                            </div>
                            <div class="form-group">
                                <i class="fab fa-instagram blue"></i>
                                <input v-model="form.instagram" type="text" name="instagram"
                                       placeholder="Instagram"
                                       class="form-control" :class="{ 'is-invalid': form.errors.has('instagram') }">
                                <has-error :form="form" field="instagram"></has-error>
                            </div>
                            <div class="form-group">
                                <i class="fab fa-github blue"></i>
                                <input v-model="form.github" type="text" name="github"
                                       placeholder="Github"
                                       class="form-control" :class="{ 'is-invalid': form.errors.has('github') }">
                                <has-error :form="form" field="github"></has-error>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-success">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data() {
            return {
                isActive:true,
                fc:false,
                form: new Form({
                    id: '',
                    name: '',
                    email: '',
                    password: '',
                    type: '',
                    bio: '',
                    photo: '',
                    newpassword: '',
                    oldpassword: '',
                    confirmpassword: '',
                    facebook:'',
                    instagram: '',
                    github:'',
                })
            }
        },
        mounted() {
            console.log('Component mounted.')
        },
        methods: {
            getSocialLink() {
                this.$Progress.start(); //start a progress bar
                this.form.post('api/getSocialLink') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                            Fire.$emit('AfterCreate'); //custom event to reload data

                            $("#socialLink").modal('hide'); //Hide the model

                            //Sweetalert notification for the result
                            Toast.fire({
                                type: 'success',
                                title: 'Link Added Successfully'
                            })

                            this.$Progress.finish(); //End the progress bar
                        }
                    )
                    //if form is not valid of handle any errors
                    .catch(()=>{
                        swal.fire(
                            'Error!',
                            'Something Went Wrong.',
                            'warning'
                        )
                        this.$Progress.fail(); //End the progress bar
                    })
            },
            check(){
                if(this.form.newpassword == this.form.confirmpassword){
                    this.isActive = false ;
                    this.fc = true;
                }
                else{
                    this.isActive = true ;
                    this.fc = false;
                }
            },
            getProfilePhoto(){
                let photo = (this.form.photo.length > 200)? this.form.photo : "img/profile/thumbs/"+ this.form.photo;
                return photo;
            },
            updatePassword() {
                this.$Progress.start();
                if(this.form.newpassword == this.form.confirmpassword){
                    axios({
                        method: 'post',
                        url: 'api/updatePassword',
                        data: {
                            id: this.form.id,
                            oldpassword: this.form.oldpassword ,
                            newpassword: this.form.newpassword ,
                        },
                    })
                    //Start Condition to check form is validate
                        .then(()=>{
                            Fire.$emit('AfterCreate'); //custom event to reload data
                            //Sweetalert notification for the result
                            Toast.fire({
                                type: 'success',
                                title: 'Menu Sorted Successfully'
                            })

                            this.$Progress.finish(); //End the progress bar
                        })
                        //if form is not valid of handle any errors
                        .catch(()=>{
                            swal.fire(
                                'Error!',
                                'Something Went Wrong.',
                                'warning'
                            )
                            this.$Progress.fail(); //End the progress bar
                        })
                }else{
                    swal.fire(
                        'Opps..!',
                        'Password do not match',
                        'warning'
                    )
                }
            },
            updateInfo() {
                this.$Progress.start();
                this.form.put('api/profile')
                    .then(() => {
                        swal.fire(
                            'Updated!',
                            'User info. has been updated.',
                            'success'
                        )
                        this.$Progress.finish();
                        Fire.$emit('AfterCreate'); //Fire an reload event

                    }).catch(() => {
                    this.Progress.fail();
                });
            },
            updateProfile(e) {
                //console.log('Uploading');
                let file = e.target.files[0];
                //console.log(file);
                let reader = new FileReader();
                if (file['size'] < 2111775) {
                    reader.onloadend = (file) => {
                        //console.log('RESULT', reader.result)
                        this.form.photo = reader.result;
                    }
                    reader.readAsDataURL(file);
                    Fire.$emit('AfterCreate'); //Fire an reload event
                } else {
                    swal.fire(
                        'Opps..!',
                        'Image file exceeds 2MB size limit.',
                        'warning'
                    )
                }
            }
        },
        /*==== Start of Show existing User function ====*/
        loadUsers(){
            axios.get("api/profile")
                .then(({data}) => (this.form.fill(data))).catch();
        },
        /*==== End of existing User ====*/
        created() {
            axios.get("api/profile")
                .then(({data}) => (this.form.fill(data))).catch();

            //Load the user data if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadUsers();
            })
        }

    }
</script>
