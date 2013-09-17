{#gryphon/main/main.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ config.get('dsw:siteslogan') }}{% endblock %}
{% block description %}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/render.tpl" as render %}
{% import "macros/meta.tpl" as metaRender %}



{% fetch centerpiece from article with [
	 'order': 'weight desc, created desc',
	'limit': '1',
	'where': 'status = 1',
	'withTags': ['centerpiece', 'spotlight' ]
] %}


{% set spotlight = articles.shift(5) %}

<div class="row">
	<div class="span8">
<!-- Breaking -->
		{% if breaking %}
			<header class="breaking">
				<h4>Breaking News</h4>
			</header>

			<hr class="spacer" />

			<div class="breaking-box">
				Updated {{ breaking.modified|timeSince }}
				<h3>
					<a href="{{ breaking.url }}">{{ breaking.headline }}</a>
				</h3>
			</div>
            <hr class="double spacer" />
		{% endif %}
		<!-- End of Breaking -->

		<!-- Developing -->
		{% if developing %}
			<header class="developing">
				<h4>Developing Story</h4>

   				    Updated {{ developing.modified|timeSince }}

			</header>
          <hr class="half spacer" />

			<div class="breaking-box">
				<h3>
					<a href="{{ developing.url }}">{{ developing.headline }}</a>
				</h3>
			</div>
          <hr class="double spacer" />
		{% endif %}
		<!-- End of Developing -->

		<!-- Top Stories -->
		<div class="row-fluid">
			<div class="span12">
				{% for article in centerpiece %}
					{{ articleRender.centerpiece(article) }}
				{% endfor %}
			</div>
		</div>
		<hr class="half spacer" />

        <hr class="spacer hidden-desktop" />
        {% include "gryphon/ads/mobile_top.tpl" %}
        <hr class="spacer hidden-desktop" />

		<div class="row-fluid">
			<div  class="span12" id="spotlight">
				<h1 class="spotlight">Spotlight</h1>
						<hr class="spacer" />
				{% set count = 0 %}
				<div class="row-fluid">

					<div class="span6">
						{# this prevents the centerpiece article from also showing up in the spotlight section #}
						{# by upping the count by one to skip the centerpiece if the headlines match #}

						{% if  spotlight[count].headline == centerpiece[0].headline %}
							{% set count = count + 1 %}
						{% endif %}
						{{ articleRender.spotlight(spotlight[count]) }}
						{% set count = count + 1 %}
						<hr class="clearfix" />
					</div>
					<div class="span6">
						{% if  spotlight[count].headline == centerpiece[0].headline %}
							{% set count = count + 1 %}
						{% endif %}
						{{ articleRender.spotlight(spotlight[count]) }}
						{% set count = count + 1 %}
						<hr class="clearfix" />
					</div>
				</div>
				<div class="row-fluid">
					<div class="span6">
						{% if  spotlight[count].headline == centerpiece[0].headline %}
							{% set count = count + 1 %}
						{% endif %}
						{{ articleRender.spotlight(spotlight[count]) }}
						{% set count = count + 1 %}
						<hr class="clearfix" />
					</div>
					<div class="span6">
						{% if  spotlight[count].headline == centerpiece[0].headline %}
							{% set count = count + 1 %}
						{% endif %}
						{{ articleRender.spotlight(spotlight[count]) }}
						<hr class="clearfix" />
					</div>
				</div>
			</div>
		</div>
		<!-- End of Top Stories -->



		<!-- Multimedia Box -->
		{#<div class="row-fluid hidden-phone">
			<div class="span12">
				{% include 'gryphon/multimedia/media-box.tpl' %}
			</div>
		</div>#}
		<!-- End of Multimedia Box -->

    <hr class="double spacer"/>
		<!-- Featured News -->

    {% include "gryphon/ads/mobile_bottom.tpl" %}
    <hr class="spacer hidden-desktop" />

	<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">

					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['news']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/news'|url }}"><h3>News</h3></a></header>
						<div class="box bg">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
										<div class="has-media">
									{% endif %}
									<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
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
						'withTags': ['sports']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/sports'|url }}"><h3>Sports</h3></a></header>
						<div class="box bg">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
										<div class="has-media">
									{% endif %}
									<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
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
						'where': 'status = 1',
						'withTags': ['features'],
						'limit': 3
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/ae'|url }}"><h3>A&E</h3></a></header>
						<div class="box bg">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
										<div class="has-media">
									{% endif %}


									<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
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

		<hr class="double spacer" />

		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['opinion']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/opinion'|url }}"><h3>Opinion</h3></a></header>
						<div class="box bg">
							{% for article in rundown %}
								{% set topMedia = article.media.grab('type', 'image')[0] %}
								<article class="clearfix">
									{% if topMedia %}
										<a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
										<div class="has-media">
									{% endif %}
									<h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
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

					{% fetch blogs from blog with [
						'order': 'modified desc',
						'where': 'status = 1',
						'limit': 3
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'blog'|url }}"><h3>Blogs</h3></a></header>
						<div class="box bg">
							{% for blog in blogs %}
								{% set post = blog.mostRecent %}
								<article class="clearfix">
									<h4><span class="kicker">{{ blog.name }}</span><br /><a href="{{ post.url }}">{{ post.headline }}</a></h4>
									<hr class="half spacer" />
									<aside>
										<div class="pull-right">
											Published {{ post.created|timeSince }}
										</div>
									</aside>
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>

					<div class="rundown-box span4">
						<header class="box"><h3>Most Popular</h3></header>
						<div class="box bg">
							{% for item in popular.threads|shift(5) %}
								<article class="clearfix">
									<h4><a href="{{ item.link }}">{{ item.title }} </a></h4>
								</article>
								<hr class="hairline" />
							{% endfor %}
						</div>
					</div>
				</div>
			</div>
</div><!-- /.row -->
</div>
{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
</div>

{% endblock content %}
