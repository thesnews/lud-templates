{#ceres/ceres/search.tpl#}


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

			<div class="row-fluid">
				<div class="span8">
					{% include 'ceres/ceres/searchform.tpl' %}

					<hr class="spacer" />

					<div class="row-fluid">
						<div class="span11 offset1">
							<h2>Results</h2>

							<hr class="spacer" />
								{% if listings.length %}
									<ul class="listings">
										{% for listing in listings %}
											{% if listing.featured %}
											<li>
												<div class="feature-list">
													{% set images = listing.media.grab('type', 'image', true) %}

														{% if images.length %}
															<div class="listing_thumb right">
																<img src="{{ images[0].urlThumbnail }}" alt="" />
															</div>
														{% endif %}
													<h5><a href="{{ listing.urlListing }}">{{ listing.name }}</a> &middot; {{ listing.priceLabel }}</h5>

														{{ listing.description_formatted|clip(170, false) }}
														<br />
														{{ listing.address }} | {{ listing.phone }}
												</div>
											</li>

											{% else %}
											<li>

												<h5><a href="{{ listing.urlListing }}">{{ listing.name }}</a> &middot; {{ listing.priceLabel }}</h5>

												{{ listing.description_formatted|clip(170, false) }}
												<br />
												{{ listing.address }} | {{ listing.phone }}

											</li>
											{% endif %}
									{% endfor %}




								</ul>
							{% else %}
								<h3>Sorry</h3>
								No listings found.
							{% endif %}
						</div>
					</div>

					<div class="pagination">
						<ul>
							{% if pagination.getPrevious() %}
								<li><a href="{{ pagination.getPrevious().url }}">&laquo;</a></li>
							{% endif %}
							{% for page in pagination.getPages() %}
								{% if page.isCurrent() %}
									<li class="active"><a href="{{ page.url }}">{{ page.label }}</a></li>
								{% else %}
									<li><a href="{{ page.url }}">{{ page.label }}</a></li>
								{% endif %}
							{% endfor %}
							{% if pagination.getNext() %}
								<li><a href="{{ pagination.getNext().url }}">&raquo;</a></li>
							{% endif %}
						</ul>
					</div>
				</div>
			</div>
		</div>

		{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
	</div>




{% endblock %}
