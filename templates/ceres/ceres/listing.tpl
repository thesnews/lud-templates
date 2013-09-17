{#ceres/ceres/listing.tpl#}


{% extends 'gryphon/base.tpl' %}

{% block dg %}true{% endblock %}
{% block title %} :: Dining Guide : {{ listing.name }}{% endblock %}

{% block bodyClass %}dining-guide{% endblock %}
{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript">
		$(function() {
			$('.dg_img_link').click(function(){
				var imgUrl = $(this).attr('href');
				$('#listing_img_main img').attr('src', imgUrl);
				return false;
			});
		});
	</script>
{% endblock %}

{% block content %}

	{% set menu = listing.media.grab('meta', 'menu', true) %}
	{% set images = listing.media.grab('type', 'image', true) %}

	<div class="row-fluid">
		<div class="span8">

			<div class="listing-header">
				<header>
					<h1>{{ listing.name }}</h1>
					{{ listing.priceLabel }} | {{ listing.address }} | {{ listing.phone }}
					{% if listing.email %}
						| <a href="mailto:{{ listing.email }}">{{ listing.email }}</a>
					{% endif %}
					{% if listing.url %}
						| <a class="website" href="{{ listing.url }}">Visit website</a>
					{% endif %}
					{% if label =='flames_cash' %}
					 <h4>Accepts Flames Cash!</h4>
					{% endif %}
				</header>
			</div>

			<hr class="spacer" />

			<div class="row-fluid">
				<div class="span8">
					{% if images.length %}
						{% set topImage = images.shift() %}
						<img src="{{ topImage.url }}" class="flexyimage" />
					{% endif %}

					<hr class="spacer" />

					{{ listing.description_formatted }}

					<hr class="spacer" />

					<ul class="thumbnails">
				        {% for item in images %}
				        	<li>
								<a class="fancygal" rel="ceresgal" href="{{item.url}}" title="">
									<img src="{{item.urlPreview}}" alt="" style="width:140px;"/>
								</a>
							</li>
				        {% endfor %}
				    </ul>
				</div>

				<div class="span4">

					<header class="box">
						<h3>Features</h3>
					</header>
					<div class="sidebox">
						{% if listing.features|length %}
							<ul class="listing_features">
								{% for feature, label in listing.features %}
									{% if label != 'chamber_member' %}
										<li class="pos">{{ config.get('ceres:features:'~ label) }}</li>
									{% endif %}
								{% endfor %}
							</ul>
						{% endif %}
					</div>

					<hr class="spacer" />

					<header class="box">
						<h3>Categories:</h3>
					</header>
					<div class="sidebox">
						<ul>
							{% for cat in listing.categories %}
								<li><a href="{{ ('ceres:ceres/search?category='~cat.uid)|url }}">{{ cat.name }}</a></li>
							{% endfor %}
						</ul>
					</div>

					{% if menu.length %}
						<hr class="spacer" />

						<header class="box">
							<h3>Menu:</h3>
						</header>
						<div class="sidebox">
			            	{% for item in menu %}
			                    <a href="{{ item.urlOriginal }}" target="_blank" class="btn btn-primary btn-block">Download PDF Menu</a>
			            	{% endfor %}
			            </div>
		        	{% endif %}

		        	<hr class="spacer" />

		        	<header class="box">
						<h3>Map:</h3>
					</header>
					<div class="sidebox">
						<a href="{{ listing.urlMap }}" target="_blank"><img src="{{ listing.urlStaticMapBig }}" /></a>
						<hr class="spacer" />
						<a href="{{ listing.urlMap }}" class="btn btn-mini btn-primary btn-block" target="_blank">Get Driving Directions</a>
					</div>
				</div>
			</div>

		</div>
		{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
	</div>
{% endblock %}
