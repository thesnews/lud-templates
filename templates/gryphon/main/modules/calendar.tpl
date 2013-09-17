{% set todayStart = 'today 12:00am'|date('U') %}
{% set todayEnd = 'today 12:00am +1 day'|date('U') %}

{% set day2Start = todayEnd %}
{% set day2End = 'today 12:00am +2 days'|date('U') %}

{% set day3Start = day2End %}
{% set day3End = 'today 12:00am +3 days'|date('U') %}

<header class="box">
	<h3 class = "calendar-head" ><a href ="{{ 'google:calendar'|url }}">Calendar:</a></h3>
</header>
<div class="box sidebar-bg">
	<div class="tabbable">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#day1" data-toggle="tab">Today</a></li>
			<li><a href="#day2" data-toggle="tab">Tomorrow</a></li>
			<li><a href="#day3" data-toggle="tab">{{ day3Start|date('D') }}</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="day1">
				<ul class="unstyled">
					{% fetch todayEvents from google:calendarEvent with [
						'limit': 3,
						'order': 'start_time asc, created desc',
						'where': 'status = 1 AND start_time > ' ~ todayStart ~ ' AND start_time < ' ~ todayEnd
					] %}
					{% if todayEvents.length %}
						{% for event in todayEvents %}
							<li>
								<h4><a href="{{ event.url }}">{{ event.title }}</a></h4>
								<p>{% if event.allDay %}All day{% else %}{{ event.start_time|date('g:i a') }}{% endif %} {{ event.description|clip(20) }}</p>
							</li>
						{% endfor %}
					{% else %}
						<li>
							<p>No events for today</p>
						</li>
					{% endif %}
				</ul>
			</div>
			<div class="tab-pane" id="day2">
				<ul class="unstyled">
					{% fetch events from google:calendarEvent with [
						'limit': 3,
						'order': 'start_time asc, created desc',
						'where': 'status = 1 AND start_time > ' ~ day2Start ~ ' AND start_time < ' ~ day2End
					] %}
					{% if events.length %}
						{% for event in events %}
							<li>
								<h4><a href="{{ event.url }}">{{ event.title }}</a></h4>
								<p>{% if event.allDay %}All day{% else %}{{ event.start_time|date('g:i a') }}{% endif %} {{ event.description|clip(20) }}</p>
							</li>
						{% endfor %}
					{% else %}
						<li>
							<p>No events for tomorrow</p>
						</li>
					{% endif %}
				</ul>
			</div>
			<div class="tab-pane" id="day3">
				<ul class="unstyled">
					{% fetch events from google:calendarEvent with [
						'limit': 3,
						'order': 'start_time asc, created desc',
						'where': 'status = 1 AND start_time > ' ~ day3Start ~ ' AND start_time < ' ~ day3End
					] %}
					{% if events.length %}
						{% for event in events %}
							<li>
								<h4><a href="{{ event.url }}">{{ event.title }}</a></h4>
								<p>{% if event.allDay %}All day{% else %}{{ event.start_time|date('g:i a') }}{% endif %} {{ event.description|clip(20) }}</p>
							</li>
						{% endfor %}
					{% else %}
						<li>
							<p>No events for {{ day3Start|date('D') }}</p>
						</li>
					{% endif %}
				</ul>
			</div>
		</div>
	</div>
</div>
