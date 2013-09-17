{#gryphon/section/modules/sports.tpl#}


<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['baseball']
					] %}
					<div class="rundown-box span4">
				
						<header class="box"><a href="{{ 'section/baseball'|url }}"><h3>Baseball</h3></a></header>
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
						'withTags': ['softball']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/softball'|url }}"><h3>Softball</h3></a></header>
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
						'withTags': ['basketball'],
						'limit': 3
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/basketball'|url }}"><h3>Basketball</h3></a></header>
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
			

		<hr class="double spacer" />

	
				<div class="row-fluid">
					{% fetch rundown from article with [
						'order': 'weight desc, created desc',
						'limit': '3',
						'where': 'status = 1',
						'withTags': ['football']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/football'|url }}"><h3>Football</h3></a></header>
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
						'withTags': ['soccer']
					] %}
					<div class="rundown-box span4">
						<header class="box"><a href="{{ 'section/soccer'|url }}"><h3>Soccer</h3></a></header>
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