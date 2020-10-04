<template>
    <div class="container">
        <div class="row mt-5" v-if="$gate.isAuthorized()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Region Management</h3>

                        <div class="card-tools">
                            <button type="" @click="newRegion" class="btn btn-primary"><i class="fas fa-folder-plus fa-fw"></i> Add New Region</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <vue-nestable v-model="regions" :max-depth="1" v-on:change="listChange(regions)">
                                <template slot-scope="{ item }">
                                    <!-- Handler -->
                                    <vue-nestable-handle :item="item">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <i class="fas fa-bars"> </i> <span>{{ item.title }} / {{ item.slug }} </span>
                                            </div>
                                            <div class="col-md-4 item_actions">
                                                <router-link :to="'/addregions/' + item.slug" class="btn btn-sm btn-success">Add Details
                                                    <i class="fas fa-plus"></i>
                                                </router-link>
                                                <a href="#" @click="editRegion(item, item.menu_categories, item.difficulty, item.best_season, item.types, item.group_size)" class="btn btn-sm btn-success">Edit
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="#" @click="deleteRegion(item.id)" class="btn btn-sm btn-danger">Delete
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </vue-nestable-handle>
                                    <!-- Region -->
                                </template>
                            </vue-nestable>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addNewRegion" tabindex="-1" role="dialog" aria-labelledby="addNewRegionLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode" id="addNewRegionLabel">Add New Region</h5>
                        <h5 class="modal-title" v-show="editmode" id="addNewRegionLabel">Update Region</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="editmode ? updateRegion() : createRegion()">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
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
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success"><i class="fas fa-plus fa-fw"></i>Update</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary"><i class="fas fa-plus fa-fw"></i>Create and Procced</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of modal-->
    </div>
</template>

<script type="text/babel">
    import Multiselect from 'vue-multiselect'
    export default {
        components: {
            Multiselect,
        },
        data () {
            return {
                editmode: false,
                totalregion : 0,
                regions : [],
                form: new Form({
                    id:'',
                    title :'',
                    slug :''
                })
            }
        },


        methods : {
            /*===== Call add new region modal ====*/
            newRegion(){
                this.editmode = false;
                this.form.reset();
                $('#addNewRegion').modal('show');
            },
            /*Create User Function Starts*/
            createRegion(){
                this.$Progress.start(); //start a progress bar
                this.form.post('api/regions') // POST form data
                //Start Condition to check form is validate
                    .then(({ data })=>{
                        if(data.message == 'created'){
                            window.location.href = 'addregions/'+data.slug;
                        }
                        //Fire.$emit('AfterCreate'); //custom event to reload data

                        //$("#addNewRegion").modal('hide'); //Hide the model

                        //Sweetalert notification for the result
                        /*Toast.fire({
                            type: 'success',
                            title: 'Region Created Successfully'
                        })*/

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
            listChange(newregion){
                //console.log(newregion);

                axios({
                    method: 'post',
                    url: 'api/orderRegion',
                    data: {
                        newregion
                    },
                })
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data
                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Region Sorted Successfully'
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
            /*==== End of Region Create ====*/

            /*==== Call edit Modal with Region data ====*/
            editRegion(regions){
                this.editmode = true;
                this.form.reset();
                $('#addNewRegion').modal('show');
                this.form.fill(regions);
            },
            /*Edit Region Function*/
            updateRegion(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('api/regions/'+this.form.id)
                    .then(() =>{
                        $("#addNewRegion").modal('hide'); //Hide the model
                        swal.fire(
                            'Updated!',
                            'Region info. has been updated.',
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
            deleteRegion(id){
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
                        this.form.delete('api/regions/' + id).then(() => {
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

            loadRegions(){
                this.$Progress.start();
                if (this.$gate.isAuthorized()){
                    axios.get("api/regions").then(({ data }) => (this.regions = data, this.totalregion = data.total));
                    this.$Progress.finish();
                }
            }
        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('api/findRegion?q='+ query)
                    .then((data)=>{
                        this.regions = data.data
                    }).catch(()=>{

                })
            })

            this.loadRegions(); //load the user in the table

            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadRegions();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
