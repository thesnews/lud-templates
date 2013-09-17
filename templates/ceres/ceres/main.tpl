{#ceres/ceres/main.tpl#}


{% extends 'gryphon/base.tpl' %}

{% block dg %}true{% endblock %}
{% block title %} :: Dining Guide {% endblock %}
{% block bodyClass %}dining-guide{% endblock %}
{% block styles %}
{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ 'ceres/frontend/support.jq.js'|url }}"></script>
	<script type="text/javascript">
	$(function(){
		var input = $('input[name=city_zip]');
		var defaultVal = input.val();

		$('#dg_search_main').submit(function(){
			if( input.val() == defaultVal ) {
				input.val('');
			}
		});
	});
	</script>
{% endblock %}


{% block content %}

	<div class="row-fluid">
		<div class="span8">
			<img src="{{ 'assets/dist/images/liberty-eats.png'|asset }}" alt="Liberty Eats" />

			<hr class="double spacer" />

			{% include 'ceres/ceres/searchform.tpl' %}

			<hr class="spacer" />

			<div class="row-fluid">
				<div class="span11 offset1">

					{% fetch featured from ceres:listing with [
						'limit': 3,
						'order': 'name asc',
						'where': 'status = 1 AND featured = 1',
					] %}

					{% if featured.length %}
						<h2>Featured Listings</h2>
						<hr class="spacer" />

						<ul class="listings">
							{% for listing in featured %}
								<li>
									<div class="feature-list">
										<h5><a href="{{ listing.urlListing }}">{{ listing.name }}</a></h5>
										<strong>{{ listing.priceLabel }}</strong>
										<br />
										{{ listing.address }} | {{ listing.phone }}
									</div>

								</li>
							{% endfor %}
						</ul>
					{% endif %}
				</div>
			</div>
		</div>

		{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
	</div>




{% endblock %}
