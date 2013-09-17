{#gryphon/section/modules/ae.tpl#}


{% block activeNav %}ae{% endblock %}
<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['ae']
					] %}
					<div class="rundown-box span6">
						<header class="box"><a href="{{ 'section/ae'|url }}"><h3>Arts & Theatre</h3></a></header>
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
						'withTags': ['music']
					] %}
					<div class="rundown-box span6">
						<header class="box"><a href="{{ 'section/music'|url }}"><h3>Music</h3></a></header>
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
					
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'where': 'status = 1',						
						'withTags': ['movies'],
						'limit': 3
					] %}
					<div class="rundown-box span6">
						<header class="box"><a href="{{ 'section/movies'|url }}"><h3>Movies</h3></a></header>
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
						'where': 'status = 1',						
						'withTags': ['food'],
						'limit': 3
					] %}
					<div class="rundown-box span6">
						<header class="box"><a href="{{ 'section/food'|url }}"><h3>Food</h3></a></header>
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

