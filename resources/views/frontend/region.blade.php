@include('common.header')
<!-- Content
		============================================= -->
		<section id="content">
			<div class="content-wrap">
				<div class="container clearfix">
					<div class="heading-block center nobottomborder">
						<h2>REGIONS WITH NATURAL TREASURY</h2>
						<div class="divider divider-short divider-rounded divider-center"><i class="icon-map-marker"></i></div>
					</div>

				</div>

				<div id="portfolio" class="portfolio grid-container portfolio-nomargin portfolio-full portfolio-overlay-open clearfix">
                    @foreach($regions as $regions)
					<article class="portfolio-item pf-media pf-icons">
						<div class="portfolio-image">
							<a href="./region-detail/{{$regions->slug}}">
								<img src="img/regions/{{$regions->slug}}/thumbs/{{ $regions->display_image}}" alt="{{ $regions->title }}">
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
@include('common.footer')