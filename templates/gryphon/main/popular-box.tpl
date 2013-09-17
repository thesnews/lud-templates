{#gryphon/main/popular-box.tpl#}


{% helper disqusPopular as popular %}

<div id="popular-box">
	<header class="box">
	<h3>Most Popular</h3>
	</header>
	<div class="box">
		<div>
			<ul>
				{% for item in popular.threads|shift(5) %}
					{#{% if not 'lud.thesn'|in(item.link) %}#}
							<li>
								<ol>
									<li><h5><a href="{{ item.link }}">{{ item.title }}</a></h5></li>
									<li><h6>{{ item.posts|int2noun('comment') }}</h6></li>
								</ol>
							</li>
					{#{% endif %}#}
				{% endfor %}
			</ul>
		</div>
	</div>
</div>