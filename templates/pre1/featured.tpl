{#pre1/featured.tpl#}


<header class="box">
	<h3><a href="{{ 'pre1:main'|url }}">Featured Classifieds</a></h3>
</header>

<div class="box sidebar-bg">

	<hr class="spacer" />

	<div class="text-center">
	{% include 'gryphon/ads/classifiedsponsor.tpl' %}
	</div>

	<hr class="spacer" />

	{% fetch items from pre1:ad with [
		'where': 'status = 1',
		'order': 'category_id'
	] %}

	{% set category = items[0].category %}
	In <a href="{{ category.url }}">{{ category.name }}</a>:
	<ul>
	{% for item in items %}
		{% if item.category_id != category.uid %}
			{% set category = item.category %}
			</ul>
				<hr class="half spacer" />
				<p class="classifiedsbackground"> In <a href="{{ category.url }}">{{ category.name }}</a>:</p>
			<ul>
		{% endif %}
		<li style="margin-bottom:10px;"><a href="{{ item.url }}" style="font-size:13px;">{{ item.preview }}</a></li>
	{% endfor %}
	</ul>


	<a href="{{ 'classified'|url }}">See all classifieds</a>
</div>

