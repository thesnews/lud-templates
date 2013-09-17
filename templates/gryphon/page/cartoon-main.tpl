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
		<h2> Cartoons</h2>
		<br/>

		<div class="row-fluid">
			{% fetch cartoons from media with [
				'order': 'created desc',
				'limit': 10,
				'withTags': ['editorial_cartoon']
			] %}

			{% for doc in cartoons %}
					{% if loop.index % 2 %}
						</div>
						<div class="row-fluid">
					{% endif %}
				<div class="span6" style="padding-bottom:20px;">
					<a href="{{ doc.url }}" class="fancybox-single"><img src="{{ doc.urlPreview }}" style="max-width:310px;" class="photo" /></a>
					{% if (doc.authors.length) %}
						<aside>By <a href="{{ doc.authors[0].urlSearch }}">{{ doc.authors[0].name }}</a></aside>
					{% endif %}
				</div>
			{% endfor %}
		</div>


		<hr class="spacer" />
		<a href="{{ 'search'|url(['a':1,'tg':'editorial_cartoon']) }}" class="btn btn-primary pull-right">More cartoons</a>


		<hr class="spacer double" />


	</div> <!-- closes span8 -->

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}