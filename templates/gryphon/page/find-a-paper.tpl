{#gryphon/page/find-a-paper.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block description %}{{ page.content_formatted|striptags|clip(400) }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block styles %}

{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

<div class="row">
	<div class="span8">

		<h1>Find a Paper</h1>

		<hr class="hairline" />

        <iframe width="100%" height="520" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps/ms?msa=0&amp;msid=215899302198389974365.0004c25e0b68dc172e541&amp;hl=en&amp;ie=UTF8&amp;t=m&amp;source=embed&amp;ll=33.998312,-81.031723&amp;spn=0.068312,0.109863&amp;z=14&amp;output=embed"></iframe><br /><small>View <a href="https://maps.google.com/maps/ms?msa=0&amp;msid=215899302198389974365.0004c25e0b68dc172e541&amp;hl=en&amp;ie=UTF8&amp;t=m&amp;source=embed&amp;ll=33.998312,-81.031723&amp;spn=0.068312,0.109863&amp;z=13" style="color:#0000FF;text-align:left">Daily Gamecock Distribution Locations</a> in a larger map</small>

 	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}