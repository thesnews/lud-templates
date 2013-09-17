{#gryphon/blog/main.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ blog.name }} : {{ post.headline }}{% endblock %}
{% block description %}{{ post.abstract_formatted|striptags }}{% endblock %}
{% block activeNav %}blog{% endblock %}
{% block subActive %}{{ blog.slug }}{% endblock %}

{% block styles %}

{% endblock %}

{% block scripts %}
{% endblock %}

{% block links %}
<link rel="canonical" type="text/html" href="{{ post.url }}" />
<link rel="alternate" type="application/rss+xml" title="{{ blog.name }}" href="{{ blog.url }}.xml" />
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

{% set mugShot = post.media.grab('meta', 'mugshot', true) %}
{% set gallerykeys = post.media.grab('meta', 'gallery key', true) %}
{% set images = post.media.grab('type', 'image', true) %}

{% set video = post.media.grab('type', 'video', true) %}
{% set audio = post.media.grab('type', 'audio', true) %}
{% set slides = post.media.grab('type', 'soundSlide', true) %}
{% set interactives = post.media.grab('type', 'flash', true) %}
{% set pdfs = post.media.grab('type', 'pdf', true) %}

<div class="row-fluid">
  <div class="span8">
		<div class="row-fluid">
			<div class="span12">
                {% if blog.media.length %}
                    <a href="{{ blog.url }}"><img src="{{ blog.media[0].url }}" /></a>
                {% else %}
                    <div class=box style="height:100px"><h1> <a href="{{ blog.url }}">{{ blog.name }}</a></h1></div>
                {% endif %}
				<article class="article">






				<h1>{{ post.headline }}</h1>

				<aside class="byline">
					Posted by {{ post.authors.splat('name')|join(', ') }} on
					{{ post.created|date('M d') }} at {{ post.created|date('g:ia') }}
				</aside>


                        {{ post.copy_formatted }}



                        {% for image in images %}
                        <a href="{{ image.url }}" rel="post" class="fancybox">
                            <img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" style="max-width:100%" />
                        </a>

                        <aside class="byline">
                            {{ metaRender.smCred(image) }}
                        </aside>
                        <div class="caption">
                            {{ image.caption_formatted }}
                        </div>

                        <hr class="spacer" />

                    {% endfor %}

                        {% if video.length or audio.length or slides.length or interactives.length or pdfs.length %}
                            <hr class="half hairline" />

                            {% for item in audio %}
                                <h5><i class="icon-music"></i> {{ item.title }}</h5>
                                {{ mediaRender.media(item) }}
                                <hr class="double hairline" />
                            {% endfor %}

                            {% for item in pdfs %}
                                <h5><i class="icon-file"></i> {{ item.title }}</h5>
                                <a class="offset" href="{{ item.urlOriginal }}">Download PDF</a>
                                <hr class="double hairline" />
                            {% endfor %}

                            {% for item in video %}
                                <h5><i class="icon-film"></i> {{ item.title }}</h5>
                                <a href="{{ item.urlDefault }}" class="offset">
                                    <img src="{{ item.urlPreview }}" />
                                </a>
                                <hr class="double hairline" />
                            {% endfor %}

                        {% endif %}

                    </div>
                </div>

				<hr class="double hairline" />

				<div class="well">
					Posted in <a href="{{ post.blog.url }}">{{ post.blog.name }}</a> on {{ post.created|date('F j, Y') }}

					{% if post.tags.length %}
						{% if limit %}Tagged {% endif %}

						{{ post.tags.splat('name').join(', ') }}
					{% endif %}
				</div>

			</article>
			{% if commentHelper.userHasSession() %}
					<a href="{{ post.getEditURL() }}" class="btn btn-danger" target="_gedit">EDIT THIS</a>
					<br /><br />
				{% endif %}
			{{ disqus.list(post) }}

		</div>

			{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

	</div>



{% endblock content %}
