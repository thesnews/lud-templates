{#gryphon/main/ticker.tpl#}


{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}


<div id="header-ticker">
	<div class="row-fluid">
		<div class="span8">
			<strong>Don't Miss</strong>
			<ul>
			{% fetch recarticles from article with [
				'limit': 5,
				'order': 'created desc',
				'where': 'status = 1',
				'withTags': ['ticker']
			] %}
			{% for article in recarticles %}
				<li><a href="{{ article.url }}">{{ article.headline_formatted }}</a> <span class="sm dateline">| </span>{{ metaRender.dateLine(article.modified) }}</li>
			{% endfor %}
		</ul>
	</div>
	
	</div>
</div>
