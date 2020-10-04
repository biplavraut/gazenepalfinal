<template>
    <div class="container">
        <div class="row mt-5" v-if="$gate.isAuthorized()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Testimonial Management</h3>

                        <div class="card-tools">
                            <button type="" @click="newTestimonial" class="btn btn-primary"><i class="fas fa-plus"></i> Add New Testimonial</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <vue-nestable v-model="testimonials" :max-depth="1" v-on:change="listChange(testimonials)">
                                <template slot-scope="{ item }">
                                    <!-- Handler -->
                                    <vue-nestable-handle :item="item">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <i class="fas fa-bars"> </i> <span>{{ item.name }}</span>
                                            </div>
                                            <div class="col-md-4 item_actions">
                                                <a href="#" @click="editTestimonial(item, item.trip_testimonial)" class="btn btn-sm btn-success">Edit
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="#" @click="deleteTestimonial(item.id)" class="btn btn-sm btn-danger">Delete
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </vue-nestable-handle>
                                    <!-- Testimonial -->
                                </template>
                            </vue-nestable>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addNewTestimonial" tabindex="-1" role="dialog" aria-labelledby="addNewTestimonialLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode" id="addNewTestimonialLabel">Add New Testimonial</h5>
                        <h5 class="modal-title" v-show="editmode" id="addNewTestimonialLabel">Update Testimonial</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="editmode ? updateTestimonial() : createTestimonial()">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Client Name</div>
                                            </div>
                                            <input v-model="form.name" type="text" name="name"
                                                   placeholder="John Doe"
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                                            <has-error :form="form" field="name"></has-error>
                                        </div>
                                    </div>
                                </div>
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
                                                <div class="input-group-text">
                                                    <input v-model="form.display" type="checkbox" name="display" :class="{ 'is-invalid': form.errors.has('display') }">
                                                </div>
                                            </div>
                                            <input type="text" value="Display" class="form-control" disabled>
                                            <has-error :form="form" field="display"></has-error>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Country or Company</div>
                                            </div>
                                            <input v-model="form.country" type="text" name="country"
                                                   placeholder="Nepal, ABC Pvt. Ltd."
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('country') }">
                                            <has-error :form="form" field="country"></has-error>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Work or Post</div>
                                            </div>
                                            <input v-model="form.client_posts" type="text" name="client_posts"
                                                   placeholder="Managing Director."
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('client_posts') }">
                                            <has-error :form="form" field="client_posts"></has-error>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div>
                                            <span>Add Trip Testimonial</span>
                                            <multiselect v-model="form.trip_testimonial"
                                                         tag-placeholder="Add Trip to this Testimonial"
                                                         placeholder="Select Trips"
                                                         label="title"
                                                         track-by="id"
                                                         :options="options"
                                                         :multiple="true"
                                                         :menu_value="options.id"
                                                         :taggable="true"
                                                         @tag="addTag"></multiselect>
                                            <!--<label class="typo__label">Menu Categories</label>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Testimonial</div>
                                </div>
                                <div class="form-group">
                                    <vue-editor v-model="form.excerpt" placeholder="Testimonial Discription"></vue-editor>
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
        <!--End of modal-->
    </div>
</template>

<script type="text/babel">
    import Multiselect from 'vue-multiselect'
    import { VueEditor } from 'vue2-editor'
    export default {
        components: {
            Multiselect,
            VueEditor
        },
        data () {
            return {
                options: [],
                editmode: false,
                totaltestimonial : 0,
                testimonials : [],
                form: new Form({
                    id:'',
                    name :'',
                    slug :'',
                    image:'',
                    display:'',
                    order_item:'',
                    country:'',
                    client_posts:'',
                    trip_testimonial:'',
                    excerpt:''
                })
            }
        },
        methods : {
            addTag (newTag) {
                const tag = {
                    title: newTag,
                    id: newTag.substring(0, 2) + Math.floor((Math.random() * 10000000))
                }
                this.options.push(tag);
                this.value.push(tag);
            },
            /*===== Call add new content modal ====*/
            newTestimonial(){
                this.editmode = false;
                this.form.reset();
                $('#addNewTestimonial').modal('show');
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
            createTestimonial(){
                //alert(this.form.name);
                //exit();
                this.$Progress.start(); //start a progress bar
                this.form.post('api/testimonial') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data

                        $("#addNewTestimonial").modal('hide'); //Hide the model

                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Testimonial Created Successfully'
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
            listChange(newtestimonial){
                //console.log(newcontent);

                axios({
                    method: 'post',
                    url: 'api/orderTestimonial',
                    data: {
                        newtestimonial
                    },
                })
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data
                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Testimonial Sorted Successfully'
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
            /*==== End of content Create ====*/

            /*==== Call edit Modal with Content data ====*/
            editTestimonial(testimonials, tripTestimonial){
                this.editmode = true;
                this.form.reset();
                $('#addNewTestimonial').modal('show');
                this.form.fill(testimonials);
                this.form.trip_testimonial = JSON.parse(tripTestimonial);
            },
            /*Edit Testimonial Function*/
            updateTestimonial(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('api/testimonial/'+this.form.id)
                    .then(() =>{
                        $("#addNewTestimonial").modal('hide'); //Hide the model
                        swal.fire(
                            'Updated!',
                            'Testimonial has been updated.',
                            'success'
                        )
                        this.$Progress.finish();
                        Fire.$emit('AfterCreate'); //Fire an reload event

                    }).catch(()=>{
                    this.$Progress.fail();
                });
            },
            /*==== End of edit Testimonial function ====*/

            /*==== Call Delete Modal uith TEstimonial id ====*/
            deleteTestimonial(id){
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
                        this.form.delete('api/testimonial/' + id).then(() => {
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

            loadTestimonial(){
                this.$Progress.start();
                if (this.$gate.isAuthorized()){
                    axios.get("api/testimonial").then(({ data }) => (this.testimonials = data, this.totaltestimonial = data.total));
                    axios.get("api/contentList").then(({ data }) => (this.options = data));
                    this.$Progress.finish();
                }
            }
        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('api/findTestimonial?q='+ query)
                    .then(({ data })=>{
                        this.testimonials = data
                    }).catch(()=>{

                })
            })
            this.loadTestimonial(); //load the user in the table
            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadTestimonial();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
