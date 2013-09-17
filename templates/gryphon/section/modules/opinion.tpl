{#gryphon/section/modules/opinion.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ section.name }}{% endblock %}
	{% block content %}
<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['column']
					] %}
					<div class="rundown-box span6">
						<header class="box"><a href="{{ 'section/columns'|url }}"><h3>Columns</h3></a></header>
						<div class="box bg">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
										<div class="has-media">
									{% endif %}
									<h4 class="media-heading"><a href="{{ article.url }}">{{ article.headline }}</a></h4>
									<hr class="half spacer" />
									<aside>
										<div class="pull-right">
											Published {{ article.created|timeSince }}
										</div>
									</aside>
									{% if topMedia %}
										</div>
									{% endif %}
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>

					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['editorial']
					] %}
					<div class="rundown-box span6">
						<header class="box"><a href="{{ 'section/editorial'|url }}"><h3>Editorial</h3></a></header>
						<div class="box bg">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
										<div class="has-media">
									{% endif %}
									<h4 class="media-heading"><a href="{{ article.url }}">{{ article.headline }}</a></h4>
									<hr class="half spacer" />
									<aside>
										<div class="pull-right">
											Published {{ article.created|timeSince }}
										</div>
									</aside>
									{% if topMedia %}
										</div>
									{% endif %}
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>
				</div>
</div>
</div>