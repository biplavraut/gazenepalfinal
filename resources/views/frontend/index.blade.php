@include('common.header')
		<!-- Slider  ============================================ -->
		<section id="slider" class="slider-element revslider-wrap clearfix">
			<div class="rev_slider_wrapper" style="width: 100% margin:0px auto;background:#000;padding:0px;margin-top:0px;margin-bottom:0px;">
				<!-- START REVOLUTION SLIDER 5.4.1 fullwidth mode -->
				<div id="rev_slider_19_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.4.1">
					<ul>	<!-- SLIDE  -->
						<?php 
							$count = 48;
						?>
						@foreach($sliders_list as $sliders)
						<li data-index="rs-{{ $count }}" data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off"  data-easein="default" data-easeout="default" data-masterspeed="300"  data-thumb="img/slider/thumbs/rect_{{ $sliders->image }}"  data-rotate="0"  data-saveperformance="off"  data-title="{{ $sliders->title }}" data-description="">
							<!-- MAIN IMAGE -->
							<img src="{{asset('frontend/include/rs-plugin/demos/assets/images/dummy.png')}}"  alt=""  data-lazyload="img/slider/thumbs/{{ $sliders->image}}" data-bgposition="center center" data-kenburns="on" data-duration="30000" data-ease="Linear.easeNone" data-scalestart="100" data-scaleend="120" data-rotatestart="0" data-rotateend="0" data-blurstart="0" data-blurend="0" data-offsetstart="0 0" data-offsetend="0 0" class="rev-slidebg" data-no-retina>

							<!-- LAYERS -->

							<!-- LAYER NR. 1 -->
							    <div class="tp-caption tp-shape tp-shapewrapper  tp-resizeme  tp-gradientstyle"
								 id="slide-48-layer-2"
								 data-x="['center','center','center','center']" data-hoffset="['0','0','0','0']"
								 data-y="['bottom','bottom','bottom','bottom']" data-voffset="['0','0','0','0']"
											data-width="full"
								data-height="['200','200','200','250']"
								data-whitespace="nowrap"

								data-type="shape"
								data-basealign="slide"
								data-responsive_offset="on"

								data-frames='[{"from":"y:50px;opacity:0;","speed":2000,"to":"o:1;","delay":0,"ease":"Power4.easeOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
								data-textAlign="['left','left','left','left']"
								data-paddingtop="[0,0,0,0]"
								data-paddingright="[0,0,0,0]"
								data-paddingbottom="[0,0,0,0]"
								data-paddingleft="[0,0,0,0]"

								style="z-index: 5;"> </div>

							<!-- LAYER NR. 2 -->
							    <a class="tp-caption   tp-resizeme"
					            href="#" target="_self"			 id="slide-48-layer-1"
								 data-x="['left','left','left','left']" data-hoffset="['40','40','30','20']"
								 data-y="['bottom','bottom','bottom','bottom']" data-voffset="['90','90','79','99']"
											data-fontsize="['40','40','25','20']"
								data-lineheight="['40','40','25','20']"
								data-width="['580','480','340','260']"
								data-height="none"
								data-whitespace="normal"

								data-type="text"
								data-actions=''
								data-basealign="slide"
								data-responsive_offset="on"

								data-frames='[{"from":"y:20px;opacity:0;","speed":2000,"to":"o:1;","delay":200,"ease":"Power4.easeOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
								data-textAlign="['left','left','left','left']"
								data-paddingtop="[0,0,0,0]"
								data-paddingright="[0,0,0,0]"
								data-paddingbottom="[0,0,0,0]"
								data-paddingleft="[0,0,0,0]"

								style="z-index: 6; min-width: 580px; max-width: 580px; white-space: normal; font-size: 40px; line-height: 40px; font-weight: 500; color: rgba(255,255,255,1);font-family:Roboto;text-decoration: none;">{{$sliders->title}}</a>

							<!-- LAYER NR. 3 -->
							    <div class="tp-caption   tp-resizeme"
								 id="slide-48-layer-3"
								 data-x="['left','left','left','left']" data-hoffset="['40','40','30','20']"
								 data-y="['bottom','bottom','bottom','bottom']" data-voffset="['35','35','20','20']"
											data-width="['580','480','340','260']"
								data-height="none"
								data-whitespace="normal"

								data-type="text"
								data-basealign="slide"
								data-responsive_offset="on"

								data-frames='[{"from":"y:20px;opacity:0;","speed":2000,"to":"o:1;","delay":400,"ease":"Power4.easeOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"}]'
								data-textAlign="['left','left','left','left']"
								data-paddingtop="[0,0,0,0]"
								data-paddingright="[0,0,0,0]"
								data-paddingbottom="[0,0,0,0]"
								data-paddingleft="[0,0,0,0]"

								style="z-index: 7; min-width: 580px; max-width: 580px; white-space: normal; font-size: 15px; line-height: 20px; font-weight: 500; color: rgba(255,255,255,0.75);font-family:Roboto;">{{$sliders->sub_title}}
					        </div>

							<!-- LAYER NR. 4 -->
							   <div class="tp-caption   tp-resizeme tp-svg-layer"
								 id="slide-48-layer-4"
								 data-x="['left','left','left','left']" data-hoffset="['721','620','510','367']"
								 data-y="['bottom','bottom','bottom','bottom']" data-voffset="['29','29','9','16']"
											data-width="50"
								data-height="50"
								data-whitespace="nowrap"
								data-visibility="['on','on','off','off']"

								data-type="svg"
								data-actions='[{"event":"click","action":"togglefullscreen","delay":""}]'
								data-svg_src="{{asset('frontend/include/rs-plugin/demos/assets/images/ic_fullscreen_24px.svg')}}"
								data-svg_idle="sc:transparent;sw:0;sda:0;sdo:0;"
								data-svg_hover="sc:transparent;sw:0;sda:0;sdo:0;"
								data-basealign="slide"
								data-responsive_offset="on"

								data-frames='[{"from":"y:20px;opacity:0;","speed":2000,"to":"o:1;","delay":600,"ease":"Power4.easeOut"},{"delay":"wait","speed":300,"to":"opacity:0;","ease":"nothing"},{"frame":"hover","speed":"150","ease":"Power2.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);"}]'
								data-textAlign="['left','left','left','left']"
								data-paddingtop="[0,0,0,0]"
								data-paddingright="[0,0,0,0]"
								data-paddingbottom="[0,0,0,0]"
								data-paddingleft="[0,0,0,0]"

								style="z-index: 8; min-width: 50px; max-width: 50px; max-width: 50px; max-width: 50px; color: rgba(255,255,255,0.50);cursor:pointer;"><div class="rs-untoggled-content"> </div><div class="rs-toggled-content"></div></div>
						</li>
						<?php $count++; ?>
						@endforeach
						<!-- SLIDE  -->
					</ul>
					<div class="tp-bannertimer" style="height: 8px; background: rgba(255,255,255,0.25);"></div>	</div>
					</div><!-- END REVOLUTION SLIDER -->
		</section>

		<!-- Slider End		============================================= -->

		<!-- parallax Promo ============================================= -->
		
		<div class="parallax dark nobottommargin nobottomborder" style="padding:25px 0; background-image: url('{{asset('frontend/img/app-bg.jpg')}}'); background-size: cover;" data-bottom-top="background-position:0px 0px;" data-top-bottom="background-position:0px -300px;">
			<div class="container clearfix">
				<div class="col_one_third bottommargin-sm center">
					<img data-animate="fadeInLeft" src="{{asset('frontend/img/phone.png')}}" alt="Iphone">
				</div>
				<div class="col_two_third bottommargin-sm col_last">
					<div class="heading-block topmargin-sm">
						<h2>DOWNLOAD: An insiders guide APP of Nepal!</h2>
						<span><b>GAZE NEPAL APP Available in App Store &amp; Play Store.</b>  Travel Safe and Smart.</span>
					</div>
					<a href="#"><img src="{{asset('frontend/img/appstore.png')}}" alt="" height="45"></a>
					<a href="#"><img src="{{asset('frontend/img/googleplay.png')}}" alt=""  class="ml-xl-5 ml-lg-1 ml-0 " height="45"></a>
				</div>
			</div>
		</div>
		<!-- parallax Promo End ============================================= -->

		<!-- Section ============================================= -->
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div class="heading-block center nobottomborder">
						<h2>TOP REGIONS THIS SEASON</h2>
						<div class="divider divider-short divider-rounded divider-center"><i class="icon-map-marker"></i></div>
					</div>
				</div>

				<div id="portfolio" class="portfolio grid-container portfolio-nomargin portfolio-full portfolio-overlay-open clearfix">
					@foreach($region_list as $regions)
					<article class="portfolio-item pf-media pf-icons">
						<div class="portfolio-image">
							<a href="./region-detail/{{$regions->slug}}">
								<img src="img/regions/{{$regions->slug}}/thumbs/{{ $regions->display_image}}" alt="Beach Activities">
								<div class="portfolio-overlay">
									<div class="portfolio-desc">
										<h3>{{ $regions->title }}</h3>
									</div>
								</div>
							</a>
						</div>
					</article>
					@endforeach
				</div>
				<a href="#" class="button button-full button-dark center bottommargin-lg">
					<div class="container clearfix">
						Can't find your Favorite Package? <strong>Browse Packages</strong> <i class="icon-caret-right" style="top:4px;"></i>
					</div>
				</a>
				<div class="container clearfix">
					<div class="heading-block center nobottomborder">
						<!-- <span class="before-heading color">What are you in the Mood for.?</span> -->
						<h2>EVENTS, FESTIVAL AND LIFESTYLE</h2>
						<div class="divider divider-short divider-rounded divider-center"><i class="icon-map-marker"></i></div>
					</div>
				</div>

				<!-- Slider =========================================== -->

				<section id="slider" class="slider-element revslider-wrap bottommargin-lg clearfix">
					<div id="rev_slider_30_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="media-carousel-autoplay30" style="margin:0px auto;background-color:#26292b;padding:0px;margin-top:0px;margin-bottom:0px;">
						<!-- START REVOLUTION SLIDER 5.0.7 fullwidth mode -->
							<div id="rev_slider_30_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.0.7">
								<ul>	<!-- SLIDE  -->
								<?php 
							      $count = 117;
						        ?>
								@foreach($blog_list as $blogs)							 
									<li data-index="rs-{{$count}}" data-transition="fade" data-slotamount="7"  data-easein="Power3.easeInOut" data-easeout="Power3.easeInOut" data-masterspeed="1500"  data-thumb="img/blog/thumbs/rect_{{ $blogs->image }}"  data-rotate="0"  data-saveperformance="off"  data-title="{{$blogs->title}}" data-param1="Youtube Video" data-description="">
										<!-- MAIN IMAGE -->
										<img src="img/blog/thumbs/{{ $blogs->image }}"  alt=""  data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
										<!-- LAYERS -->

										<!-- BACKGROUND VIDEO LAYER -->
										<div class="rs-background-video-layer"
											data-forcerewind="on"
											data-volume="100"
											data-ytid="d_8fE-On19I"
											data-videoattributes="version=3&amp;enablejsapi=1&amp;html5=1&amp;volume=100&amp;hd=1&amp;wmode=opaque&amp;showinfo=0&amp;ref=0;"
											data-videorate="1"
											data-videowidth="100%"
											data-videoheight="100%"
											data-videocontrols="none"
											data-videoloop="none"
											data-forceCover="1"
											data-aspectratio="16:9"
											data-autoplay="true"
											data-autoplayonlyfirsttime="false"
											data-nextslideatend="true"
										></div>
										<!-- LAYER NR. 1 -->
										<div class="tp-caption Video-SubTitle   tp-resizeme"
											id="slide-119-layer-1"
											data-x="10"
											data-y="bottom" data-voffset="50"
											data-width="['auto']"
											data-height="['auto']"
											data-transform_idle="o:1;tO:-20% 50%;"
											data-transform_in="y:bottom;rZ:90deg;sX:2;sY:2;s:1500;e:Power3.easeInOut;"
											data-transform_out="y:50px;opacity:0;s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
											data-start="500"
											data-splitin="none"
											data-splitout="none"
											data-responsive_offset="on"
											style="z-index: 5; white-space: nowrap;">Learn more
										</div>

										<!-- LAYER NR. 2 -->
										<div class="tp-caption Video-Title   tp-resizeme"
											id="slide-119-layer-2"
											data-x="10"
											data-y="bottom" data-voffset="10"
											data-width="['auto']"
											data-height="['auto']"
											data-transform_idle="o:1;tO:-20% 50%;"
											data-transform_in="y:bottom;rZ:90deg;sX:2;sY:2;s:1500;e:Power3.easeInOut;"
											data-transform_out="y:50px;opacity:0;s:1000;e:Power3.easeInOut;s:1000;e:Power3.easeInOut;"
											data-start="750"
											data-splitin="none"
											data-splitout="none"
											data-responsive_offset="on"
											style="z-index: 6; white-space: nowrap;">{{$blogs->title}}
										</div>
									</li>
									<?php $count++; ?>
								@endforeach
								</ul>
								<div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>
							</div>
						</div><!-- END REVOLUTION SLIDER -->

				</section>
				<!-- End of Slider =========================================== -->
				<div class="container clearfix">
					<div class="heading-block center nobottomborder">
						<!-- <span class="before-heading color">What are you in the Mood for.?</span> -->
						<h2>ACTIVITIES AND ADVENTURE SPORTS</h2>
						<div class="divider divider-short divider-rounded divider-center"><i class="icon-map-marker"></i></div>
					</div>
				</div>
				<div class="real-estate owl-carousel image-carousel bad carousel-widget bottommargin-lg" data-margin="10" data-nav="true" data-loop="true" data-pagi="false" data-items-xs="1" data-items-sm="1" data-items-md="2" data-items-lg="3" data-items-xl="3">
					@foreach($activities_list as $activities)
					<div class="oc-item">
								<div class="real-estate-item">
									<div class="real-estate-item-image">
										<div class="badge <?php  $travelmode = json_decode($activities->difficulty); if ($travelmode->title == "Easy"){ echo 'badge-success';} if ($travelmode->title == "Quite Tough"){ echo 'badge-danger';}if ($travelmode->title == "Moderate"){ echo 'badge-primary';}  ?>  bgcolor-2">
											<?php

        										$travelmode = json_decode($activities->difficulty);
			
														 // print_r($area); // this is your area from json response
														 echo $travelmode->title;
													
												?>
										</div>
										<a href="#">
											<img src="img/activities/{{ $activities->slug }}/{{ $activities->display_image }}" alt="Image 1">
										</a>
										<div class="real-estate-item-price">
											{{$activities->price}}<span>per Person</span>
										</div>
										<div class="real-estate-item-info clearfix">
											<a href="#"><i class="icon-line-stack-2"></i></a>
											<a href="#"><i class="icon-line-heart"></i></a>
										</div>
									</div>
									<div class="real-estate-item-desc">
										<h3><a href="#">{{ $activities->title }}</a></h3>
										<span>{{ $activities->loaction }}</span>

										<a href="#" class="real-estate-item-link"><i class="icon-info"></i></a>

										<div class="line" style="margin-top: 15px; margin-bottom: 15px;"></div>

										<div class="real-estate-item-features t500 font-primary clearfix">
											<div class="row no-gutters">
												<div class="col-lg-4 col-6 nopadding">Transportation: <span class="color"><?php
        										foreach (json_decode($activities->types) as $transportation)
													{
														 // print_r($area); // this is your area from json response
														 echo $transportation->title;
														 echo " ";
													}
												?></span></div>
												<div class="col-lg-4 col-6 nopadding">Duration: <span class="color">{{ $activities->duration }}</span></div>
												<div class="col-lg-4 col-6 nopadding">Accommodation: <span class="color">{{ $activities->rating}}</span></div>
											</div>
										</div>
									</div>
								</div>
							</div>
					@endforeach
						</div>
				<div class="section dark topmargin-lg footer-stick">
				<div class="container center clearfix">

						<div class="heading-block bottommargin-sm nobottomborder">
							<span class="before-heading color">Create a Custom Plan based on your Taste</span>
							<h2>Start making your Travel Plans</h2>
						</div>

						<p class="lead">Educate, aid, criteria catalyst John Lennon. Life-saving diversity necessities elevate worldwide carbon rights empowerment. Pursue these aspirations leverage, accessibility UNICEF, reduce child mortality collaborative cities safeguards. Informal economies non-partisan; evolution transformative climate change local benefit.</p>

						<a href="#" class="button button-rounded button-reveal tright button-xlarge topmargin-sm"><i class="icon-angle-right"></i><span>Create a Package</span></a>

					</div>
				</div>
			</div>	
		</section>
		<!-- Section End ============================================= -->


@include('common.footer')