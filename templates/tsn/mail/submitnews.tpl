{#tsn/mail/submitnews.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: Submit News {% endblock %}
{% block active %}news{% endblock %}
{% block subActive %}news{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">

		<h1>Submit News</h1>

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

		<form method="post" action="{{ form.urlSubmitAndReturnTo('feedback/submitnews/2') }}" class="form-horizontal" enctype="multipart/form-data">
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
					<div class="help-block smaller">Your email address will not be shared with any third-parties</div>
				</div>
			</div>
			
			<div class="control-group">
				<label class="control-label">Post Title:</label>
				<div class="controls">
					<input type="text" name="title" value="{{ message.title }}" class="input-xxlarge" />
					
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">Post Content</label>
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
					<input type="submit" class="btn btn-primary" value="Submit News" /></button> 
				</div>
			</div>


		</form>
	</div>

		{% include "gryphon/main/sidebar/sidebar-standard.tpl" %}
</div>

{% endblock content %}