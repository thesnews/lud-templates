<!--gryphon/multimedia/landing.tpl-->


<div class="row-fluid">
	{% for item in media.shift(4) %}
		{% if loop.index%2 %}
			</div>
			<hr class="spacer clearfix" />
			<div class="row-fluid">
		{% endif %}
		<div class="span6">

			<div class="photo-wrap" style="height: 200px;">
			{% if item.type =="audio" %}
					<a href="{{ item.urlDefault }}">
						<img src="{{ 'assets/dist/images/audio-icon.png' | asset }}"  style="max-height:185px;"/>
					</a>
				{% else %}
					<a href="{% if item.gallery %}{{ item.gallery.urlDefault }}{% else %}{{ item.urlDefault }}{% endif %}">
						<img src="{{ item.urlPreview }}"  style="max-height:185px;"/>
					</a>
				{% endif %}
			</div>
			<h4><a href="{{ item.urlDefault }}">{{ item.fileType|capitalize }}: {{ item.title }}</a></h4>

			<hr class="half spacer" />
			<aside class="credit">
				{% if item.authors.length %}
					{% set author = item.authors.shift() %}
						by <a href="{{ author.url }}">{{ author.name }}</a>
						{% for author in item.authors %}
							and <a href="{{author.url}}">{{author.name}}</a>
						{% endfor %}
				{% else %}
					&nbsp;
				{% endif %}
				<span class="pull-right">
					{{ item.created|timeSince }}
				</span>
			</aside>
			
			<hr class="half spacer" />
			
		</div>
	{% endfor %}
</div>

<hr class="double hairline clearfix" />

{% include 'gryphon/multimedia/more.tpl' %}

<hr class="spacer double" />
