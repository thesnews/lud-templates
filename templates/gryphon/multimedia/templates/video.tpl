{#gryphon/multimedia/templates/video.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: Multimedia{% endblock %}
{% block active %}multimedia{% endblock %}

{% block bodyClass %}multimedia{% endblock %}

{% block content %}
{% helper request %}


<div class="row">
	<div class="span8">
		<h1>
			Video
			<div class="subnav pull-right">
				<ul>
					<li><strong>More</strong></li>
					<li><a href="{{ 'multimedia/video'|url }}">Videos</a></li>
					<li><a href="{{ 'gallery'|url }}">Galleries</a></li>
					<li><a href="{{ 'multimedia/audio'|url }}">Audio</a></li>
				</ul>
			</div>
		</h1>
		
		<hr class="hairline hidden-phone" />
		
		<div class="pagination">
			<ul>
			{% for page in pagination %}
				{% if page.isCurrent %}
					<li class="disabled"><a href="#">{{ page.label }}</a></li>
				{% else %}
					<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
			{% endfor %}
			</ul>
		</div>
		
		<hr class="spacer" />
		
		{% for item in media %}
			<div class="row-fluid{% if loop.index%2 %} alt{% endif %}">
				<div class="span4">
					<a href="{{ item.urlDefault }}"><img src="{{ item.urlPreview }}" /></a>
				</div>
				<div class="span8">
					<div style="padding-right:10px;">
						<h3><a href="{{ item.urlDefault }}">{{ item.title }}</a></h3>
						<aside class="credit">
							{% if item.authors.length %}
								By {{ item.authors.splat('name')|join(', ') }}
							{% else %}
								&nbsp;
							{% endif %}
							<span class="pull-right">{{ item.created|timeSince }}</span>
						</aside>
						<p class="copy">{{ item.caption_formatted }}</p>
					</div>
				</div>
			</div>
			<hr class="spacer" />
		{% endfor %}

		<hr class="spacer" />
		
		<div class="pagination">
			<ul>
			{% for page in pagination %}
				{% if page.isCurrent %}
					<li class="disabled"><a href="#">{{ page.label }}</a></li>
				{% else %}
					<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
			{% endfor %}
			</ul>
		</div>
		
	</div> <!-- closes span8 -->
  {% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
		
</div>

<hr class="spacer" />

{% endblock content %}