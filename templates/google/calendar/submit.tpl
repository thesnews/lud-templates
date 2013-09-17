{#google/calendar/submit.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: Event Calendar : Submit{% endblock %}
{% block activeNav %}events{% endblock %}

{% block content %}
<div class="row">
	<div class="span8">
		<header>
			<h1>Submit an event listing</h1>
			<ul class="breadcrumb">
				<li><a href="{{ 'google:calendar'|url }}">Calendar</a><span class="divider">/</span></li>
				<li>Submit</li>
			</ul>
		</header>

		<div class="mmb"> </div>


			{% if error %}
				<ul class="error mb">
				{% for item in error %}
					<li>{{ item }}</li>
				{% endfor %}
				</ul>
				<hr class="mb" />
			{% elseif success %}
				<p><strong class="alert">Thanks!</strong></p>

				<p>This event will be reviewed for addition to the Event Calendar.</p>
				<hr class="mb" />
			{% endif %}

			<p>Submit your event listings using the form below. Events will be held for approval by an administrator before appearing on the site.</p>

			<p>If you have a big list of events you'd like considered, or to provide an iCal-formatted feed for us to import, please <a href="{{ 'page/about_us'|url }}">contact us</a> for more information.</p>

		<form method="post" action="{{ 'google:calendar/submit'|url }}" class="well" id="form_eventSubmit">
			<fieldset>
				<legend>Event Details</legend>
				<label for="title">Event title</label></th>
				<input type="text" name="title" size="30" placeholder="Name of Event" value="{{ posted.title }}" />

				<label for="start">Start date</label>
				<input name="start" type="text" size="12" id="input_dateStart" placeholder="mm/dd/yyyy" value="{{ posted.start }}" />

				<label for="end">End date</label>
				<input name="end" type="text" size="12" id="input_dateEnd" placeholder="mm/dd/yyyy" class="full" value="{{ posted.end }}" />

				<label for="starttime">Start time</label>
				<select name="startHour">
					<option value="false"></option>
					{% for i in 1..12 %}
						<option value="{{ i }}"{% if i == posted.startHour %} selected="selected"{% endif %}>{{ i }}</option>
					{% endfor %}
				</select>
				:
				<select name="startMinute">
					<option value="false"></option>
					<option value="00">00</option>
					<option value="15"{% if posted.startMinute == 15 %} selected="selected"{% endif %}>15</option>
					<option value="30"{% if posted.startMinute == 30 %} selected="selected"{% endif %}>30</option>
					<option value="45"{% if posted.startMinute == 45 %} selected="selected"{% endif %}>45</option>
				</select>
				<select name="startAP">
					<option value="false"></option>
					<option value="a"{% if posted.startAP == 'a' %} selected="selected"{% endif %}>am</option>
					<option value="p"{% if posted.AP == 'p' %} selected="selected"{% endif %}>pm</option>
				</select>

				<label for="endtime">End time</label>
				<select name="endHour">
					<option value="false"></option>
					{% for i in 1..12 %}
						<option value="{{ i }}">{{ i }}</option>
					{% endfor %}
				</select>
				:
				<select name="endMinute">
					<option value="false"></option>
					<option value="00">00</option>
					<option value="15"{% if posted.endMinute == 15 %} selected="selected"{% endif %}>15</option>
					<option value="30"{% if posted.endMinute == 30 %} selected="selected"{% endif %}>30</option>
					<option value="45"{% if posted.endMinute == 45 %} selected="selected"{% endif %}>45</option>
				</select>
				<select name="endAP">
					<option value="false"></option>
					<option value="a"{% if posted.endAP == 'a' %} selected="selected"{% endif %}>am</option>
					<option value="p"{% if posted.endAP == 'p' %} selected="selected"{% endif %}>pm</option>
				</select>

				<label for="description">Description</label>
				<textarea name="description" cols="50" rows="5">{{ posted.description }}</textarea>
				<p>Tell us about it. Does it repeat? How often?</p>

				<label for="location">Location</label>
				<textarea name="location" cols="50" rows="5">{{ posted.location }}</textarea>
				<p>Include the address if possible.</p>

				<legend>Submit Event</legend>
				 <em><span class="required">*</span>These fields are required, but will not be published.</em>

				<label for="sendername"><span class="required">*</span>Name(won't be published)</label></th>
				<input type="text" name="sendername" size="30" value="{{ posted.sendername }}" />

				<label for="senderemail"><span class="required">*</span>Email(won't be published)</label>
				<input type="text" name="senderemail" size="30" value="{{ posted.senderemail }}" />

				<label for="answer"><span class="required">*</span>Verification</label>
				<script type="text/javascript">
					var RecaptchaOptions = {
						theme : 'white'
					};
				</script>
				{% if turing %}
					{{ turing }}
				{% endif %}

				<button class="btn btn-primary pull-right" type="submit" value="Submit">Submit</button>

			</fieldset>
		</form>
	</div>

	{% include 'gryphon/main/sidebar/sidebar-calendar.tpl' %}
</div>
{% endblock content %}
