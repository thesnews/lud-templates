{#gryphon/multimedia/main.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia : {{ media[0].title }}{% endblock %}
{% block description %}{{ media[0].caption_formatted|striptags }}{% endblock %}

{% block activeNav %}multimedia{% endblock %}

{% block styles %}

{% endblock %}

{% block scripts %}

{% endblock %}

{% block links %}
{% endblock %}

{% block bodyClass %}multimedia{% endblock %}
{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% import "macros/render.tpl" as mediaRender %}
{% helper request %}


{% set topMedia = false %}
{% if request.getSegment(1) %}
  {% set topMedia = media.shift() %}
{% endif %}
<div class="multimedia">
<div class="row">
  <div class="span8">
    <h1>Multimedia
    <div class="subnav pull-right">
				<ul>
					<li><strong>More</strong></li>
					<li><a href="{{ 'multimedia/video'|url }}">Videos</a></li>
					<li><a href="{{ 'gallery'|url }}">Galleries</a></li>
					<li><a href="{{ 'multimedia/audio'|url }}">Audio</a></li>
				</ul>
		</div>
    </h1>

<hr class="hairline">

{% if not topMedia %}
  {% include 'gryphon/multimedia/landing.tpl' %}
{% else %}
  {% include 'gryphon/multimedia/detail.tpl' %}
{% endif %}
	</div> <!-- closes span8 -->

    {% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
</div>
</div>
{% endblock content %}
