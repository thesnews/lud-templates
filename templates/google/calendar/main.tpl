{#google/calendar/main.tp#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar{% endblock %}
{% block activeNav %}events{% endblock %}
{% block flag %}Events{% endblock %}

{% block content %}

<div class="row">
	<div class="span8 calendar-list">
		<h1>{% if timestamp %}Events for {{ timestamp|date('l, F d, Y') }}{% else %}Upcoming Events{% endif %}</h1>

		<hr class="double spacer" />

		{% if events.length %}
			{% for event in events %}

				<div class="row">

					<div class="span5">
						<h2><a href="{{ event.url }}">{{ event.title }}</a></h2>
					</div>
					<div class="span3 text-right">
						<h5><span class="small">
							{% if event.allDay %}
								All day
							{% elseif event.start_time == event.end_time %}
								{{ event.start_time|date('g:ia m/d/y') }}
							{% else %}
								{{ event.start_time|date('g:ia') }} - {{ event.end_time|date('g:ia m/d/y') }}
							{% endif %}
						</span></h5>
					</div>
				</div>

				<div class="row">
					<div class="span8">
						<p>{{ event.abstract }}</p>

						{% if event.location %}
							<hr class="spacer" />

							<p>{{ event.location }}</p>
						{% endif %}
					</div>
				</div>
				<hr />
			{% endfor %}

			<div class="pagination"><ul>
			{% if pagination.getPrevious() %}
				<li><a href="{{ pagination.getPrevious().url }}">&laquo;</a></li>
			{% endif %}
			{% for page in pagination.getPages() %}
				{% if page.isCurrent() %}
					<li class="active"><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% else %}
					<li><a href="{{ page.url }}">{{ page.label }}</a></li>
				{% endif %}
			{% endfor %}
			{% if pagination.getNext() %}
				<li><a href="{{ pagination.getNext().url }}">&raquo;</a></li>
			{% endif %}
			</ul>
			<div class="clear"></div></div>
		{% else %}
			<p>No events found for this day and/or category.</p>
		{% endif %}

		<div class="mb"></div>
	</div>

	{% include 'gryphon/main/sidebar/sidebar-calendar.tpl' %}


</div>

{% endblock content %}
