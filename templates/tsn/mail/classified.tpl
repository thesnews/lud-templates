{#tsn/mail/classified.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: Classified Ad Request {% endblock %}
{% block active %}opinion{% endblock %}
{% block subActive %}Opinion{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}

<div class="row">
	<div class="span8" >

		<h1>Classified ad request</h1>

		<hr class="hairline" />

		{% if status == 'error' %}
			<div class="alert alert-error smaller">
				<p>There appears to have been an error sending your message. Please make sure you've filled the form out completely and try again.</p>
			</div>
		{% elseif status == 'success' %}
			<div class="alert alert-success smaller">
				<p>Your message has been sent!</p>
			</div>
		{% endif %}

		<form method="post" action="{{ form.urlSubmitAndReturnTo('feedback/classified/1') }}" class="form-horizontal" enctype="multipart/form-data">
			{# this is required for mail sending to work #}
			<input type="hidden" name="mailkey" value="{{ key }}" />

			<p class="smaller">
				{{ form.instructions }}
			</p>

			<hr class="spacer" />

			<div class="control-group">
				<label class="control-label">Your name:</label>
				<div class="controls">
					<input type="text" name="sender_name" value="{{ message.sender_name }}" class="input-xxlarge" />
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Your email address:</label>
				<div class="controls">
					<input type="text" name="sender" value="{{ message.sender }}" class="input-xxlarge" />
					<!-- <div class="help-block smaller">You'll be contacted by an advertising account executive at this address</div> -->
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Your ad:</label>
				<div class="controls">
					<textarea rows="6" cols="40" name="message" class="input-xxlarge">{{ message.message }}</textarea>
				</div>
			</div>

			{% if turing %}
				<div class="control-group">
					<div class="controls">
						{{ turing }}
					</div>
				</div>
			{% endif %}

			<div class="control-group">
				<div class="controls">
					<input type="submit" class="btn btn-primary" value="Send my classified request" /></button> or <a href="{{ 'pre1:main'|url }}">return to classifieds</a>
				</div>
			</div>


		</form>
	</div>

		{% include "gryphon/main/sidebar/sidebar-standard.tpl" %}
</div>

{% endblock content %}
