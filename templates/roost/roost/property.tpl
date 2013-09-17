{#roost/roost/property.tpl#}


{% extends 'gryphon/base.tpl' %}
{% block title %} :: Housing Guide : {{ property.name }}{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ '/roost/frontend/javascript/master.js'|url }}"></script>
{% endblock %}

{% block styles %}
{% endblock %}

{% block content %}
	{% helper config %}
	{% helper request %}

	{% set advancedAmenities = [
		'Unit': [
			'furnished': 'Furnished Units Available',
			'laundry_in_unit': 'Laundry In-Unit',
            'laundry_hookups': 'Laundry Hookups In-Unit',
            'fireplace': 'Fireplace',
            'dishwasher': 'Dishwasher',
			'secure_entry': 'Secure Entry',
			'balcony_patio': 'Balcony/Patio',
            'ac': 'Air Conditioning',
            'utility_tv': 'Cable/Satellite',
            'utility_heat': 'Heat Included',
            'utility_water': 'Water Included'

		],

		'Community': [
			'laundry_on_property': 'Laundry On-Property',
			'carport_garage': 'Carport/Garage',
			'utility_garbage': 'Garbage Included',
			'computer_lab': 'Computer Lab',
			'community_center': 'Community Center',
            'security_system': 'Security System',
            'gated_community': 'Gated Community',
            'business_center': 'Business Center',
            'picnic_area': 'Picnic/Grill Area',
            'playground': 'Playground',
            'dog_park': 'Dog Park'

		],

		'Athletic': [
			'pool': 'Pool',
			'fitness_center': 'Fitness Center',
			'volleyball': 'Volleyball Court',
			'basketball': 'Basketball Court',
            'tennis': 'Tennis Court',
            'trails': 'Access to Trails',
            'putting_green': 'Putting Green'
		],

        'Pets': [
            'allow_dogs': 'Allow Dogs',
            'allow_cats': 'Allow Cats'
        ]

	] %}

	{% set saleAmenities = [
		'Unit': [
			'dishwasher': 'Dishwasher',
			'laundry_in_unit': 'Laundry In-Unit',
            'laundry_hookups': 'Laundry Hookups In-Unit',
            'fireplace': 'Fireplace',
			'secure_entry': 'Secure Entry',
			'balcony_patio': 'Balcony/Patio',
            'ac': 'Air Conditioning',
            'utility_tv': 'Cable/Satellite',
		],

		'Community': [
			'laundry_on_property': 'Laundry On-Property',
			'carport_garage': 'Carport/Garage',
			'utility_garbage': 'Garbage Included',
			'computer_lab': 'Computer Lab',
			'commenty_center': 'Community Center',
            'security_system': 'Security System',
            'gated_community': 'Gated Community',
            'business_center': 'Business Center',
            'picnic_area': 'Picnic/Grill Area',
            'playground': 'Playground',
            'dog_park': 'Dog Park'
		],

		'Athletic': [
			'pool': 'Pool',
			'fitness_center': 'Fitness Center',
			'volleyball': 'Volleyball Court',
			'basketball': 'Basketball Court',
            'tennis': 'Tennis Court',
            'trails': 'Access to Trails',
		]

	] %}

	{#
	  This fetches related properties by owner. If the owner doesnt have any
	  other properties, this fetches other properties with the same rent level.
	#}
	{% set similar = property.getNear() %}

	{% if similar.length == 0 %}
		{% set similar = property.getSimilar('rent', property.rent, '3') %}
	{% endif %}

	{% set images = property.propertyAssets.grab('type', 'image') %}
	{% set docs = property.propertyAssets.grab('type', 'document') %}
	{% set videos = property.propertyAssets.grab('type', 'video') %}

	{% set amenitiesMap = config.get('roost:amenitiesMap') %}
	<div class="row property-listing">
		<div class="span8">
			{% if request.get('message', 'stripTags') %}
				<div class="alert{% if request.get('type', 'specialChars') == 'success' %} alert-success{% elseif request.get('type', 'specialChars') == 'error' %} alert-error{% endif %}">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					{{request.get('message', 'stripTags')}}
				</div><!-- alert -->
			{% endif %}
			<header class="listing">
				<h1>{{ property.name }}</h1>
				{{ property.address }}
				| <span class="phone">{{ property.phone }}</span>
				{% if property.email %}
					| <a href="{{ ('roost:roost/contact/'~property.uid)|url }}" class="email" onclick="_gaq.push(['_trackEvent', 'Properties', 'Contact', '{{property.name}}']);">Contact via email</a>
				{% endif %}
				{% if property.url %}
					| <a class="website" href="{{ property.url }}" onclick="_gaq.push(['_trackEvent', 'Properties', 'Website', '{{property.name}}']);" target="_blank">Visit website</a>
				{% endif %}
			</header>

			<div class="row-fluid">
				<div class="span8">
					<div class="row-fluid listing-features">
					<hr class="double spacer" />
						<div class="span5">
							{% if property.sale %}
								<h3>${{ property.sale}}</h3>
							{% else %}
								<h3>{{property.rentLabel}}</h3>
								<h4>Per Month</h4>
							{% endif %}
						</div><!-- span5 -->
						<div class="span3">
							<h3>{{ property.bedrooms }}</h3>
							<h4>Bedrooms</h4>
						</div><!-- span3 -->
						<div class="span3">
							<h3>{{property.bathrooms}}</h3>
							<h4>Bathrooms</h4>
						</div><!-- span3 -->
					</div><!-- row-fluid -->

					<hr class="spacer" />

					{% if images.length %}
						<div id="propertyImages" class="carousel slide">
							<ol class="carousel-indicators">
								{% for image in images %}
									<li data-target="#propertyImages" data-slide-to="{{loop.index0}}"{% if loop.index0 == 0 %} class="active"{% endif %}></li>
								{% endfor %}
							</ol>
							<div class="carousel-inner">
								{% for image in images %}
									<div class="item{% if loop.index0 == 0 %} active{% endif %} text-center">
										<img src="{{image.url}}" style="margin:auto;" />
										{% if image.title or image.caption %}
											<div class="carousel-caption" style="text-align:left;">
												{% if image.title %}
													<h4>{{ image.title }}</h4>
												{% endif %}
												{% if image.caption %}
													{{image.caption_formatted}}
												{% endif %}
											</div><!--carousel-caption-->
										{% endif %}
									</div><!-- item -->
								{% endfor %}
							</div> <!-- carousel-inner -->

							<a class="carousel-control left" href="#propertyImages" data-slide="prev">&lsaquo;</a>
							<a class="carousel-control right" href="#propertyImages" data-slide="next">&rsaquo;</a>
						</div> <!-- carousel slide -->

					{% endif %}

					{{ property.description_formatted }}

					<hr class="spacer" />

					<a href="{{ property.urlMap }}" target="_blank"><img id="listing_map" src="{{ property.urlStaticMapBig }}" alt="{{ property.urlStaticMapBig }}" style="max-width:100%;" onclick="_gaq.push(['_trackEvent', 'Properties', 'Viewmap', '{{property.name}}']);" /></a>

					<hr class="half spacer" />

					<a href="{{ property.urlMap }}" target="_blank" class="btn btn-lud" onclick="_gaq.push(['_trackEvent', 'Properties', 'ViewDirections', '{{property.name}}']);">Directions</a>

				</div><!-- span8 -->
				<hr class="double spacer" />
				<div class="span4">
					<section class="listing-sidebox">
						<h3>Distance from Liberty</h3>

						<div>
							<strong>{{property.chapel_distance}} miles</strong>
						</div>
					</section>
					<hr class="spacer" />
					{% if related.length %}
						<section class="listing-sidebox">
							<h3>Related Properties</h3>

							<div>
								<ul>
									{% for prop in related %}
										<li><a href="{{prop.urlListing}}" onclick="_gaq.push(['_trackEvent', 'Properties', 'ViewFromRelated', '{{property.name}}']);">{{prop.title}} {{prop.bedrooms}}BR/{{prop.bathrooms}}BH</a></li>
									{% endfor %}
								</ul>
							</div>
						</section>
						<hr class="spacer" />
					{% endif %}

					<section class="listing-sidebox">
						<h3>Amenities</h3>
						<div>
						{% if property.sale %}
		                    {% for label, amenities in saleAmenities %}
	                            <strong>{{ label }}</strong>
	                            <ul>
	                                {% for amenity, label in amenities %}
										{% if property[amenity] %}
											<li>{{ label }}</li>
										{% endif %}
	                                {% endfor %}
	                            </ul>
		                    {% endfor %}
		                {% else %}
		                    {% for label, amenities in advancedAmenities %}
	                            <strong>{{ label }}</strong>
	                            <ul>
	                                {% for amenity, label in amenities %}
										{% if property[amenity] %}
											<li>{{ label }}</li>
										{% endif %}
	                                {% endfor %}
	                            </ul>
		                    {% endfor %}

		                {% endif %}
						</div>
					</section>

					<hr class="spacer" />

					<section class="listing-sidebox">
						<h3>Share this Listing</h3>
						<div>
							<form data-action="send-to-friend">
								<input type="text" name="name" placeholder="Your name" />
								<input type="text" name="your_email" placeholder="Your email address" />
								<input type="text" name="their_email" placeholder="Their email address" />
								<a href="#mailModal" data-post="{{('housing/send/'~property.uid)|url}}" class="btn btn-lud" data-toggle="modal" onclick="_gaq.push(['_trackEvent', 'Properties', 'Email', '{{property.name}}']);">Send</a>
							</form>
						</div>
					</section>


					{% if docs.length %}
						<hr class="spacer" />
						<section class="listing-sidebox">
							<h3>Documents</h3>

							<div>
								<ul>
									{% for doc in docs %}
										<li><a href="{{ doc.urlOriginal }}" onclick="_gaq.push(['_trackEvent', 'Properties', 'ViewDocument', '{{property.name}}']);">{{ doc.title|default('Document') }}</a></li>
									{% endfor %}
								</ul>
							</div>
						</section>
					{% endif %}

				</div>
			</div>
			<hr class="double spacer" />
			<div class="row-fluid">
			{% if prop.length %}
				<div class="span12">
					<header class="listing">
					<h2>Nearby Properties</h2>
					</header>
		            {% for prop in similar %}
		            	{% if prop.name != property.name %}
		                <div class="result">
		                    <div class="row-fluid">
		                        <div class="span8">
		                            <h3>
		                            	<a href="{{ prop.urlListing }}" onclick="_gaq.push(['_trackEvent', 'Properties', 'ViewFromSimilar', '{{property.name}}']);">
		                            		{% if prop.name != prop.street %}
		                            			{{ prop.name }}
		                            		{% else %}
		                            			{{ prop.type }} for {% if prop.sale %}sale{% else %}rent{% endif %}
		                            		{% endif %}
		                            	</a>
		                            </h3>
		                            <h4>{{ prop.street }}, {{ prop.city }}</h4>

		                            <hr class="spacer" />

		                            <div class="row-fluid">
		                                <div class="span5 well">
		                                	{% if prop.sale %}
			                                    <h5>${{ prop.sale }}</h5>
			                                {% else %}
			                                    <h5>{{ prop.rentLabel }}</h5>
			                                    <h6>per {{ prop.rent_modifier }}</h6>
			                                {% endif %}
		                                    <hr />
		                                    <strong>{{ prop.bedrooms }} Bed</strong>
		                                    <strong>{{ prop.bathrooms }} Bath</strong>
		                                </div>

		                                <div class="span7">
		                                    <p>{{ prop.summary_formatted|clip(500) }}</p>

		                                    <a href="{{ prop.urlListing }}" onclick="_gaq.push(['_trackEvent', 'Properties', 'ViewFromSimilar', '{{property.name}}']);">More</a>
		                                </div>

		                            </div><!-- /row-fluid -->
		                        </div><!-- /span8 -->

		                        <div class="span4 text-center">
									<a href="{{ prop.urlMap }}" target="_blank"><img src="{{ prop.__urlStaticMap('250x200') }}" alt="{{ prop.urlStaticMap }}" style="max-width:100%;" /></a>

		                            <hr class="spacer" />

		                            <a class="btn" href="{{ prop.urlListing }}" onclick="_gaq.push(['_trackEvent', 'Properties', 'ViewFromSimilar', '{{property.name}}']);">Full Profile</a>
		                        </div><!-- /span4 -->

		                    </div>
		                </div>
		                {% endif %}
		            {% endfor %}
		        </div>
		        {% endif %}
			</div>
		</div><!-- end span8 -->

			{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

	</div><!-- end row-->




{% endblock %}