{#gryphon/page/main.tpl#}


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

		<h1>{{ page.title }}</h1>

		<hr class="hairline" />

		{{ page.content_formatted }}
	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}