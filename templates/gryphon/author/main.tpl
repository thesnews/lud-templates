{#gryphon/author/main.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: Staff : {{ author.name }}{% endblock %}
{% block activeNav %}home{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}
{% import "macros/render.tpl" as render %}

<div class="row">
	<div class="span8">

		<h1>{{ author.name }}</h1>

		{{ author.tagline }}

		<hr class="spacer" />

		{% fetch page from page with [
			'where': 'status = 1 and title = :au',
			'bind': [':au': ('Author: '~author.name)],
			'limit': 1
		] %}
		<div class="row-fluid">
			{% if page.length %}
				{% if page[0].media.length %}
					<div class="span3"><img src="{{ page[0].media[0].urlPreview }}" /></div>
					<div class="span9">
				{% else %}
					<div class="span12">
				{% endif %}

					<p>{{ page[0].content_formatted }}</p>
			{% else %}
				<div class="span12">
			{% endif %}



			{% if author.articles.length %}
					<h3>Recent articles:</h3>
					<ul>
						{% for item in author.articles %}
							<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
						{% endfor %}
					</ul>
					<hr class="spacer" />
			{% endif %}

			{% if author.blogPosts.length %}
					<h3>Recent posts:</h3>
					<ul>
						{% for item in author.blogPosts %}
							<li><a href="{{ item.url }}">{{ item.headline }}</a></li>
						{% endfor %}
					</ul>
					<hr class="spacer" />
			{% endif %}

			{% if author.media.length %}
					<h3>Recent media:</h3>
					<ul>
						{% for item in author.media %}
							<li><a href="{{ item.urlDefault }}">
								{% if item.title%}
									{{ item.title }}
								{% else %}
									{% if item.type == "image" %}
										Untitled Image
									{% elseif item.type =="video" %}
										Untitled Video
									{% elseif item.type == "audio" %}
										Untitled Audio
									{% else %}
										Untitled Media
									{% endif %}
								{% endif %}
							</a></li>
						{% endfor %}
					</ul>
					<hr class="spacer" />
			{% endif %}
			</div>
		</div>

	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}
