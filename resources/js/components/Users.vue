<template>
    <div class="container">
        <div class="row mt-5" v-if="$gate.isDevOrAdmin()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">User Management</h3>

                        <div class="card-tools">
                            <button type="" class="btn btn-primary" @click="newModal"><i class="fas fa-user-plus fa-fw"></i> Add New User</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody>
                            <tr>
                                <th>S.N.</th>
                                <th>Name</th>
                                <th>Slug</th>
                                <th>Email</th>
                                <th>Type</th>
                                <th>Registered At</th>
                                <th>Actions</th>
                            </tr>
                            <tr v-for="(user, index) in users.data" :key="user.id">
                                <td>{{index+1}}</td>
                                <td>{{user.name}}</td>
                                <td>{{user.slug}}</td>
                                <td>{{user.email}}</td>
                                <td><span class="tag tag-success">{{user.type | upText}}</span></td>
                                <td>{{user.created_at | myDate}}</td>
                                <td>
                                    <a href="#" @click="editModal(user)" class="btn btn-sm btn-success">Edit
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="#" @click="deleteUser(user.id)" class="btn btn-sm btn-danger">Delete
                                        <i class="fa fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            </tbody></table>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-md-6 pull-left">
                                <span>Showing {{users.data.length}} of {{this.totaluser}} Users.</span>
                            </div>
                            <div class="col-md-6 pull-right">
                                <pagination :data="users" @pagination-change-page="getResults"></pagination>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- /.card -->
            </div>

        </div>

        <div v-if="!$gate.isDevOrAdmin()">
            <not-found></not-found>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addNewUser" tabindex="-1" role="dialog" aria-labelledby="addNewUserLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode" id="addNewUserLabel">Add New User</h5>
                        <h5 class="modal-title" v-show="editmode" id="addNewUserLabel">Update User</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="editmode ? updateUser() : createUser()">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Full Name</div>
                                    </div>
                                    <input v-model="form.name" type="text" name="name"
                                           placeholder="John Doe"
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                    <has-error :form="form" field="name"></has-error>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Email Address</div>
                                    </div>
                                    <input v-model="form.email" type="email" name="email"
                                           placeholder="Email Address"
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
                                    <has-error :form="form" field="email"></has-error>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Short Bio</div>
                                </div>
                                <textarea v-model="form.bio" name="bio" id="bio"
                                        placeholder="Short bio for user (optional)"
                                          class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }"></textarea>
                                <has-error :form="form" field="bio"></has-error>
                            </div>
                            <div class="form-group">
                                <select name="type" v-model="form.type" id="type" class="form-control" :class="{ 'is-invalid': form.errors.has('email') }" >
                                    <option value="" selected disabled>--Select User Role--</option>
                                    <option v-if="$gate.isSupDevOrDev()" value="dev">Developer</option>
                                    <option v-if="$gate.isSupDevOrDev()" value="supadmin">Site Owner</option>
                                    <option v-if="$gate.isDevOrAdmin()" value="admin">Admin</option>
                                    <option v-if="$gate.isDevOrAdmin()" value="editor">Editor</option>
                                    <option value="user">Standard User</option>

                                </select>
                                <has-error :form="form" field="bio"></has-error>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Email Address</div>
                                    </div>
                                    <input v-model="form.password" type="password" name="password"
                                           placeholder="Secret Password"
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
                                    <has-error :form="form" field="password"></has-error>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success"><i class="fas fa-plus fa-fw"></i>Update</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary"><i class="fas fa-plus fa-fw"></i>Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        /*Filling the data into form*/
        data(){
            return{
                editmode: false,
                totaluser:0,
                users : {},
                form: new Form({
                    id:'',
                    name :'',
                    slug :'',
                    email:'',
                    password:'',
                    type:'',
                    bio:'',
                    photo:''
                })
            }
        },
        methods: {
            /*===== Start of pagination function =====*/
            getResults(page = 1) {
                axios.get('api/user?page=' + page)
                    .then(response => {
                        this.users = response.data;
                    });
            },

            /*===== Call add new user modal ====*/
            newModal(){
                this.editmode = false;
                this.form.reset();
                $('#addNewUser').modal('show');
            },
            /*Create User Function Starts*/
            createUser(){
                this.$Progress.start(); //start a progress bar
                this.form.post('api/user') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data

                        $("#addNewUser").modal('hide'); //Hide the model

                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'User Created Successfully'
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

            },
            /*==== End of User Create ====*/

            /*==== Call edit Modal with user data ====*/
            editModal(user){
                this.editmode = true;
                this.form.reset();
                $('#addNewUser').modal('show');
                this.form.fill(user);
            },
            /*Edit User Function*/
            updateUser(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('api/user/'+this.form.id)
                .then(() =>{
                    $("#addNewUser").modal('hide'); //Hide the model
                    swal.fire(
                        'Updated!',
                        'User info. has been updated.',
                        'success'
                    )
                    this.$Progress.finish();
                    Fire.$emit('AfterCreate'); //Fire an reload event

                }).catch(()=>{
                    this.$Progress.fail();
                });
            },
            /*==== End of edit user function ====*/

            /*==== Call Delete Modal uith user id ====*/
            deleteUser(id){
                swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    //send an ajax request to the server
                    if (result.value) {
                        this.form.delete('api/user/' + id).then(() => {
                            swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            )
                            Fire.$emit('AfterCreate'); //Fire an reload event
                        }).catch(() => {
                            swal.fire(
                                'Warning!',
                                'Unauthorized Access to delete.',
                                'warning'
                            )
                        })
                    }

                })
            },
            /*==== End of Delete Modal ====*/

            /*==== Start of Show existing User function ====*/
            loadUsers(){
                if (this.$gate.isDevOrAdmin()){
                    axios.get("api/user").then(({ data }) => (this.users = data, this.totaluser = data.total));
                }
            }
            /*==== End of existing User ====*/

        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('api/findUser?q='+ query)
                    .then((data)=>{
                        this.users = data.data
                    }).catch(()=>{

                })
            })

            this.loadUsers(); //load the user in the table

            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadUsers();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
