<template>
    <div class="container">
        <div class="row mt-5" v-if="$gate.isAuthorized()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Blogs Management</h3>

                        <div class="card-tools">
                            <button type="" @click="newBlog" class="btn btn-primary"><i class="fas fa-blog fa-fw"></i> Add New Blog</button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <vue-nestable v-model="blogs" :max-depth="1" v-on:change="listChange(blogs)">
                                <template slot-scope="{ item }">
                                    <!-- Handler -->
                                    <vue-nestable-handle :item="item">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <i class="fas fa-bars"> </i> <span>{{ item.title }} / {{ item.slug }} </span>
                                            </div>
                                            <div class="col-md-4 item_actions">
                                                <a href="#" @click="editContent(item)" class="btn btn-sm btn-success">Edit
                                                    <i class="fa fa-edit"></i>
                                                </a>
                                                <a href="#" @click="deleteBlog(item.id)" class="btn btn-sm btn-danger">Delete
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </vue-nestable-handle>
                                    <!-- Blog -->
                                </template>
                            </vue-nestable>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div v-if="!$gate.isAuthorized()">
            <not-found></not-found>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addNewBlog" tabindex="-1" role="dialog" aria-labelledby="addNewBlogLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode" id="addNewBlogLabel">Add New Blog</h5>
                        <h5 class="modal-title" v-show="editmode" id="addNewBlogLabel">Update Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="editmode ? updateBlog() : createBlog()">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Blog Title</div>
                                            </div>
                                            <input v-model="form.title" type="text" name="title"
                                                   placeholder="Rivers of Nepal."
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                            <has-error :form="form" field="title"></has-error>
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
                                                <div class="input-group-text">Blog Author</div>
                                            </div>
                                            <input v-model="form.author" type="text" name="author"
                                                   placeholder="Blog Author."
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('author') }">
                                            <has-error :form="form" field="author"></has-error>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Blog Date</div>
                                            </div>
                                            <input v-model="form.date" type="date" name="date"
                                                   placeholder="Blog Date."
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('date') }">
                                            <has-error :form="form" field="date"></has-error>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Meta Keywords</div>
                                            </div>
                                            <input v-model="form.meta_keywords" type="text" name="meta_keywords"
                                                   placeholder="Keywords: Nepal, visitnepal..,"
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('meta_keywords') }">
                                            <has-error :form="form" field="meta_keywords"></has-error>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Meta Tags</div>
                                            </div>
                                            <input v-model="form.meta_tags" type="text" name="meta_tags"
                                                   placeholder="Tags: Nepal, visitnepal..,"
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('meta_tags') }">
                                            <has-error :form="form" field="meta_tags"></has-error>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Meta Categories</div>
                                            </div>
                                            <input v-model="form.meta_categories" type="text" name="meta_categories"
                                                   placeholder="Categories: Travel website, News..,"
                                                   class="form-control" :class="{ 'is-invalid': form.errors.has('meta_categories') }">
                                            <has-error :form="form" field="meta_categories"></has-error>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Blog Description</div>
                                    </div>
                                    <vue-editor v-model="form.excerpt" placeholder="Blog Discription"></vue-editor>
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
    import { VueEditor } from 'vue2-editor'
    export default {
        components: {
            VueEditor
        },
        data () {
            return {
                editmode: false,
                totalblog : 0,
                blogs : [],
                form: new Form({
                    id:'',
                    title :'',
                    slug :'',
                    image:'',
                    display:'',
                    author:'',
                    date:'',
                    meta_keywords:'',
                    meta_tags:'',
                    meta_categories:'',
                    order_item:'',
                    excerpt:''
                })
            }
        },


        methods : {
            /*===== Call add new content modal ====*/
            newBlog(){
                this.editmode = false;
                this.form.reset();
                $('#addNewBlog').modal('show');
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
            createBlog(){
                this.$Progress.start(); //start a progress bar
                this.form.post('api/blog') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data

                        $("#addNewBlog").modal('hide'); //Hide the model

                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Blog Created Successfully'
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
            listChange(newblog){
                //console.log(newcontent);

                axios({
                    method: 'post',
                    url: 'api/orderBlog',
                    data: {
                        newblog
                    },
                })
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data
                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Blog Sorted Successfully'
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
            editContent(blogs){
                this.editmode = true;
                this.form.reset();
                $('#addNewBlog').modal('show');
                this.form.fill(blogs);
            },
            /*Edit Blog Function*/
            updateBlog(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('api/blog/'+this.form.id)
                    .then(() =>{
                        $("#addNewBlog").modal('hide'); //Hide the model
                        swal.fire(
                            'Updated!',
                            'Blog info. has been updated.',
                            'success'
                        )
                        this.$Progress.finish();
                        Fire.$emit('AfterCreate'); //Fire an reload event

                    }).catch(()=>{
                    this.$Progress.fail();
                });
            },
            /*==== End of edit Blog function ====*/

            /*==== Call Delete Modal uith Blog id ====*/
            deleteBlog(id){
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
                        this.form.delete('api/blog/' + id).then(() => {
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

            loadBlogs(){
                if (this.$gate.isAuthorized()){
                    axios.get("api/blog").then(({ data }) => (this.blogs = data, this.totalblog = data.total));
                }
            }
        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('api/findBlog?q='+ query)
                    .then((data)=>{
                        this.blogs = data.data
                    }).catch(()=>{

                })
            })

            this.loadBlogs(); //load the user in the table

            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadBlogs();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
