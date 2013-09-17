{#roost/roost/tos.tpl#}


{% extends 'gryphon/base.tpl' %}
{% block title %} :: Housing Guide : {{ property.name }}{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ '/roost/frontend/javascript/master.js'|url }}"></script>
{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ '/roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
{% helper config %}
<div class="row-fluid">
	<div class="span8">
		<h2>Terms of Service: Housing Guide</h2>

		<p>
			Property listings and associated files are provided and maintained by the individual property owners listed. The Duke Student Publishing Company takes no responsibility for the content thereof. Users are solely responsible for reviewing and making decisions and agreements or contracts based on the information provided in this Online Housing Guide and agree to hold The Duke Student Publishing Company harmless and waive any liability of The Duke Student Publishing Company for any and all disputes involving information provided in this guide.
		</p>

		<p>
			 Although most changes are likely to be minor, The Duke Student Publishing Company may change its Housing Guide Terms of Service from time to time, and in The Duke Student Publishing Company's sole discretion. The Duke Student Publishing Company encourages visitors to frequently check this page for any changes to its Housing Guide Terms of Service. Your continued use of this site after any change in this Terms of Service policy will constitute your acceptance of such change.
		</p>

		<em>Updated April 24, 2012</em>

	</div>
	<div class="span4">
		{% include 'roost/roost/_sidebar.tpl' %}
	</div>
</div>
<hr class="spacer" />
{% endblock content %}