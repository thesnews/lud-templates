{#macros/comment.tpl#}


{% macro list(item) %}

	{% helper commentHelper %}
	{% set comments = commentHelper.commentsFor(item) %}
	{% set showAdmin = commentHelper.userHasSession() %}

	{% for comment in comments %}
	<div id="comment{{ comment.uid }}"{% if not comment.status %} style="background:#ededed;"{% endif %}>
	<hr class="mb" />
	<div class="grid_3 alpha">
		<div class="comment_meta">
			<strong>{{ comment.name }}</strong>
			<div class="caption mmb"><strong>{{ comment.created|date('F j, Y') }}</strong> at {{ comment.created|date('g:i A') }}<br />
			{% if not comment.status %}
				<strong class="attn">Comment Removed</strong>
			{% else %}
				<a href="{{ ('comment/flag/'~comment.hash)|url }}">Flag this comment</a><br />
			{% endif %}
			{% if showAdmin %}
				<a href="{{ comment.getEditURL() }}"><strong>Moderate</strong></a>
			{% endif %}
			</div>
		</div>
	</div>
	
	<div class="grid_5 omega">
		<div class="comment_item">
			{{ comment.comment_formatted|extract(2) }}
			
			{% if comment.comment_formatted|extract(null, 2)|striptags %}
				<p><a href="#" class="readmore">Read more &#133;</a></p>
				<div class="comment_more">
					{{ comment.comment_formatted|extract(null, 2) }}
				</div>
			{% endif %}
			
			{% if showAdmin %}
				<div class="aside alert mmb">
					{% if comment.flagged > 0 %}
						<span class="attn">Flagged: {{ comment.flagged|int2noun('time') }}</span> |
					{% endif %}
					{{ comment.email }} | {{ comment.ip }}
				</div>
			{% endif %}
		</div>
	</div>
	<div class="clear"></div>
	</div>
	{% endfor %}
{% endmacro %}

{% macro pagers(item) %}

	{% helper commentHelper %}
	{% set pages = commentHelper.pagesFor(item) %}
	
	{% if pages %}
		<div class="pagination"><ul>
		{% for label, url in pages %}
			{% if label == 'Next' %}
				{% set label = '&raquo;' %}
			{% elseif label == 'Previous' %}
				{% set label = '&laquo;' %}
			{% endif %}
			<li><a href="{{ url }}">{{ label }}</a></li>
		{% endfor %}
		</ul></div>
	{% endif %}

{% endmacro %}