{#gryphon/section/modules/news.tpl#}

<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['campus']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/campus'|url }}"><h3>Campus</h3></a></header>
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
						'withTags': ['city']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/city'|url }}"><h3>City</h3></a></header>
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
						'withTags': ['online'],
						'limit': 3
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/online'|url }}"><h3>Online</h3></a></header>
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

