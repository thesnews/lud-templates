{#macros/article.tpl#}


{% macro centerpiece(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	{% import "macros/disqus.tpl" as disqus %}
	{% set images = article.media.grab('type', 'image') %}


	<article class="summarized-story main">
		{% if images.length %}
		<div class="row-fluid">
			<div class="span8">
				<figure>
					<a href="{{ article.url }}"><img src="{{ images[0].url }}" style="width:100%" /></a>


					<figcaption>
					{{ images[0].caption_formatted }}
					</figcaption>

				</figure>
			</div>

			<div class="span4">
				<h1><a href="{{article.url}}">{{article.headline}}</a></h1>
				<aside>
					<div class="author">
						{% if article.authors.length %}
						By: {{ article.authors.splat('name')|join(', ') }}
						{% endif %}
					</div>
					<div class="pubdate">
						{{ metaRender.dateLine(article.modified) }}
					</div>
					<hr class="spacer clearfix">
				</aside>

				{{ article.abstract_formatted }}

				<hr class="half spacer" />

				<a href="{{ article.url }}" class="btn btn-primary">Read More</a>
			</div>
		</div>

		{% else %}
				<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

				<div class="aside mmb">
					{% if article.authors.length %}
						<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}</span>
					{% endif %}
					<span class="pull-right">
					{{ metaRender.dateLine(article.modified) }}
					</span>
				</div>
				<div class="abstract"><p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read More</a></p></div>

		{% endif %}


		{#{% if article.multimedia.length %}
			<ul class="mmb">
				{% for media in article.multimedia %}
				{% if media.type != 'image' %}
					{% set iconPath = 'gfn-tarheel/assets/icons/' ~ media.type ~ '.png' %}<!--what's up with the tarheel?-->
					<li><img src="{{ iconPath|url }}" alt="" />&nbsp;&nbsp;<a href="{{ media.urlMultimedia }}">{{ media.title }}</a></li>
				{% endif %}
				{% endfor %}
			</ul>
		{% endif %}#}

	</article>
{% endmacro %}


{% macro centerpieceSection(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	{% import "macros/disqus.tpl" as disqus %}
	{% set images = article.media.grab('type', 'image') %}

	<article class="summarized-section-story">
		{% if images.length %}
			<figure>
				<a href="{{ article.url }}"><img src="{{ images[0].url }}" style="width:100%;" /></a>
				<figcaption><h1><a href="{{article.url}}">{{article.headline}}</a></h1></figcaption>
			</figure>

			{% if article.subhead %}
				<h3><a href="{{ article.url }}">{{ article.subhead }}</a></h3>
			{% endif %}

			<div class="well well-small">
				<aside>
					<div class="author">
						{% if article.authors.length %}
						By: {{ article.authors.splat('name')|join(', ') }}
						{% endif %}
					</div>
					<div class="pubdate">
						{{ metaRender.dateLine(article.modified) }}
					</div>
					<hr class="spacer clearfix">
				</aside>

				<div class="abstract">
					<p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read More</a></p>
				</div>
			</div>

		{% else %}
				<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

				<div class="aside mmb">
					{% if article.authors.length %}
						<span class="byline">BY: {{ article.authors.splat('name')|join(', ') }}</span>
					{% endif %}
					<span class="pull-right">
					{{ metaRender.dateLine(article.modified) }}
					</span>
				</div>
				<div class="abstract"><p>{{ article.abstract_formatted }} <a href="{{ article.url }}">Read More</a></p></div>

		{% endif %}


		{#{% if article.multimedia.length %}
			<ul class="mmb">
				{% for media in article.multimedia %}
				{% if media.type != 'image' %}
					{% set iconPath = 'gfn-tarheel/assets/icons/' ~ media.type ~ '.png' %}<!--what's up with the tarheel?-->
					<li><img src="{{ iconPath|url }}" alt="" />&nbsp;&nbsp;<a href="{{ media.urlMultimedia }}">{{ media.title }}</a></li>
				{% endif %}
				{% endfor %}
			</ul>
		{% endif %}#}

	</article>
{% endmacro %}

{% macro topSidebar(article) %}
	{% import "macros/meta.tpl" as metaRender %}

	<article class="summarized-story">
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		<aside>
				<div class="author">
					{% if article.authors.length %}
					By: {{ article.authors.splat('name')|join(', ') }}
					{% endif %}
				</div>
				<div class="pubdate">
					{{ metaRender.dateLine(article.modified) }}
				</div>
				<hr class="spacer clearfix">
		</aside>

		<div class="abstract"><p>{{ article.abstract_formatted|clip(250) }} &nbsp;<a href="{{ article.url }}">Read More</a></p></div>
	</article>
	<hr class="double spacer"/>
{% endmacro %}



{% macro spotlight(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	{% set topMedia = article.media.grab('type', 'image')[0] %}
	<article class="summarized-story">
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>
		<aside>
				<div class="author">
					{% if article.authors.length %}
					By: {{ article.authors.splat('name')|join(', ') }}
					{% endif %}
				</div>
				<div class="pubdate">
					{{ metaRender.dateLine(article.modified) }}
				</div>
				<hr class="spacer clearfix">
		</aside>
		
		{% if topMedia %}
			<div class ="pull-left">
				<a href="{{ article.url }}"><img src="{{ topMedia.urlPreview }}"  /></a>
			</div>
		{% endif %}

		<div class="abstract"><p>{{ article.abstract_formatted|clip(250) }} &nbsp;<a href="{{ article.url }}">Read More</a></p></div>
	</article>
	<hr class="double spacer"/>
{% endmacro %}



{#
{% macro secondary(article) %}
	{% import "macros/meta.tpl" as metaRender %}
	{% import "macros/disqus.tpl" as disqus %}
	{% set images = article.media.grab('type', 'image') %}

	<article class="summarized-story">

	<div class="row-fluid">
		{% if images.length %}

		<div class="span12">
				<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

				<aside>
					{% if article.authors.length %}
						<div class="author">
							By: {{ article.authors.splat('name')|join(', ') }}
						</div>
						<div class="pubdate">
							{{ metaRender.dateLine(article.modified) }}
						</div>
						<hr class="spacer clearfix">
					{% else %}
						<div class="text-right">
							{{ metaRender.dateLine(article.modified) }}
						</div>
					{% endif %}
				</aside>

			<div class="row-fluid">

				<div class="span4">
				<div style="width:100%; background-color:#cfcfcf;">
					<a href="{{ article.url }}"><img src="{{ images[0].urlPreview }}" class="article-img"  /></a>
				</div>
				</div>
				<div class="span8">
				<div class="abstract"><p>{{ article.abstract_formatted }}</p></div>
					<hr class="half spacer clearfix" />
					<hr class="spacer" />

				</div>
			</div><!-- /.row-fluid -->
		</div><!-- /.span12 -->
		{% else %}

		<div class="span12">
			<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

				<aside>
			{% if article.authors.length %}
				<div class="author">
					By: {{ article.authors.splat('name')|join(', ') }}
				</div>
				<div class="pubdate">
					{{ metaRender.dateLine(article.modified) }}
				</div>
				<hr class="spacer clearfix">
			{% else %}
				<div class="text-right">
					{{ metaRender.dateLine(article.modified) }}
				</div>
			{% endif %}
		</aside>

				<div class="abstract"><p>{{ article.abstract_formatted }}</p></div>
				<hr class="half spacer clearfix" />
						</div>
		{% endif %}
		</div>
	</article>

{% endmacro %}



{% macro sidebar(article) %}
	{% import "macros/meta.tpl" as metaRender %}

	<article class="summarized-story">
		<h3><a href="{{ article.url }}">{{ article.headline }}</a></h3>

		<aside>
			{% if article.authors.length %}
				<div class="author">
					By: {{ article.authors.splat('name')|join(', ') }}
				</div>
				<div class="pubdate">
					{{ metaRender.dateLine(article.modified) }}
				</div>
				<hr class="spacer clearfix">
			{% else %}
				<div class="text-right">
					{{ metaRender.dateLine(article.modified) }}
				</div>
			{% endif %}
		</aside>

	</article>
	<hr class="double spacer"/>
{% endmacro %}#}




