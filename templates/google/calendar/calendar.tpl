{#google/calendar/calendar.tpl#}


{% helper calendar %}
{{ calendar.setTime(timestamp) }}


<h3 class="text-center calendar-header">
	<a href="{{ 'google:calendar'|url(['time': calendar.previousTime]) }}" class="prev"><i class="icon-chevron-left"></i></a>
	{{ calendar.name }}
	<a href="{{ 'google:calendar'|url(['time': calendar.nextTime]) }}" class="next"><i class="icon-chevron-right"></i></a>
</h3>

<hr class="double spacer" />

<table id="side-calendar" cellspacing="0">
	<tbody>

					<tr class="day">
					{% for day in ['Su', 'M', 'Tu', 'W', 'Th', 'F', 'Sa'] %}
						<th{% if loop.index0 == calendar.now|date('w') %} class="selected"{% endif %}>{{ day }}</th>
					{% endfor %}
					</tr>
					{% for week in calendar.weeks %}
						<tr{% if week.isCurrent() %} class="selected"{% endif %}>
						{% for day in week.days %}
							{% if day.isCurrentMonth() %}
								<td><a href="{{ 'google:calendar'|url(['time':day.time]) }}"{% if day.isCurrent() %} class="selected"{% endif %}>{{ day.date }}</a></td>
							{% else %}
								<td>&nbsp;</td>
							{% endif %}
						{% endfor %}
						</tr>
					{% endfor %}
				</tbody>
</table>

<hr class="double spacer" />

