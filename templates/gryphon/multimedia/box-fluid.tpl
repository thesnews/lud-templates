{#gryphon/multimedia/box-fluid.tpl#}


{% if not tags %}
	{% set tags = ['multimedia|multimedia_box'] %}
{% endif %}
{% fetch items from media with [
	'order': 'weight desc, created desc',
	'limit': 8,
	'withTags': tags,
	'where': 'status = 1'
] %}



<div class="multimedia-box hidden-phone" style="width:300px height:900px">
	 {% for item in items %}

	 	<div class="{% if 'box_square'|in(item.meta) %}bigsquare{% elseif 'box_horizontal'|in(item.meta) %}horizontal{% elseif 'box_vertical'|in(item.meta) %}vertical{% else %}square{% endif %}">
				<a href="{{ ('media/'~item.uid)|url(['t':1]) }}" data-image="{{ item.urlThumbnail }}" class="fancybox.ajax">{{ item.title }}</a>
 		</div>
 {% endfor %}
 
</div> <!-- end of multimedia gallery -->

<hr class="spacer" />
<a href="{{ 'multimedia'|url }}" id="morelink">More multimedia <i class="icon-chevron-right"></i></a>
