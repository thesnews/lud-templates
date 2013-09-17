{#gryphon/blog/landing.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: Blogs{% endblock %}
{% block activeNav %}blog{% endblock %}

{% block content %}

{% helper request %}


{% import 'macros/meta.tpl' as metaRender %}
{% import 'macros/article.tpl' as articleRender %}

<div class="row-fluid">
	<div class="span8">

		{% for blog in blogs %}
			<div class="row-fluid">
				<div class="span12">
					{% if blog.media.length %}
						<div style="text-align: center;">
						  <a style="float:right;" href="{{ blog.url }}.xml"><img style="width:20px;" src="{{ 'assets/dist/images/rss.png'| asset }}" alt = "RSS Feed Logo" /></a>
						  <a href="{{ blog.url }}"><img src="{{ blog.media[0].url }}" /></a>
						</div>
					{% else %}
					   
						<div class="box" style="height:100px">
						  <a style="float:right;" href="{{ blog.url }}.xml"><img style="width: 20px;"src="{{ 'assets/dist/images/rss.png'| asset }}" alt = "RSS Feed Logo" /></a>
						  <h1><a href="{{ blog.url }}">{{ blog.name }}</a></h1>
						</div>
					{% endif %}
				</div>
			</div>

			<hr class="half spacer" />

			<strong>{{ blog.description_formatted }}</strong>

			<hr class="double hairline" />

			{% set post = blog.mostRecent %}

			<h2><a href="{{ post.url }}">{{ post.headline }}</a></h2>

			<hr class="spacer " />

			{{ post.abstract_formatted }}
			<a href="{{ post.url }}">Read more</a>

			<div class="row-fluid">
				<div class="span4">
					<h6><a href="{{ post.url }}">{{ disqus.countlink(post) }}</a></h6>
				</div>

				<div class="span4">
					<h6>Published {{ metaRender.dateLong(post.created) }}</h6>
				</div>

				<div class="span4">
					<h6><a href="{{ blog.url }}">MORE FROM THIS BLOG</a></h6>
				</div>

			</div>

			<hr class="double hairline" />
		{% endfor %}

	</div><!-- end of span8 content -->

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div><!-- end of row -->
{% endblock content %}

