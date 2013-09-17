{#gryphon/section/main.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}

{% block activeNav %}{{ section.slug }}{% endblock %}
{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
<link rel="stylesheet" type="text/css" href="lud/assets/src/css/bootstrap/carousel.less"/>
<link rel="javascript" href="lud/assets/src/js/vendor/bootstrap-carousel.js"/>
{% endblock %}


{% block content %}

{% helper request %}


{% set featured_story = articles.shift() %}
{% set featured_images = featured_story.media.grab('type', 'image') %}
{% set secondary = articles.shift(3) %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

<div class="row">
  <div class="span8">
<!-- Top Stories -->
		<div class="row-fluid">
			<div class="span7">
				{{ articleRender.centerpieceSection(featured_story) }}
			</div>
			<div class="span5">
				<h2>{{section.name}}</h2>

				{% for story in secondary %}
					{{ articleRender.topSidebar(story) }}
				{% endfor %}
			</div>
		</div>
		
		



		<hr class="double hairline"/>

		<!-- Multimedia Box -->
		{#<div class="row-fluid">
			<div class="span12">
					{% if section.slug != 'opinion' %}
						{% include 'gryphon/multimedia/media-box.tpl' with [section.tags] %}
					{% endif %}
			</div>
		</div>#}
		<!-- End of Multimedia Box -->

		<!-- <hr class="double hairline"/> -->

		<hr class="spacer" />

		<div class="row-fluid">
			<div class="span12">
				<h2>more {{section.name}}</h2>
				</div>
			{% for article in articles %}
				{% if loop.index % 2 %}
					</div>
						<hr class="spacer" />
					<div class="row-fluid">
				{% endif %}

				<div class="span6">
					<hr class="hairline" />
					<article class="summarized-story">
						<h3><a href="{{article.url}}">{{ article.headline }}</a></h3>
						<aside>
							<div class="author">
								{% if article.authors.length %}
								By: {{ article.authors.splat('name')|join(',') }}
								{% endif %}
							</div>
							<div class="pubdate">
								{{ metaRender.dateLine(article.modified) }}
							</div>
							<hr class="spacer clearfix">
						</aside>

						<p>{{article.abstract_formatted|clip(100)}} <a href="{{article.url}}">Read more</a></p>
					</article>
				</div>
			{% endfor %}
		</div>

	</div>
	{% include "gryphon/main/sidebar/sidebar-standard.tpl" %}

</div>

{% endblock content %}
