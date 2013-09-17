{#gryphon/main/recent-box.tpl#}


{% helper disqusPopular as popular %}

<div id="popular-box">
	<header class="box">
	<h3>Recent Comments</h3>
	</header>
	<div class="box">
		<div>
			<ul>
					{% for item in popular.posts|shift(5) %}
						<li>{{ item.author.name }} said: <p class="copy" style="margin:0;padding:0;">{{ item.raw_message|clip(50) }}</p><div class="smaller">on <a href="{{ item.thread.link }}">{{ item.thread.title }}</a></div><hr class="spacer" /></li>
					{% endfor %}

			</ul>
		</div>
	</div>
</div>