<template>
    <div class="container">
        <div class="row mt-5" v-if="$gate.isAuthorized()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">SEO Meta Management</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-3">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <div class="input-group mt-2 mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Site Title</div>
                                    </div>
                                    <input v-model="form.title" type="text" name="title"
                                           placeholder="Site Title."
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                    <has-error :form="form" field="title"></has-error>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Keywords</div>
                                    </div>
                                    <input v-model="form.keyword"id="keyword" type="text" name="keyword" placeholder="keyword" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Subject</div>
                                    </div>
                                    <input v-model="form.subject" id="subject" type="text" name="subject" placeholder="subject" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Topic</div>
                                    </div>
                                    <input v-model="form.topic" id="topic" type="text" name="topic" placeholder="topic" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Summary</div>
                                    </div>
                                    <input v-model="form.summary" id="summary" type="text" name="summary" placeholder="summary" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Classification</div>
                                    </div>
                                    <input v-model="form.classification" id="classification" type="text" name="classification" placeholder="classification" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Category</div>
                                    </div>
                                    <input v-model="form.category" id="category" type="text" name="category" placeholder="category" class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Description</div>
                                </div>
                                <vue-editor v-model="form.excerpt" placeholder="Site Description"></vue-editor>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <button type="button" class="btn btn-danger floar-right"><i class="fas fa-times fa-fw"></i>Cancel</button>
                                    <button @click.prevent="updateSeo" type="submit" class="btn btn-success float-right">Update</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div v-if="!$gate.isAuthorized()">
            <not-found></not-found>
        </div>
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
                seo : {},
                form: new Form({
                    id:'',
                    title :'',
                    keyword:'',
                    subject:'',
                    topic:'',
                    summary:'',
                    classification:'',
                    category: '',
                    excerpt:''
                })
            }
        },
        methods : {
            updateSeo(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('api/seo/'+this.form.id)
                    .then(() =>{
                        swal.fire(
                            'Updated!',
                            'Seo has been updated.',
                            'success'
                        )
                        this.$Progress.finish();
                        Fire.$emit('AfterCreate'); //Fire an reload event

                    }).catch(()=>{
                    this.$Progress.fail();
                });
            },
            loadSeo(){
                if (this.$gate.isAuthorized()){
                    axios.get("api/updateseoprofile/").then(({data}) => (this.form.fill(data))).catch();
                }
            }
        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('api/findSeo?q='+ query)
                    .then(({ data })=>{
                        this.seo = data
                    }).catch(()=>{
                })
            })
            this.loadSeo(); //load the user in the table
            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadSeo();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
