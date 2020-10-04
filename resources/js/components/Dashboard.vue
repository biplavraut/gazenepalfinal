<template>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-6">
                <div class="card collapsed-card">
                    <div class="card-header bg-info">
                        <h3 class="card-title">
                            <i class="ion ion-clipboard mr-1"></i>
                            Top Trending Trips
                        </h3>
                        <div class="card-tools">
                            <button type="button"
                                    class="btn btn-primary btn-sm"
                                    data-widget="collapse"
                                    data-toggle="tooltip"
                                    title="Collapse">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <ul class="todo-list">
                            <vue-nestable v-model="dashcontents" :max-depth="0">
                                <template slot-scope="{ item }">
                                    <!-- Handler -->
                                    <vue-nestable-handle :item="item">
                                        <input type="checkbox" value="" name=""> <span>{{ item.title }}</span>
                                    </vue-nestable-handle>
                                    <!-- Content -->
                                </template>
                            </vue-nestable>
                        </ul>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix">
                        <button type="button" class="btn btn-info float-right"><i class="fa fa-plus"></i> Add item</button>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card collapsed-card">
                    <div class="card-header bg-success">
                        <h3 class="card-title">
                            <i class="ion ion-clipboard mr-1"></i>
                            Trip of the Month
                        </h3>
                        <div class="card-tools">
                            <button type="button"
                                    class="btn btn-success btn-sm"
                                    data-widget="collapse"
                                    data-toggle="tooltip"
                                    title="Collapse">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                        <ul class="todo-list">
                            <vue-nestable v-model="dashcontents" :max-depth="0">
                                <template slot-scope="{ item }">
                                    <!-- Handler -->
                                    <vue-nestable-handle :item="item">
                                        <input type="checkbox" value="1" name="" checked> <span>{{ item.title }}</span>
                                    </vue-nestable-handle>
                                    <!-- Content -->
                                </template>
                            </vue-nestable>
                        </ul>
                    </div>
                    <!-- /.card-body -->
                    <div class="card-footer clearfix">
                        <button type="button" class="btn btn-info float-right"><i class="fa fa-plus"></i> Add item</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        },
        data(){
            return{
                dashcontents : [],
            }
        },
        methods: {
            /*==== Start of Show existing User function ====*/
            loadDashContent(){
                if (this.$gate.isDevOrAdmin()){
                    axios.get("api/content").then(({ data }) => (this.dashcontents = data));
                }
            }
            /*==== End of existing User ====*/
        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('api/findContent?q='+ query)
                    .then((data)=>{
                        this.dashcontents = data.data
                    }).catch(()=>{

                })
            })

            this.loadDashContent(); //load the user in the table

            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadDashContent();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
