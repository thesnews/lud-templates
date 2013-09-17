{% helper disqusPopular as popular %}
<div class="box mb">
	<div class="ind">
		<h6>Popular Content</h6>

		<ul class="hat">
			{% for item in popular.threads|shift(5) %}
				<li><a href="{{ item.link }}">{{ item.title }}</a>&nbsp;<span class="aside2">| <strong>{{ item.posts|int2noun('comment') }}</strong></span></li>
			{% endfor %}
		</ul>
	</div>
</div>