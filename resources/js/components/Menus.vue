<template>
    <div class="container">
        <div class="row mt-5" v-if="$gate.isAuthorized()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Category Management: {{this.menu_slug}}</h3>

                        <div class="card-tools">
                            <button type="" @click="newMenu" class="btn btn-primary"><i class="fas fa-bars fa-fw"></i> Add New</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <vue-nestable v-model="menus" :max-depth="2" v-on:change="listChange(menus)">
                                <template slot-scope="{ item }">
                                    <!-- Handler -->
                                    <vue-nestable-handle :item="item">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <i class="fas fa-bars"> </i> <span>{{ item.title }} / {{ item.slug }} </span>
                                            </div>
                                            <div class="col-md-4 item_actions">
                                                <a href="#" @click="editMenu(item)" class="btn btn-sm btn-success">Edit
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="#" @click="deleteMenu(item.id)" class="btn btn-sm btn-danger">Delete
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </vue-nestable-handle>
                                    <!-- Content -->
                                </template>
                            </vue-nestable>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addNewMenu" tabindex="-1" role="dialog" aria-labelledby="addNewMenuLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode" id="addNewMenuLabel">Add New</h5>
                        <h5 class="modal-title" v-show="editmode" id="addNewMenuLabel">Update</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="editmode ? updateMenu() : createMenu()">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Title</div>
                                    </div>
                                    <input v-model="form.title" type="text" name="title"
                                           placeholder="Menu Title."
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                    <has-error :form="form" field="title"></has-error>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Image</div>
                                    </div>
                                    <input type="file" name="image"  @change="imageUpload"
                                           placeholder="Image"
                                           class="btn btn-sm btn-info" :class="{ 'is-invalid': form.errors.has('image') }">
                                    <has-error :form="form" field="image"></has-error>
                                </div>
                            </div>
                                </div>
                                <div class="col-md-6">
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
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6"><div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input v-model="form.type" type="checkbox" name="type"
                                                   :class="{ 'is-invalid': form.errors.has('type') }">
                                        </div>
                                    </div>
                                    <input type="text" value="Product or Service Category" class="form-control" disabled>
                                    <has-error :form="form" field="type"></has-error>
                                </div>
                               </div>
                            </div> 
                                <div class="col-md-6">
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
                                    </div>                           
                            </div>
                            <!-- <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Price</div>
                                    </div>
                                    <input v-model="form.title" type="text" name="price"
                                           placeholder="Price."
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('price') }">
                                    <has-error :form="form" field="price"></has-error>
                                </div>
                            </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Duration</div>
                                    </div>
                                    <input v-model="form.duration" type="text" name="duration"
                                           placeholder="Duration"
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('duration') }">
                                    <has-error :form="form" field="duration"></has-error>
                                </div>
                            </div>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Accommodation</div>
                                    </div>
                                    <input v-model="form.title" type="text" name="accommodation"
                                           placeholder="Accommodation"
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('accommodation') }">
                                    <has-error :form="form" field="accommodation"></has-error>
                                </div>
                            </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Transportation</div>
                                    </div>
                                    <input v-model="form.transportation" type="text" name="transportation"
                                           placeholder="Menu Title."
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('transportation') }">
                                    <has-error :form="form" field="transportation"></has-error>
                                </div>
                            </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                      <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input v-model="form.pool" type="checkbox" name="pool" :class="{ 'is-invalid': form.errors.has('pool') }">
                                        </div>
                                    </div>
                                    <input type="text" value="Poll" class="form-control" disabled>
                                    <has-error :form="form" field="pool"></has-error>
                                </div>
                               </div>
                                </div>
                                 <div class="col-md-4">
                                      <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input v-model="form.internet" type="checkbox" name="internet" :class="{ 'is-invalid': form.errors.has('internet') }">
                                        </div>
                                    </div>
                                    <input type="text" value="Internet" class="form-control" disabled>
                                    <has-error :form="form" field="internet"></has-error>
                                </div>
                              </div>
                                </div>
                                <div class="col-md-4">
                                      <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">
                                            <input v-model="form.cleaning" type="checkbox" name="cleaning" :class="{ 'is-invalid': form.errors.has('cleaning') }">
                                        </div>
                                    </div>
                                    <input type="text" value="Cleaning" class="form-control" disabled>
                                    <has-error :form="form" field="cleaning"></has-error>
                                </div>
                                 </div>
                                </div>
                            </div> -->
                            <div class="form-group"> 
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Excerpt</div>
                                </div>
                                <vue-editor v-model="form.excerpt" placeholder="Excerpt"></vue-editor>
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
        <!--End of modal-->
    </div>
</template>

<script type="text/babel">
    export default {
        watch:{
            '$route' (to, from) {
                // react to route changes...
            }
        },
        data () {
            return {
                editmode: false,
                totalmenu : 0,
                menus : [],
                menu_slug: this.$route.params.menu_slug,
                form: new Form({
                    id:'',
                    menu_slug: this.$route.params.menu_slug,
                    title :'',
                    slug :'',
                    image:'',
                    icon:'',
                    display:'',
                    // pool:'',
                    // cleaning: '',
                    // internet: '',
                    // price:'',
                    // duration: '',
                    // accmmodation:'',
                    // transportation: '',
                    type:'',
                    parent_id:'',
                    child:'',
                    order_item:'',
                    excerpt:''
                })
            }
        },

        methods : {
            /*===== Call add new Menu modal ====*/
            newMenu(){
                this.editmode = false;
                this.form.reset();
                $('#addNewMenu').modal('show');
            },
            imageUpload(e) {
                //console.log('Uploading');
                let file = e.target.files[0];
                //console.log(file);
                let reader = new FileReader();
                if (file['size'] < 2111775) {
                    reader.onloadend = (file) => {
                        //console.log('RESULT', reader.result)
                        this.form.image = reader.result;
                    }
                    reader.readAsDataURL(file);
                    //Fire.$emit('AfterCreate'); //Fire an reload event
                } else {
                    swal.fire(
                        'Opps..!',
                        'Image file exceeds 2MB size limit.',
                        'warning'
                    )
                }
            },
            /*Create User Function Starts*/
            createMenu(){
                this.$Progress.start(); //start a progress bar
                this.form.post('../api/menu') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data

                        $("#addNewMenu").modal('hide'); //Hide the model

                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Menu Created Successfully'
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
            listChange(newmenu){
                console.log(newmenu);

                axios({
                    method: 'post',
                    url: '../api/orderList',
                    data: {
                        newmenu
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

            },
            /*==== End of Menu Create ====*/
            /*==== Call edit Modal with user data ====*/
            editMenu(menus){
                this.editmode = true;
                this.form.reset();
                $('#addNewMenu').modal('show');
                this.form.fill(menus);
            },
            /*Edit User Function*/
            updateMenu(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('../api/menu/'+this.form.id)
                    .then(() =>{
                        $("#addNewMenu").modal('hide'); //Hide the model
                        swal.fire(
                            'Updated!',
                            'Menu info. has been updated.',
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
            deleteMenu(id){
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
                        this.form.delete('../api/menu/' + id).then(({ data }) => {
                            if(data === 'deleted'){
                                swal.fire(
                                    'Deleted!',
                                    'Your file has been deleted.',
                                    'success'
                                )
                            }else if(data === 'access-denied')
                            {
                                swal.fire(
                                    'Warning!',
                                    'Unauthorized Access to delete.',
                                    'warning'
                                )
                            }

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

            loadMenus(){
                this.$Progress.start();
                if (this.$gate.isAuthorized()){
                    axios.get('../api/menu?menu_slug='+this.menu_slug).then(({ data }) => (this.menus = data, this.totalmenu = data.total));
                    this.$Progress.finish();
                }
            }

        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('../api/findMenu?q='+ query)
                    .then((data)=>{
                        this.menus = data.data
                    }).catch(()=>{

                })
            })

            this.loadMenus(); //load the user in the table

            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadMenus();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
