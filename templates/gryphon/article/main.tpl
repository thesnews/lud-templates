{#gryphon/article/main.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ article.headline }}{% endblock %}

{% block description %}{{ article.abstract_formatted|striptags }}{% endblock %}

{% block activeNav %}{{ active }}{% endblock %}

{% block styles %}
{% endblock %}

{% block scripts %}
{% endblock %}

{% block links %}
<link rel="canonical" type="text/html" href="{{ article.url }}" />
<link rel="alternate shorter" type="text/html" href="{{ shortUrl }}" />
{% endblock %}

{% block content %}
{% helper commentHelper %}
{% import "macros/meta.tpl" as metaRender %}
{% import "macros/article.tpl" as articleRender %}
{% import "macros/render.tpl" as render %}
{% import "macros/disqus.tpl" as disqus %}

{% set mugShots = article.media.grab('meta', 'mugshot', true) %}
{% set gallerykeys = article.media.grab('meta', 'gallery key', true) %}
{% set images = article.media.grab('type', 'image', true) %}

{% set video = article.media.grab('type', 'video', true) %}
{% set audio = article.media.grab('type', 'audio', true) %}
{% set slides = article.media.grab('type', 'soundSlide', true) %}
{% set interactives = article.media.grab('type', 'flash', true) %}
{% set pdfs = article.media.grab('type', 'pdf', true) %}

{% set sections = article.sections %}


<!-- MAIN CONTENT -->
<div class="row">
	<div class="span8">
				<hr class="spacer"/>
		<article class="complete-story">

			{% if commentHelper.userHasSession() %}
				<a href="{{ article.getEditURL() }}" class="btn btn-danger" target="_gedit">EDIT THIS</a>
				<hr class="spacer" />
			{% endif %}
			{% include "gryphon/ads/mobile_article.tpl" %}
			<hr class="spacer hidden-desktop" />

			<h2>{{ article.headline }}</h2>

			<hr class="spacer" />

			{% if article.subhead %}
				<h4>{{ article.subhead }}</h4>
				<hr class="spacer" />
			{% endif %}

			<!-- AUTHOR BI-LINE -->

			<aside>
				{% if article.authors.length %}
					{% set author = article.authors.shift() %}
						By <a href="{{ author.url }}">{{ author.name }}</a>
						{% for author in article.authors %}
							and <a href="{{ author.url }}">{{ author.name }}</a>
						{% endfor %}
				{% endif %}
				<span id="publish">
				| Published {{ article.created|timeSince }}


				{% if article.created != article.modified %}
   					| Updated {{ article.modified|timeSince }}
				{% endif %}
				</span>
				<hr class="spacer" />
			</aside>
			<!-- Only FEATURE PHOTO -->
			<!-- FEATURE PHOTO -->

			<div>
				{% if images.length %}
					{% set domPhoto = images.shift() %}
					<a href="{{ domPhoto.url }}" class="fancybox-single main-photo" rel="article_{{ article.uid }}">
							<img src="{{ domPhoto.urlOriginal }}" alt="{{ domPhoto.base_name }}" />
					</a>
					{% if domPhoto.authors.length or domPhoto.caption_formatted.length %}
					<figcaption>
						{% if domPhoto.authors.length %}
							<div class="row-fluid">
								<div class="span12">
									<span id="photocredit" class="pull-left">
										{% set credit = domPhoto.authors.shift() %}
											by <a href="{{ credit.url }}">{{ credit.name }}</a>
											{% for credit in domPhoto.authors %}
												and <a href="{{credit.url}}">{{credit.name}}</a>
											{% endfor %}

										{% if domPhoto.source %}
											/ {{ domPhoto.source }}
										{% endif %}
									</span>
								</div>
							</div>
						{% endif %}
						{{ domPhoto.caption_formatted }}
					</figcaption>
					{% endif %}
				{% endif %}
			</div>

			<hr class="double spacer" />

			{% macro countlink(item) %}
			<a href="{{ item.url }}#disqus_thread" data-disqus-identifier="{{ item.uuid }}">{{ item.name }}</a>
			{% endmacro %}

			<hr class="spacer" />
			<hr class="hairline clearfix" />

			{% if mugShots.length %}
				{% for mug in mugShots %}
					<div class="pull-left">
						<div class="mugshots">
							<img src="{{ mug.urlPreview }}" alt="{{ mug.caption }}" />
							{{ mug.caption_formatted }}
						</div>
					</div>
				{% endfor %}
			{% endif %}
			<hr class="spacer" />

			<div class="row-fluid">
				<div class="span3">
					<a href="https://twitter.com/share" class="twitter-share-button" data-via="flamesdaily" style="pull-left" margin="20">Tweet</a>
					<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
				</div>
				<div class="span3">
					<!-- Place this tag where you want the +1 button to render. -->
					<div class="g-plusone" data-size="medium" data-annotation="inline" data-width="120"></div>

					<!-- Place this tag after the last +1 button tag. -->
					<script type="text/javascript">
					  (function() {
					    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
					    po.src = 'https://apis.google.com/js/plusone.js';
					    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
					  })();
					</script>
				</div>
				<div class="span3">
					<div class="fb-like" data-width="120" data-layout="button_count" data-show-faces="false" data-send="false"></div>
				</div>
				<div class="span3">
					<a href="#comments"><img src="http://cdn.thesn.net/assets/dist/img/comment.png" alt="comment" />{{ disqus.countLink(article) }}</a>
				</div>
			</div>

			<hr class="spacer" />

			<span id="first-paragraph">
				{{ article.copy_formatted|extract(1) }}
			</span>
			{{ article.copy_formatted|extract(2,1) }}

			{% if article.infobox or pdfs.length %}
			<div class="info-box bg pull-right">
				<div class="highlight">
					{% if article.infobox %}
						{{ article.infobox_formatted }}
					{% endif %}
					{% if pdfs.length %}
						{% if article.infobox %}
							<hr class="spacer" />
						{% endif %}

						{% if pdfs.length %}
							<h5>Related Documents:</h5>
							<ul>
								{% for pdf in pdfs %}
									<li><a href="{{ pdf.urlOriginal }}"><i class="icon-book"></i> {{ pdf.title }}</a> - PDF</li>
								{% endfor %}
							</ul>
						{% endif %}
					{% endif %}
				</div>
			</div>
			{% endif %}

			{% if images.length or gallery.length or video.length or sound.length or pdfs.length or flash.length or domPhoto.gallery %}
				<div class="integrated-media-left">
					{% if domPhoto and domPhoto.gallery %}
						<div class="gallery">
							<img src="{{ domPhoto.urlPreview }}" alt="{{ domPhoto.base_name }}" class="preview" />
							<a href="{{ domPhoto.gallery.urlDefault }}" class="gall_link">View Full Gallery</a>
							<figcaption><i class="icon-th"></i> {{ domPhoto.gallery.title }}</figcaption>
						</div>
					{% endif %}

					{% for image in images %}
						{% if image.gallery %}
							<div class="gallery">
								<img src="{{ image.urlPreview }}" alt="{{ image.base_name }}" class="preview" />
								<a href="{{ image.gallery.urlDefault }}" class="gall_link">View Full Gallery</a>
								<figcaption><i class="icon-th"></i> {{ image.gallery.title }}</figcaption>
							</div>
						{% else %}
							<div class="image">
								<a href="{{ image.url }}" class="fancybox-single" rel="article_{{ article.uid }}"><img src="{{ image.urlPreview }}"
								title="![CDATA[{{ image.caption }}]]"alt="{{ image.base_name }}" /></a>
								<figcaption><i class="icon-camera"></i> {{ image.caption }}</figcaption>
							</div>
						{% endif %}
					{% endfor %}

					{% for gallery in galleries %}

						<div class="gallery">
							<img src="{{ gallery.urlPreview }}" alt="{{ gallery.base_name }}" class="preview" />
							<a href="{{ gallery.gallery.urlDefault }}">View Full Gallery</a>
							<figcaption><i class="icon-th"></i> {{ gallery.gallery.title }}</figcaption>
						</div>

					{% endfor %}



					{% for video in videos %}

						<div class="video">
							<a href="{{ ('media/'~video.uid)|url }}" class="fancybox.ajax"><img src="{{ video.urlPreview }}" alt="{{ video.base_name }}" class="preview" /></a>
								<p>Video: {{ video.title|clip() }}</p>
						</div>

					{% endfor %}

					{% for item in flash %}

						{% if item.meta['flashembed'] %}
							<div class="flash">
								<a href="{{ item.urlDefault }}"><img src="{{ item.urlPreview }}" alt="{{ item.base_name }}" class="preview" /></a>
									<p>Interactive: {{ item.title|clip() }}</p>
							</div>

						{% endif %}

					{% endfor %}

					{% for sound in sounds %}

						<div class="audio">
							<div class="box">
							<i class="icon-volume-up"></i> {{ sound.title }}
							<audio src="{{ sound.urlOriginal }}" preload="auto" />
							</div>
						</div>

					{% endfor %}
				</div>
			{% endif %}

			{% if article.pull_quote.length %}
				<div class="pull-quote">
					{{ article.pull_quote }}
				</div>
			{% endif %}

			{{ article.copy_formatted|extract(null, 3) }}
      {%include 'gryphon/ads/in_article.tpl' %}

			<hr class="hairline" />

			<div class="row-fluid clearfix">
				<div class="span12">
					<div id="comments">
						{{ disqus.list(article) }}
					</div>
				</div>
			</div>

			<hr class="double spacer" />

			<div class="related-stories">
				<div class="row-fluid">
					<div class="span12">
						<h1>RELATED STORIES</h1>
						<div class="arrow-down"></div>
						<hr class="hairline" />
					</div>
				</div>
				<div class="row-fluid">
					{% set related = article.getRelated() %}
					<div class="span12">
						{% for item in related.shift(3) %}
							<div class="related clearfix">
								{% if item.media.length %}
									{% set img = item.media.grab('type', 'image')[0] %}
									<span id="related-image">
										<a href="{{ item.url }}"><img src="{{ img.urlThumbnail }}" /></a>
									</span>
								{% endif %}
								<h3><a href="{{ item.url }}">{{ item.headline }}</a></h3>
								<aside>
									{% if item.authors.length %}
										{% set author = item.authors.shift() %}
											by <a href="{{ author.url }}">{{ author.name }}</a>
											{% for author in item.authors %}
												and <a href="{{ author.url }}">{{ author.name }}</a>
											{% endfor %} |
									{% endif %}
									<span id="publish">
										 Published {{ item.created|timeSince }}
									</span>
								</aside>
							<hr class="hairline clearfix" />
							</div>
							<hr class="hairline" />
						{% endfor %}
					</div>
				</div>
			</div>
		</article>
	</div>
	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
</div>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=664382600257297";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
{% endblock content %}
