<template>
    <div class="container">
        <div class="row mt-5" v-if="$gate.isAuthorized()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Contact Management</h3>

                        <div class="card-tools">
                            <button type="" class="btn btn-primary" @click="newContact"><i class="fas fa-phone fa-fw"></i> Add New Contact info.</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <tbody><tr>
                                <th>S.N.</th>
                                <th>Title</th>
                                <th>Unique Slug</th>
                                <th>icon</th>
                                <th>Detail</th>
                                <th>Actions</th>
                            </tr>
                            <tr v-for="(contact, index) in contacts.data" :key="contact.id">
                                <td>{{index+1}}</td>
                                <td v-if="contact">{{contact.title | upText}}</td>
                                <td>{{contact.slug}}</td>
                                <td>{{contact.icon}}</td>
                                <td>{{contact.excerpt}}</td>
                                <td>
                                    <a href="#" @click="editContact(contact)" class="btn btn-sm btn-success">Edit
                                        <i class="fa fa-edit"></i>
                                    </a>
                                    <a href="#" @click="deleteContact(contact.id)" class="btn btn-sm btn-danger">Delete
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
                                <span>Showing {{contacts.data.length}} of {{this.totalcontact}} Contacts.</span>
                            </div>
                            <div class="col-md-6 pull-right">
                                <pagination :data="contacts" @pagination-change-page="getResults"></pagination>
                            </div>
                        </div>


                    </div>
                </div>
                <!-- /.card -->
            </div>

        </div>

        <div v-if="!$gate.isAuthorized()">
            <not-found></not-found>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addNewContact" tabindex="-1" role="dialog" aria-labelledby="addNewContactLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode" id="addNewContactLabel">Add New Contact info.</h5>
                        <h5 class="modal-title" v-show="editmode" id="addNewContactLabel">Update Contact info.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="editmode ? updateContact() : createContact()">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Title</div>
                                    </div>
                                    <input v-model="form.title" type="text" name="title"
                                           placeholder="Package Title."
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                    <has-error :form="form" field="title"></has-error>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Icons</div>
                                    </div>
                                    <input v-model="form.icon" type="text" name="icon"
                                           placeholder="Icon if available."
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('icon') }">
                                    <has-error :form="form" field="icon"></has-error>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input v-model="form.display" type="checkbox" name="display" :class="{ 'is-invalid': form.errors.has('display') }">
                                        </div>
                                    </div>
                                    <input type="text" value="Display" class="form-control" disabled>
                                    <has-error :form="form" field="display"></has-error>
                                </div>
                            </div>
                            <div class="form-group">
                                <textarea v-model="form.excerpt" name="excerpt" id="excerpt"
                                          placeholder="Detail of contact info."
                                          class="form-control" :class="{ 'is-invalid': form.errors.has('excerpt') }"></textarea>
                                <has-error :form="form" field="excerpt"></has-error>
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
                totalcontact:0,
                contacts : {},
                form: new Form({
                    id:'',
                    title :'',
                    slug :'',
                    icon:'',
                    display:'',
                    excerpt:''
                })
            }
        },
        methods: {
            /*===== Start of pagination function =====*/
            getResults(page = 1) {
                axios.get('api/contact?page=' + page)
                    .then(response => {
                        this.contacts = response.data;
                    });
            },

            /*===== Call add new user modal ====*/
            newContact(){
                this.editmode = false;
                this.form.reset();
                $('#addNewContact').modal('show');
            },
            /*Create User Function Starts*/
            createContact(){
                this.$Progress.start(); //start a progress bar
                this.form.post('api/contact') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data

                        $("#addNewContact").modal('hide'); //Hide the model

                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Contact Created Successfully'
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
            editContact(contact){
                this.editmode = true;
                this.form.reset();
                $('#addNewContact').modal('show');
                this.form.fill(contact);
            },
            /*Edit User Function*/
            updateContact(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('api/contact/'+this.form.id)
                    .then(() =>{
                        $("#addNewContact").modal('hide'); //Hide the model
                        swal.fire(
                            'Updated!',
                            'Contact info. has been updated.',
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
            deleteContact(id){
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
                        this.form.delete('api/contact/' + id).then(() => {
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
            loadContacts(){
                if (this.$gate.isAuthorized()){
                    axios.get("api/contact").then(({ data }) => (this.contacts = data, this.totalcontact = data.total));
                }
            }
            /*==== End of existing User ====*/

        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('api/findContact?q='+ query)
                    .then((data)=>{
                        this.contacts = data.data
                    }).catch(()=>{

                })
            })

            this.loadContacts(); //load the user in the table

            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadContacts();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
