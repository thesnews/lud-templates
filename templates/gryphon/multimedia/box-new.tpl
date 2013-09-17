{#gryphon/multimedia/box-new.tpl#}


{% if not tags %}
	{% set tags = ['multimedia|multimedia_box'] %}
{% endif %}
{% fetch items from media with [
	'order': 'weight desc, created desc',
	'limit': 8,
	'withTags': tags,
	'where': 'status = 1'
] %}


<h2>Multimedia <span class="smaller pull-right" style="font-size:12px;"><a href="{{ 'multimedia'|url }}">More multimedia <i class="icon-chevron-right"></i></a></h2>

<div class="multimedia-box hidden-phone">

	{#{% for item in items %}
 		<div class="{% if 'box_square'|in(item.meta) %}bigsquare{% elseif 'box_horizontal'|in(item.meta) %}horizontal{% elseif 'box_vertical'|in(item.meta) %}vertical{% else %}square{% endif %}">
			<a href="{{ ('media/'~item.uid)|url(['t':1]) }}" data-image="{{ item.urlThumbnail }}" class="fancybox.ajax">{{ item.title }}</a>
 		</div>
 	{% endfor %}#}
</div> <!-- end of multimedia gallery -->
