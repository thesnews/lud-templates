{#gryphon/blog/blog.tpl#}

{% extends "gryphon/base.tpl" %}
{% block title %} :: Blogs : {{ blog.name }}{% endblock %}
{% block activeNav %}blog{% endblock %}

{% block description %}{{ blog.description_formatted|striptags }}{% endblock %}

{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ blog.name }}" href="{{ blog.url }}.xml" />
{% endblock %}

{% block content %}
{% import 'macros/meta.tpl' as metaRender %}
{% import 'macros/article.tpl' as articleRender %}

{% set post = blog.mostRecent %}

<div class="row-fluid">
	<div class="span8">

		<div class="row-fluid">
			<div class="span12">
				{% if blog.media.length %}
					<a href="{{ blog.url }}"><img src="{{ blog.media[0].url }}" /></a>
				{% else %}
					<div class=box style="height:100px"><h1> <a href="{{ blog.url }}">{{ blog.name }}</a></h1></div>
				{% endif %}

				<hr class="half spacer" />

				<strong>{{ blog.description_formatted }}</strong>

				<hr class="double hairline" />

			</div>
		</div>

		<div class="row-fluid">

			<div class="span12">
			{% for post in posts %}
				<article class="article">
					<h1><a href="{{ post.url }}">{{ post.headline }}</a></h1>
						<aside class="byline">
							Posted by {{ post.authors.splat('name')|join(', ') }} on
							{{ post.created|date('M d') }} at {{ post.created|date('g:ia') }}
						</aside>

						<div>
							{{ post.copy_formatted }}
						</div>

				</article>
				<h6><a href="">{{ disqus.countlink(item) }}</a></h6>
				<hr class="hairline" />
			{% endfor %}
			</div>
		</div>


		<hr class="double spacer" />

		<div class="pagination">
			<ul>
			{% for page in pagination %}
				{% if page.isCurrent %}
					<li class="disabled"><a href="#">{{ page.label }}</a></li>
				{% else %}
					<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
			{% endfor %}
			</ul>
		</div>

	</div><!-- end of span8 content -->

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div><!-- end of row -->



{% endblock content %}
