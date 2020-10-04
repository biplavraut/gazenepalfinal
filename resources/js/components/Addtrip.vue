<template>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8">

                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Trip General Information</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <div class="input-group mb-2 mr-sm-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Title</div>
                                </div>
                                <input type="text" name="title"
                                       placeholder="Package Title."
                                       class="form-control">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="input-group mb-2 mr-sm-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <input type="checkbox" name="display">
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
                                                <input type="checkbox" name="featured">
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
                                                <input type="checkbox" name="top_trending">
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
                                                <input type="checkbox" name="trip_of_month">
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
                                        <input type="text" name="altitude"
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
                                        <input type="text" name="duration"
                                               placeholder="30 Days"
                                               class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->

                <div class="card card-info">
                    <div class="card-header">
                        <h3 class="card-title">Images </h3>
                        <div class="card-tools">
                            <input type="file" name="image"
                                   placeholder="Image"
                                   class="btn btn-sm btn-info">
                        </div>
                    </div>
                    <div class="card-body">
                        <img src="https://via.placeholder.com/50" alt="">
                        <img src="https://via.placeholder.com/50" alt="">
                        <img src="https://via.placeholder.com/50" alt="">
                    </div>
                </div>

                <div class="card card-dark">
                    <div class="card-header">
                        <h3 class="card-title">Additional Information</h3>
                    </div>
                    <div class="card-body">
                    </div>
                </div>


            </div>
            <!-- /.col (left) -->
            <div class="col-md-4">
                <div class="card card-primary">
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
                                <input type="date" class="form-control float-right">
                            </div>
                            <!-- /.input group -->
                        </div>
                        <div class="form-group">
                            <div class="input-group mb-2 mr-sm-2">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">Price</div>
                                </div>
                                <input type="text" name="price"
                                       placeholder="Package Price."
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

                        <div class="form-group">
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
                        </div>


                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Best Seasons</h3>
                    </div>
                    <div class="card-body">

                        <div class="form-group row">
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
                        </div>


                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Travel Medium</h3>
                    </div>
                    <div class="card-body">

                        <div class="form-group row">
                            <label class="col-md-6">
                                <input type="checkbox" class="minimal" checked> Trekking
                            </label>
                            <label class="col-md-6">
                                <input type="checkbox" class="minimal"> Public Transport
                            </label>
                            <label class="col-md-6">
                                <input type="checkbox" class="minimal"> Flight
                            </label>
                            <label class="col-md-6">
                                <input type="checkbox" class="minimal" checked> Personal Car / Jeep
                            </label>
                        </div>


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
        }
    }
</script>
