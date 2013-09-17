{#gryphon/gallery/main.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}

{% block bodyClass %}multimedia{% endblock %}

{% block content %}
{% helper request %}

{% import "macros/render.tpl" as mediaRender %}

{% set topMedia = false %}

{% if request.getSegment(1) %}
	{% set topMedia = media.shift() %}
{% endif %}

<div class="row-fluid">
	<div class="span8">
		<h1 class="clearfix">
			{{ gallery.title }}
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

			<p class="copy">{{ gallery.description_formatted|default('Select a photo below to open the gallery') }}</p>

			<hr class="double spacer" />

		<ul class="pager">
			<li class="previous"><a href="{{ gallery.urlDefault }}/{{ previousImage.uid }}"><i class="icon-arrow-left"></i></a></li>
			<li class="next"><a href="{{ gallery.urlDefault }}/{{nextImage.uid}}"><i class="icon-arrow-right"></i></a></li>
		</ul>

		<div id="gallery_{{ gallery.uid }}">
			<div class="text-center">
				<img src="{{ image.url }}" class="grayborder" />
			</div>
				
				<hr class="double spacer" />
			
			<aside class="credit">
				{% if image.authors.length %}
					{{ image.authors.splat('name')|join(', ') }}
						/{% if image.source %}
							{{ image.source }}
						{% endif %}
				{% else %}
					&nbsp;
				{% endif %}



				<span class="pull-right">
					{{ image.created|timeSince }}
				</span>
			</aside>
			
			<p class="copy">
				{{ image.caption_formatted }}
			</p>
			
		</div>

		<ul class="unstyled gallery-list">
			{% for image in gallery.mediaOrdered %}
				<li><a href="{{ gallery.urlDefault }}/{{ image.uid }}" class="inline-gallery" rel="gallery_{{ gallery.uid }}"><img src="{{ image.urlPreview }}" /></a></li>
			{% endfor %}
		</ul>
		
			<hr class="double spacer clearfix" />
		<ul class="unstyled">
			 <li><a href="http://www.facebook.com/share.php?u={{ topMedia.urlDefault }}"><img src="{{ 'assets/dist/images/facebook_logo.png'|	asset}}"/></a></li>
    <li><a class="socialite twitter-share" href="http://twitter.com/share" data-url="{{ topMedia.urlDefault }}"><img src="{{ 'assets/dist/images/twitter-logo.png'|asset}}"/></a></li>
    <li><a href="mailto:?subject=Daily%20Gamecock:%20{{ topMedia.caption }}&body=Hi%20there.%20%20Check%20out%20this%20article%20from%20The%20Daily%20Gamecock:%20{{ topMedia.urlDefault }}" class="mail"><img src="{{ 'assets/dist/images/mail.png'|asset}}"/></a></li>
		</ul>

			<hr class="double spacer" />

		<div class="well">
			{{ disqus.list(gallery) }}
		</div>

	<hr class="double hairline" />

	

	</div> <!-- closes span8 -->

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
	

</div>

<hr class="spacer" />

{% endblock content %}
