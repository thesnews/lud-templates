{#gryphon/multimedia/newmain.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}

{% block bodyClass %}multimedia{% endblock %}

{% block content %}
{% helper request %}

{% import 'macros/render.tpl' as mediaRender %}

{% set topMedia = false %}
{% if request.getSegment(1) %}
	{% set topMedia = media.shift() %}
{% endif %}
<div class="row">

	<div class="span8">
		<h1>
			Multimedia
			<div class="subnav pull-right">
				<ul>
					<li><strong>More</strong></li>
					<li><a href="{{ 'multimedia/video'|url }}">Videos</a></li>
					<li><a href="{{ 'gallery'|url }}">Galleries</a></li>
					<li><a href="{{ 'multimedia/audio'|url }}">Audio</a></li>
				</ul>
			</div>
		</h1>

		<hr class="hairline" />

		{% if not topMedia %}
			{% include 'gryphon/multimedia/landing.tpl' %}
		{% else %}
			{% include 'gryphon/multimedia/detail.tpl' %}
		{% endif %}
	</div> <!-- closes span8 -->

	{% include 'gryphon/main/sidebar-standard.tpl' %}

</div>

<hr class="spacer" />

{% endblock content %}
