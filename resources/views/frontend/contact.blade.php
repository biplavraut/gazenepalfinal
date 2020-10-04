@include('common.header')
<section id="page-title">

			<div class="container clearfix">
				<h1>Contact</h1>
				<span>Get in Touch with Us</span>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Contact</li>
				</ol>
			</div>

		</section><!-- #page-title end -->

		<!-- Content
				============================================= -->
		<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<!-- Postcontent
							============================================= -->
					<div class="postcontent nobottommargin">

						<h3>Send us an Email</h3>

						<div class="form-widget">

							<div class="form-result"></div>

							<form class="nobottommargin" id="template-contactform" name="template-contactform"
								action="include/form.php" method="post">

								<div class="form-process"></div>

								<div class="col_one_third">
									<label for="template-contactform-name">Name <small>*</small></label>
									<input type="text" id="template-contactform-name" name="template-contactform-name"
										value="" class="sm-form-control required" />
								</div>

								<div class="col_one_third">
									<label for="template-contactform-email">Email <small>*</small></label>
									<input type="email" id="template-contactform-email"
										name="template-contactform-email" value=""
										class="required email sm-form-control" />
								</div>

								<div class="col_one_third col_last">
									<label for="template-contactform-phone">Phone</label>
									<input type="text" id="template-contactform-phone" name="template-contactform-phone"
										value="" class="sm-form-control" />
								</div>

								<div class="clear"></div>

								<div class="col_one_third">
									<label class="control-label">Departure Date *</label>
									<input type="date" name="departure" class="form-control" required="required"
										data-error="Date is required!">
								</div>
								<div class="col_one_third">
									<label class="control-label">Trip Duration *</label>
									<input type="number" name="duration" min="1" class="form-control"
										required="required" data-error="Duration is required!">
								</div>
								<div class="col_one_third col_last">
									<label class="control-label">No. of Children *</label>
									<input type="number" name="children_guest" min="0" class="form-control"
										required="required" data-error="Person is required!">
								</div>
								<div class="clear"></div>

								<div class="col_one_third">
									<label class="control-label">Your Country *</label>
									<input type="text" name="country" class="form-control" required="required"
										data-error="Country is required!">
								</div>

								<div class="col_one_third">
									<label class="control-label">Address *</label>
									<input type="text" name="address" class="form-control" required="required"
										data-error="Address is required!">
								</div>


								<div class="col_one_third col_last">
									<label for="template-contactform-service">Services</label>
									<select id="template-contactform-service" name="template-contactform-service"
										class="sm-form-control">
										<option value="">-- Select One --</option>
										<option value="Wordpress">Wordpress</option>
										<option value="PHP / MySQL">PHP / MySQL</option>
										<option value="HTML5 / CSS3">HTML5 / CSS3</option>
										<option value="Graphic Design">Graphic Design</option>
									</select>
								</div>

								<div class="clear"></div>

								<div class="col_full">
									<label for="template-contactform-message">Message <small>*</small></label>
									<textarea class="required sm-form-control" id="template-contactform-message"
										name="template-contactform-message" rows="6" cols="30"></textarea>
								</div>

								<div class="col_full hidden">
									<input type="text" id="template-contactform-botcheck"
										name="template-contactform-botcheck" value="" class="sm-form-control" />
								</div>

								<div class="col_full">
									<button class="button button-3d nomargin" type="submit"
										id="template-contactform-submit" name="template-contactform-submit"
										value="submit">Send Message</button>
								</div>

								<input type="hidden" name="prefix" value="template-contactform-">

							</form>
						</div>

					</div><!-- .postcontent end -->

					<!-- Sidebar
							============================================= -->
					<div class="sidebar col_last nobottommargin">

						<address>
							<strong>Headquarters:</strong><br>
							795 Folsom Ave, Suite 600<br>
							San Francisco, CA 94107<br>
						</address>
						<abbr title="Phone Number"><strong>Phone:</strong></abbr> (91) 8547 632521<br>
						<abbr title="Fax"><strong>Fax:</strong></abbr> (91) 11 4752 1433<br>
						<abbr title="Email Address"><strong>Email:</strong></abbr> info@canvas.com

						<div class="widget noborder notoppadding">

							<div class="fslider customjs testimonial twitter-scroll twitter-feed" data-username="envato"
								data-count="3" data-animation="slide" data-arrows="false">
								<i class="i-plain i-small color icon-twitter nobottommargin"
									style="margin-right: 15px;"></i>
								<div class="flexslider" style="width: auto;">
									<div class="slider-wrap">
										<div class="slide"></div>
									</div>
								</div>
							</div>

						</div>

						<div class="widget noborder notoppadding">

							<a href="#" class="social-icon si-small si-dark si-facebook">
								<i class="icon-facebook"></i>
								<i class="icon-facebook"></i>
							</a>

							<a href="#" class="social-icon si-small si-dark si-twitter">
								<i class="icon-twitter"></i>
								<i class="icon-twitter"></i>
							</a>

							<a href="#" class="social-icon si-small si-dark si-dribbble">
								<i class="icon-dribbble"></i>
								<i class="icon-dribbble"></i>
							</a>

							<a href="#" class="social-icon si-small si-dark si-forrst">
								<i class="icon-forrst"></i>
								<i class="icon-forrst"></i>
							</a>

							<a href="#" class="social-icon si-small si-dark si-pinterest">
								<i class="icon-pinterest"></i>
								<i class="icon-pinterest"></i>
							</a>

							<a href="#" class="social-icon si-small si-dark si-gplus">
								<i class="icon-gplus"></i>
								<i class="icon-gplus"></i>
							</a>

						</div>

					</div><!-- .sidebar end -->

				</div>

			</div>

		</section><!-- #content end -->
		<!-- Google Map
			============================================= -->
		<div class="map-col-main wow fadeInRight" style="visibility: visible; animation-name: fadeInRight;">
			<!-- google map  -->
			<div class="map-holder">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3531.9632615146384!2d85.3481267140953!3d27.718420575416047!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1skl+tower!5e0!3m2!1sen!2snp!4v1549186430624"
					width="100%" height="550" frameborder="0" style="border:0" allowfullscreen=""></iframe>
			</div>
		</div>

@include('common.footer')
