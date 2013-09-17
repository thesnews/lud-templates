{#gryphon/main/disqus-box.tpl#}


{% helper disqusPopular as popular %}

<div class="accordion" id="popular-box">
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#popular-box" href="#collapseOne">
				<i class="icon-white icon-plus"></i> Popular
			</a>
		</div>
		<div id="collapseOne" class="accordion-body collapse in">
			<div class="accordion-inner smaller">
				<ul>
					{% for item in popular.threads|shift(5) %}
						{% if not 'tdg.thesn'|in(item.link) %}
							<li><a href="{{ item.link }}">{{ item.title }}</a>&nbsp;<span class="aside2">| <strong>{{ item.posts|int2noun('comment') }}</strong></span></li>
						{% endif %}
					{% endfor %}
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
			<a class="accordion-toggle" data-toggle="collapse" data-parent="#popular-box" href="#collapseTwo">
				<i class="icon-white icon-plus"></i> Recent Comments
			</a>
		</div>
		<div id="collapseTwo" class="accordion-body collapse">
			<div class="accordion-inner smaller">
				<ul>
					{% for item in popular.posts|shift(5) %}
						<li>{{ item.author.name }} said: <p class="copy" style="margin:0;padding:0;">{{ item.raw_message|clip(50) }}</p><div class="smaller">on <a href="{{ item.thread.link }}">{{ item.thread.title }}</a></div><hr class="spacer" /></li>
					{% endfor %}
				</ul>
			</div>
		</div>
	</div>
</div>
