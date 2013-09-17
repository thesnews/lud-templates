{#gryphon/multimedia/mm_carousel.tpl#}


{% if not tags %}
	{% fetch items from media with [
		'order': 'weight desc, created desc',
		'limit': 4,
		'withTags':['multimedia|multimedia_box'],
		'where': 'status = 1'
	] %}
{% else %}
	{% fetch items from media with [
		'order': 'weight desc, created desc',
		'limit': 4,
		'withTags': tags.splat('name'),
		'where': 'status = 1'
	] %}
{% endif %}



<div class="flexslider">
	<ul class="slides">
		{% for item in items %}
			<li data-thumb="{{ item.urlPreview }}">
		  		<a href="{{ item.urlDefault }}"><img src="{{ item.url }}" /></a>
		  		<p class="flex-caption">{{ item.title }}</p>
		  	</li>
		{% endfor %}
	</ul>
</div>
