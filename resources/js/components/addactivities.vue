<template>
    <div class="container">
        <form @submit.prevent="updateContent()">
            <div class="row mt-5" v-if="$gate.isAuthorized()">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Activity General Information</h3>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Title</div>
                                    </div>
                                    <input v-model="cform.title" type="text" name="title"
                                           placeholder="Package Title."
                                           class="form-control">
                                </div>
                            </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Location</div>
                                    </div>
                                    <input v-model="cform.location" type="text" name="location"
                                           placeholder="Loaction"
                                           class="form-control">
                                </div>
                            </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input v-model="cform.display" type="checkbox" name="display">
                                                </div>
                                            </div>
                                            <input type="text" value="Display" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input v-model="cform.featured" type="checkbox" name="featured">
                                                </div>
                                            </div>
                                            <input type="text" value="Featured" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input v-model="cform.top_trending" type="checkbox" name="top_trending">
                                                </div>
                                            </div>
                                            <input type="text" value="Top Trending" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">
                                                    <input v-model="cform.trip_of_month" type="checkbox" name="trip_of_month">
                                                </div>
                                            </div>
                                            <input type="text" value="Trip of Month" class="form-control" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Max. Altitude</div>
                                            </div>
                                            <input v-model="cform.altitude" type="text" name="altitude"
                                                   placeholder="8848 Meter"
                                                   class="form-control">
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <div class="input-group mb-2 mr-sm-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">Duration</div>
                                            </div>
                                            <input v-model="cform.duration" type="text" name="duration"
                                                   placeholder="30 Days"
                                                   class="form-control">
                                        </div>
                                    </div>
                                </div>

                                
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Rating</div>
                                    </div>
                                    <input v-model="cform.rating" type="text" name="rating"
                                           placeholder="Rating"
                                           class="form-control">
                                </div>
                            </div>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <div class="card card-dark">
                        <div class="card-header">
                            <h3 class="card-title">Add Display Images </h3>
                            <div class="card-tools">
                                <div class="card-tools">
                                    <a v-on:click="newDisplayImage" class="btn btn-primary"><i class="fas fa-images fa-fw"></i> Add Display Images</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 mt-4"  v-for="(img, index) in images" :key="index" v-if="getDisplayImages(img)">
                                        <img class="img-lg elevation-3" :src="getImages(img)"/>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->
                    <div class="card card-dark">
                        <div class="card-header">
                            <h3 class="card-title">Add Cover Images </h3>
                            <div class="card-tools">
                                <div class="card-tools">
                                    <a v-on:click="newCoverImage" class="btn btn-primary"><i class="fas fa-images fa-fw"></i> Add Cover Images</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 mt-4"  v-for="(img, index) in images" :key="index" v-if="getCoverImages(img)">
                                        <img class="img-lg elevation-3" :src="getImages(img)"/>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                    <div class="card card-dark">
                        <div class="card-header">
                            <h3 class="card-title">Images </h3>
                            <div class="card-tools">
                                <div class="card-tools">
                                    <a v-on:click="newImage" class="btn btn-primary"><i class="fas fa-images fa-fw"></i> Add Images</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-3 mt-4"  v-for="(img, index) in images" :key="index" v-if="getImages(img)">
                                        <img class="img-lg elevation-3" :src="getImages(img)"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Additional Information</h3>
                            <div class="card-tools">
                                <a v-on:click="newDetail" class="btn btn-primary"><i class="fas fa-plus fa-fw"></i> Add Details</a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6" v-for="(detail, index)  in details" :key="detail.id">
                                    <div class="card collapsed-card elevation-3">
                                        <div class="card-header">
                                            <h3 class="card-title"><small>{{detail.title }}</small></h3>

                                            <div class="card-tools">
                                                <button type="button" class="btn btn-tool" data-widget="collapse">
                                                    <i class="fas fa-chevron-down"></i>
                                                </button>
                                                <button type="button" @click="editDetail(detail)" class="btn btn-tool">
                                                    <i class="fas fa-edit green"></i>
                                                </button>
                                                <button type="button" @click="deleteDetail(detail.id)" class="btn btn-tool">
                                                    <i class="fas fa-trash red"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!-- /.card-header -->
                                        <div class="card-body p-0">
                                            <div class="p-3">
                                                <p>{{detail.excerpt }}</p>
                                            </div>
                                            <!-- /.table-responsive -->
                                        </div>
                                        <!-- /.card-body -->
                                        <div class="card-footer clearfix">
                                            <a href="javascript:void(0)" data-widget="collapse" class="btn btn-sm btn-secondary float-right">Cose</a>
                                        </div>
                                        <!-- /.card-footer -->
                                    </div>
                                    <!-- /.card -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card card-dark">
                        <div class="card-header">
                            <h3 class="card-title">SEO Meta </h3>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Meta Title</div>
                                    </div>
                                    <input v-model="cform.meta_title" type="text" name="meta_title"
                                           placeholder="Meta Title"
                                           class="form-control">
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Meta Keywords</div>
                                    </div>
                                    <input v-model="cform.meta_keywords" type="text" name="meta_keywords"
                                           placeholder="Keywords: Nepal, visitnepal..,"
                                           class="form-control">
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Meta Tags</div>
                                    </div>
                                    <input v-model="cform.meta_tags" type="text" name="meta_tags"
                                           placeholder="Tags: Nepal, visitnepal..,"
                                           class="form-control">
                                </div>

                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Meta Categories</div>
                                    </div>
                                    <input v-model="cform.meta_categories" type="text" name="meta_categories"
                                           placeholder="Categories: Travel website, News..,"
                                           class="form-control">
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.col (left) -->
                <div class="col-md-4">
                    <div class="card card-primary card-outline">
                        <div class="card-header">
                            <h3 class="card-title">Fixed Departure</h3>
                        </div>
                        <div class="card-body">
                            <!-- Date range -->
                            <div class="form-group">
                                <label>Departure Date:</label>

                                <div class="input-group">
                                    <div class="input-group-prepend">
                                      <span class="input-group-text">
                                        <i class="fa fa-calendar"></i>
                                      </span>
                                    </div>
                                    <input v-model="cform.departure_date" type="date" class="form-control float-right">
                                </div>
                                <!-- /.input group -->
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Price</div>
                                    </div>
                                    <input v-model="cform.price" type="text" name="price"
                                           placeholder="Package Price."
                                           class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">% Discount</div>
                                    </div>
                                    <input v-model="cform.discount" type="number" name="discount"
                                           placeholder="Trip Discount"
                                           class="form-control">
                                </div>
                            </div>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                    <div class="card card-success">
                        <div class="card-header">
                            <h3 class="card-title">Menu &amp; Categories</h3>
                        </div>
                        <div class="card-body">
                            <multiselect v-model="cform.menu_categories"
                                         tag-placeholder="Add Menu as new Category"
                                         placeholder="Select Trip Categories"
                                         label="title"
                                         track-by="id"
                                         :options="options"
                                         :multiple="true"
                                         :menu_value="options.id"
                                         :taggable="true"></multiselect>

                            <!--<div class="form-group">
                                <span>Destinations</span>
                                <hr>
                                <label>
                                    <input type="checkbox" class="minimal" checked> Nepal
                                </label>
                                <br>
                                <label>
                                    <input type="checkbox" class="minimal" checked> India
                                </label>
                                <br>
                                <label>
                                    <input type="checkbox" class="minimal" checked> Bhutan
                                </label>
                                <br>
                                <span>Activities</span>
                                <hr>
                                <label>
                                    <input type="checkbox" class="minimal" checked> Trekking
                                </label>
                                <br>
                                <label>
                                    <input type="checkbox" class="minimal" checked> Rafting
                                </label>
                                <br>
                                <label>
                                    <input type="checkbox" class="minimal" checked> Safari
                                </label>
                            </div>-->


                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Difficulty Level</h3>
                        </div>
                        <div class="card-body">
                            <multiselect v-model="cform.difficulty"
                                         tag-placeholder="Difficulty Level"
                                         placeholder="Select level of difficulty"
                                         label="title"
                                         track-by="id"
                                         :options="difficulty"
                                         :multiple="false"
                                         :taggable="true">
                            </multiselect>

                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Best Seasons</h3>
                        </div>
                        <div class="card-body">

                            <!--<div class="form-group row">
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> January
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> February
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> March
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> April
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> May
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> June
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> July
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> August
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal"> September
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal"> October
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal"> November
                                </label>
                                <label class="col-md-6">
                                    <input type="checkbox" class="minimal" checked> December
                                </label>
                            </div>-->
                            <multiselect v-model="cform.best_season"
                                         tag-placeholder="Add Season"
                                         placeholder="Select Best Season"
                                         label="title"
                                         track-by="id"
                                         :options="seasons"
                                         :multiple="true"
                                         :taggable="true"></multiselect>


                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Travel Medium</h3>
                        </div>
                        <div class="card-body">

                            <multiselect v-model="cform.types"
                                         tag-placeholder="Tour Medium"
                                         placeholder="Select Available Tour Medium"
                                         label="title"
                                         track-by="id"
                                         :options="types"
                                         :multiple="true"
                                         :taggable="true"></multiselect>


                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Group Size</h3>
                        </div>
                        <div class="card-body">

                            <multiselect v-model="cform.group_size"
                                         tag-placeholder="Group Size"
                                         placeholder="Select Group Size"
                                         label="title"
                                         track-by="id"
                                         :options="groups"
                                         :multiple="true"
                                         :taggable="true"></multiselect>


                        </div>
                    </div>
                    <button type="submit" class="btn btn-success"><i class="fas fa-plus fa-fw"></i>Update</button>
                </div>
            </div>
        </form>

        <!-- Modal -->
        <div class="modal fade" id="addNewDetail" tabindex="-1" role="dialog" aria-labelledby="addNewDetailLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editmode" id="addNewDetailLabel">Add New Detail</h5>
                        <h5 class="modal-title" v-show="editmode" id="addNewDetailLabel">Update Detail</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="editmode ? updateDetail() : createDetail()">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group mb-2 mr-sm-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Title</div>
                                    </div>
                                    <input v-model="form.title" type="text" name="title"
                                           placeholder="Detail Title."
                                           class="form-control" :class="{ 'is-invalid': form.errors.has('title') }">
                                    <has-error :form="form" field="title"></has-error>
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
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Description</div>
                                </div>
                                <vue-editor v-model="form.excerpt" placeholder="Detail Description"></vue-editor>
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
        <!-- Modal Image -->
        <div class="modal fade" id="addNewImage" tabindex="-1" role="dialog" aria-labelledby="addNewImageLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addNewImageLabel">Add New Image</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="addImage()">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Image</div>
                                    </div>
                                    <input type="file" name="image"  @change="uploadImage"
                                           placeholder="Image"
                                           class="btn btn-sm btn-info" :class="{ 'is-invalid': form.errors.has('image') }">
                                    <has-error :form="form" field="image"></has-error>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success"><i class="fas fa-plus fa-fw"></i>Update</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary"><i class="fas fa-plus fa-fw"></i>Upload</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of modal image-->
        <div class="modal fade" id="addNewCoverImage" tabindex="-1" role="dialog" aria-labelledby="addNewCoverImageLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addNewCoverImageLabel">Add New Image</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="addCoverImage()">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Add Cover Image</div>
                                    </div>
                                    <input type="file" name="coverimage"  @change="uploadCoverImage"
                                           placeholder="CoverImage"
                                           class="btn btn-sm btn-info" :class="{ 'is-invalid': cform.errors.has('coverimage') }">
                                    <has-error :form="cform" field="coverimage"></has-error>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success"><i class="fas fa-plus fa-fw"></i>Update</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary"><i class="fas fa-plus fa-fw"></i>Upload</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Modal Image -->
        <div class="modal fade" id="addNewDisplayImage" tabindex="-1" role="dialog" aria-labelledby="addNewDisplayImageLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addNewDisplayImageLabel">Add Display Image</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form  @submit.prevent="addDisplayImage()">
                        <div class="modal-body">
                            <div class="form-group">
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text">Add Display Image</div>
                                    </div>
                                    <input type="file" name="displayimages"  @change="uploadDisplayImage"
                                           placeholder="Display Image"
                                           class="btn btn-sm btn-info" :class="{ 'is-invalid': cform.errors.has('displayimages') }">
                                    <has-error :form="cform" field="displayimages"></has-error>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times fa-fw"></i>Close</button>
                            <button v-show="editmode" type="submit" class="btn btn-success"><i class="fas fa-plus fa-fw"></i>Update</button>
                            <button v-show="!editmode" type="submit" class="btn btn-primary"><i class="fas fa-plus fa-fw"></i>Upload</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--End of modal image-->
    </div>
</template>


<script>
    import Multiselect from 'vue-multiselect'
    import { VueEditor } from 'vue2-editor'
    export default {
        watch:{
            '$route' (to, from) {
                // react to route changes...
            }
        },
        components: {
            Multiselect,
            VueEditor
        },
        data () {
            return {
                editmode: false,
                options: [
                ],
                seasons: [
                    { "id": 13, "title": "Any"},
                    {"id": 1, "title": "January"},
                    {"id": 2, "title": "February"},
                    {"id": 3, "title": "March"},
                    {"id": 4, "title": "April"},
                    {"id": 5, "title": "May"},
                    { "id": 6, "title": "june"},
                    {"id": 7, "title": "July"},
                    {"id": 8, "title": "August"},
                    {"id": 9, "title": "September"},
                    {"id": 10, "title": "October"},
                    {"id": 11, "title": "November"},
                    { "id": 12, "title": "December"}
                ],
                types: [
                    {"id": 1, "title": "Trekking"},
                    {"id": 2, "title": "Private Jeep-Car"},
                    {"id": 3, "title": "Tourist Bus"},
                    {"id": 4, "title": "Helicopter"},
                    {"id": 5, "title": "Flights"}
                ],
                difficulty: [
                    {"id": 1, "title": "Easy"},
                    {"id": 2, "title": "Moderate"},
                    {"id": 3, "title": "Quite Tough"},
                    {"id": 4, "title": "Extremely Tough"}
                ],
                groups:[
                    {"id": 1, "title": "Small Group"},
                    {"id": 2, "title": "Family"},
                    {"id": 3, "title": "Adult Group"},
                    {"id": 4, "title": "Large Group"},
                    {"id": 5, "title": "Any"}
                ],
                contentid: this.$route.params.slug,
                editmode: false,
                totaldetail : 0,
                details : [],
                images : [],
                form: new Form({
                    id:'',
                    title :'',
                    slug :'',
                    content_slug : this.$route.params.slug,
                    display:'',
                    image:'',
                    excerpt:''
                }),
                cform: new Form({
                    id:'',
                    title :'',
                    slug :'',
                    content_slug: '',
                    image:'',
                    location:'',
                    display_image: '',
                    cover_image:'',
                    display:'',
                    featured:'',
                    top_trending:'',
                    trip_of_month:'',
                    departure_date:'',
                    price:'',
                    discount:'',
                    menu_categories:'',
                    duration:'',
                    difficulty:'',
                    best_season:'',
                    altitude:'',
                    rating: '',
                    types:'',
                    group_size:'',
                    meta_title:'',
                    meta_keywords:'',
                    meta_tags:'',
                    meta_categories:'',
                    order_item:'',
                    excerpt:''
                })
            }
        },

        methods : {

            /*===== Call add new Menu modal ====*/
            newDetail(){
                this.editmode = false;
                this.form.reset();
                $('#addNewDetail').modal('show');
            },
            /*Create User Function Starts*/
            createDetail(){
                this.$Progress.start(); //start a progress bar
                this.form.post('../api/activitydetail') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data

                        $("#addNewDetail").modal('hide'); //Hide the model

                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Detail Added Successfully'
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
            /*==== Call edit Modal with user data ====*/
            editDetail(details){
                this.editmode = true;
                this.form.reset();
                $('#addNewDetail').modal('show');
                this.form.fill(details);
            },
            /*Edit User Function*/
            updateDetail(id){
                this.$Progress.start();
                //console.log('editing data');
                this.form.put('../api/activitydetail/'+this.form.id)
                    .then(() =>{
                        $("#addNewDetail").modal('hide'); //Hide the model
                        swal.fire(
                            'Updated!',
                            'Detail info. has been updated.',
                            'success'
                        )
                        this.$Progress.finish();
                        Fire.$emit('AfterCreate'); //Fire an reload event

                    }).catch(()=>{
                    this.$Progress.fail();
                });
            },
            /*==== End of edit user function ====*/
            updateContent(id){
                //alert("I m here");
                this.$Progress.start();
                //console.log('editing data');
                this.cform.put('../api/activities/'+this.cform.id)
                    .then(() =>{
                        $("#addNewContent").modal('hide'); //Hide the model
                        swal.fire(
                            'Updated!',
                            'Content info. has been updated.',
                            'success'
                        )
                        this.$Progress.finish();
                        Fire.$emit('AfterCreate'); //Fire an reload event

                    }).catch(()=>{
                    this.$Progress.fail();
                });
            },

            /*==== Call Delete Modal uith user id ====*/
            deleteDetail(id){
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
                        this.form.delete('../api/activitydetail/' + id).then(() => {
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
            /*Image Display and Upload*/
            getImages(img){
                let slug = this.contentid;
                let test = img;
                let photo = "/img/activities/" + slug + "/" +img;
                return photo;
            },
            getCoverImages(img){
                let slug = this.contentid;
                let test = img;
                if(test.substring(0,5) == 'cover'){
                let photo = "/img/activities/" + slug + "/" +img;
                return photo;
                }
                else{
                    "cover Image Not Found"
                }
            },
            getDisplayImages(img){
                let slug = this.contentid;
                let test = img;
                if(test.substring(0,7) == 'display'){
                let photo = "/img/activities/" + slug + "/" +img;
                return photo;
                }
                else{
                    "cover Image Not Found"
                }
            },
            newCoverImage(){
                //$('#imageForm').val('');
                $('#addNewCoverImage').modal('show');
            },
            newDisplayImage(){
                //$('#imageForm').val('');
                $('#addNewDisplayImage').modal('show');
            },
            newImage(){
                this.form.reset();
                //$('#imageForm').val('');
                $('#addNewImage').modal('show');
            },
            uploadImage(e) {
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
                } else {
                    swal.fire(
                        'Opps..!',
                        'Image file exceeds 2MB size limit.',
                        'warning'
                    )
                }
            },
            uploadCoverImage(e) {
                //console.log('Uploading');
                let file = e.target.files[0];
                //console.log(file);
                let reader = new FileReader();
                if (file['size'] < 2111775) {
                    reader.onloadend = (file) => {
                        //console.log('RESULT', reader.result)
                        this.cform.coverimage = reader.result;
                    }
                    reader.readAsDataURL(file);
                } else {
                    swal.fire(
                        'Opps..!',
                        'Image file exceeds 2MB size limit.',
                        'warning'
                    )
                }
            },
            uploadDisplayImage(e) {
                //console.log('Uploading');
                let file = e.target.files[0];
                //console.log(file);
                let reader = new FileReader();
                if (file['size'] < 2111775) {
                    reader.onloadend = (file) => {
                        //console.log('RESULT', reader.result)
                        this.cform.displayimages = reader.result;
                    }
                    reader.readAsDataURL(file);
                } else {
                    swal.fire(
                        'Opps..!',
                        'Image file exceeds 2MB size limit.',
                        'warning'
                    )
                }
            },
            addImage(){
                //console.log(newcontent);

                this.form.post('../api/activitydetail') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data
                        $("#addNewImage").modal('hide'); //Hide the model
                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Image Uploaded Successfully'
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
            addCoverImage(){
                //console.log(newcontent);
                this.cform.post('../api/activityCoverImage') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data
                        $("#addNewCoverImage").modal('hide'); //Hide the model
                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Image Uploaded Successfully'
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
            /*End of Inage Display and Upload*/
            addDisplayImage(){
                //console.log(newcontent);
                this.cform.post('../api/activityDisplayImage') // POST form data
                //Start Condition to check form is validate
                    .then(()=>{
                        Fire.$emit('AfterCreate'); //custom event to reload data
                        $("#addNewDisplayImage").modal('hide'); //Hide the model
                        //Sweetalert notification for the result
                        Toast.fire({
                            type: 'success',
                            title: 'Image Uploaded Successfully'
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
            /*End of Inage Display and Upload*/


            loadDetail(){
                this.$Progress.start();
                if (this.$gate.isAuthorized()){
                    axios.get("../api/activities?slug="+this.contentid).then(({ data }) => (
                        this.cform.fill(data),
                        this.cform.content_slug = data.slug,
                        this.cform.menu_categories = JSON.parse(data.menu_categories),
                        this.cform.difficulty = JSON.parse(data.difficulty),
                        this.cform.best_season = JSON.parse(data.best_season),
                        this.cform.types = JSON.parse(data.types),
                        this.cform.group_size = JSON.parse(data.group_size)
                    ));
                    axios.get('../api/activitydetail?slug='+this.contentid).then(({ data }) => (
                        this.details = data.detail_data,
                        this.images = data.all_images,
                        this.totaldetail = data.total));
                    axios.get("../api/menuCatList").then(({ data }) => (this.options = data));
                    this.$Progress.finish();
                }
            }
        },
        created() {
            Fire.$on('searching',()=>{
                let query =this.$parent.search; //take information from root
                axios.get('../api/findactivityDetail?q='+ query)
                    .then((data)=>{
                        this.details = data.data
                    }).catch(()=>{

                })
            })

            this.loadDetail(); //load the user in the table
            //Load the userlist if add or created a new user
            Fire.$on("AfterCreate",()=>{
                this.loadDetail();
            })


            //setInterval(() => this.loadUsers(),3000);
        }
    }
</script>
