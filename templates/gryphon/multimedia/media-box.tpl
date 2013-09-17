{#gryphon/multimedia/media-box.tpl#}


{% if not tags %}
	{% set tags = ['multimedia|multimedia_box'] %}
{% endif %}
{% fetch items from media with [
	'order': 'weight desc, created desc',
	'limit': 8,
	'withTags': tags,
	'where': 'status = 1'
] %}

<div class="row-fluid">
	<div class="span12">
		<h2 class="frontheading pull-left">Multimedia</h2>
		<a href="" class="pull-right">More Multimedia <i class="icon-chevron-right"></i></a>
		<hr class="double spacer clearfix">
		<div id="media-box">
			{% for item in items %}
		 		<div class="{% if 'box_square'|in(item.meta) %}bigsquare{% elseif 'box_horizontal'|in(item.meta) %}horizontal{% elseif 'box_vertical'|in(item.meta) %}vertical{% else %}square{% endif %}">
					<a href="{{ item.url }}"><img src="{{ item.url }}"/></a>
		 		</div>
		 	{% endfor %}
		</div>
	</div>
</div>