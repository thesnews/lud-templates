{#gryphon/page/app.tpl#}


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

		<h1>Mobile App</h1>

		<hr class="hairline" />

		<p>Get The Daily Gamecock for your mobile device.</p>

        <a href="https://play.google.com/store/apps/details?id=com.icampustimes.dailygamecock"><img src="{{ 'assets/dist/images/android_app.png'|asset }}" /></a>
        <hr class="spacer" />

        <a href="https://itunes.apple.com/us/app/daily-gamecock/id551569384?mt=8"><img src="{{ 'assets/dist/images/appstore_app.png'|asset }}" /></a>

	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}