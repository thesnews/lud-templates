{#roost/roost/main.tpl#}


{% extends 'gryphon/base.tpl' %}

{% block title %} :: Housing Guide{% endblock %}
{% block active %}{% endblock %}
{% block subActive %}Housing Guide{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ '/roost/frontend/javascript/master.js'|url }}"></script>
{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ '/roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
	{% helper adpilotHelper as ads %}
	{% helper config %}

	{% set housingTypes = ['house', 'apartment', 'duplex', 'room', 'condo', 'townhome'] %}

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


	{% set sortOptions = [
		'rent_asc': 'Rent - Lowest to Highest',
		'rent_desc': 'Rent - Highest to Lowest',
		'bedrooms_asc': 'Bedrooms - Lowest to Highest',
		'bedrooms_desc': 'Bedrooms - Highest to Lowest',
		'bathrooms_desc': 'Bathrooms - Highest to Lowest',
		'bathrooms_asc': 'Bathrooms - Lowest to Highest',
		'city_asc': 'City - A to Z',
		'city_desc': 'City - Z to A',
		'chapel_distance': 'Distance from Chapel'
	] %}

	{% set saleRange = [
		'0': 'Less than $99,999',
		'1': '$100,000 to $149,000',
		'2': '$150,000 to $199,999',
		'3': '$200,000 to $299,999',
		'4': 'More than $300,000'
	] %}

<div class="row">
	<div class="span8">

		{% include 'roost/roost/_search_form.tpl' %}

		<hr class="double spacer" />

        <h2 class="wrap-header">Results</h2>
		<div class="results-wrapper">

            <div class="clearfix">
                <div class="pull-right"><a href="#" class="btn btn-small btn-lud" data-action="toggle-map">Hide Map</a></div>
            </div>

            <hr class="half spacer" />

			<div id="canvas" style="width:100%;height:450px;margin:0 auto;" rel="37.35261,-79.17906"></div>
			<hr class="spacer" />

			<div class="pagination text-center" id="pagination-top">
				{% for page in pagination %}
					<a href="{{ page.url }}" class="btn btn-lud">{{ page.label }}</a>
				{% endfor %}
			</div>
            {% if not properties.length %}
                <h4>Sorry...</h4>
                <p>No properties match your search.</p>
            {% endif %}

            {% for property in properties %}
                <div class="result" data-coords="{{property.latLon }}" data-type="{{property.type}}" data-send="{{('housing/send/'~property.uid)|url}}">
                    <div class="row-fluid">
                        <div class="span8">
                            <h3>
                            	<a href="{{ property.urlListing }}" onclick="_gaq.push(['_trackEvent', 'Properties', 'View', '{{property.name}}']);">
                            		{% if property.name != property.street %}
                            			{{ property.name }}
                            		{% else %}
                            			{{ property.type }} for {% if property.sale %}sale{% else %}rent{% endif %}
                            		{% endif %}
                            	</a>
                            </h3>
                            <h4>{{ property.street }}, {{ property.city }}</h4>

                            <hr class="half spacer" />

                            <div class="row-fluid">

                                <div class="span5 well">
                                	{% if property.sale %}
	                                    <h5>${{ property.sale }}</h5>
	                                {% else %}
	                                    <h5{% if property.rentLabel == 'call for rent info' or 'to'|in(property.rentLabel)%} style="font-size:35px;"{% endif %}>{{ property.rentLabel }}</h5>
	                                    <h6>Per Month</h6>
	                                {% endif %}
                                    <hr />
                                    <strong>{{ property.bedrooms }} Bed</strong>
                                    <strong>{{ property.bathrooms }} Bath</strong>
                                </div>

                                <div class="span7">
                                    <p>{{ property.summary_formatted|clip(300) }}</p>

                                    <a href="{{ property.urlListing }}" class="more-link" onclick="_gaq.push(['_trackEvent', 'Properties', 'View', '{{property.name}}']);">More</a>
                                </div>

                            </div><!-- /row-fluid -->
                        </div><!-- /span9 -->

                        <div class="span4 text-center">
                            {% set propimg = property.propertyAssets.grab('type','image') %}
                            {% if propimg.length %}
                                <img src="{{ propimg[0].url }}" class="preview-image"/>
                            {% else %}
                                <img src="{{ property.__urlStaticMap('250x225') }}" style="max-width:100%" />
                            {% endif %}

                            <hr class="spacer" />

                            <a class="btn btn-lud" href="{{ property.urlListing }}" onclick="_gaq.push(['_trackEvent', 'Properties', 'View', '{{property.name}}']);">Full Profile</a>
                            <a class="btn btn-lud" href="#mailModal" data-toggle="modal" onclick="_gaq.push(['_trackEvent', 'Properties', 'Email', '{{property.name}}']);">Email to a friend</a>
                        </div><!-- /span3 -->

                    </div>
                </div>
            {% endfor %}


			<div class="pagination text-center">
				{% for page in pagination %}
					<a href="{{ page.url }}" class="btn btn-lud">{{ page.label }}</a>
				{% endfor %}
			</div>
		</div>
</div>

	<div class="hidden-phone" id="sidebar">
        {% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
	</div>
</div>

{% endblock %}