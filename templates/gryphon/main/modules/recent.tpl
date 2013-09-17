{% import "macros/meta.tpl" as metaRender %}
{% helper disqusPopular as popular %}
<div class="box mb tabbed">
	<ul class="tabheader">
		<li><a style="color:#626A6F;text-decoration:none;">RECENT:</a></li>
		<li><a href="#tab-articles">Articles</a></li>
		<li><a href="#tab-posts">Blog Posts</a></li>
		<li><a href="#tab-comments">Comments</a></li>
	</ul>
	<div class="clear mb"></div>

	<div id="tab-articles" class="ui-tabs-hide">
		<ul class="ind hat">
			{% fetch recarticles from article with [
				'limit': 5,
				'order': 'created desc',
				'where': 'status = 1'
			] %}
			{% for article in recarticles %}
				<li><a href="{{ article.url }}">{{ article.headline_formatted }}</a> <span class="sm dateline">| </span>{{ metaRender.dateLine(article.modified) }}</li>
			{% endfor %}
		</ul>
	</div>

	<div id="tab-posts" class="ui-tabs-hide">
		<ul class="ind hat">
			{% fetch posts from blogPost with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 5
			] %}
			{% for post in posts %}
				<li><a href="{{ post.url }}">{{ post.headline }}</a> <span class="sm dateline">| </span>{{ metaRender.dateLine(post.modified) }}
				<br /><span class="aside2"><strong>Posted in</strong>: <a href="{{ post.blog.url }}">{{ post.blog.name }}</a></span></li>
			{% endfor %}
		</ul>
	</div>

	<div id="tab-comments" class="ui-tabs-hide">
		<ul class="ind hat">
			{% for item in popular.recent|shift(5) %}
				<li><strong>{{ item.author.name }}</strong> on <a href="{{ item.thread.link }}">{{ item.thread.title }}</a></li>
			{% endfor %}
		</ul>
	</div>
</div>