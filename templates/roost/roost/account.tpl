{#roost/roost/account.tpl#}


{% extends 'gryphon/base.tpl' %}
{% block title %} :: Housing Guide : {{ property.name }}{% endblock %}

{% block scripts %}
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
	<script type="text/javascript" src="{{ '/roost/frontend/javascript/master.js'|url }}"></script>
{% endblock %}

{% block styles %}
	<link rel="stylesheet" type="text/css" media="screen" href="{{ '/roost/frontend/style/screen/master.css'|url }}" />
{% endblock %}

{% block content %}
{% helper config %}
{% helper request %}
<div class="row-fluid">
	<div class="span8">
		<h1>Get Listed</h1>

		<div class="body-copy">
			<p>Already have an account? <a href="/roost">Login here</a>.</p>

			<p>Become a part of Flames Daily Housing Guide.</p>

			<h4>For more information drop us a line!</h4>

			<hr class="spacer" />
			{% if success == true and request.post('sre', 'bool') %}
				<div class="alert alert-success">
					<strong>Thank you</strong> for your interest in the Housing Guide. You'll be hearing from us soon.
				</div>
			{% elseif success == false and request.post('sre', 'bool') %}
				<div class="alert alert-error">
					<strong>Oops</strong> Please check the following errors:

					<ul>
						{% for error in errors %}
							<li>{{error}}</li>
						{% endfor %}
					</ul>
				</div>
			{% endif %}
			<form method="post" action="{{'housing/account'|url }}" class="form-horizontal">
				<input type="hidden" value="1" name="sre" />
				<div class="control-group">
					<label class="control-label">Property Name</label>
					<div class="controls">
						<input type="text" name="property_name" class="span8" value="{{request.post('property_name', 'stripTags') }}" placeholder="Property Name" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Contact Name</label>
					<div class="controls">
						<input type="text" name="contact_name" class="span8" value="{{request.post('contact_name', 'stripTags') }}" placeholder="Your Name" />
						<span class="help-inline"><span class="label label-warning">Required</span></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Email</label>
					<div class="controls">
						<input type="text" name="contact_email" class="span3" value="{{request.post('contact_email', 'stripTags') }}" placeholder="email@address.com" />
						<span class="help-inline"><span class="label label-warning">Required</span></span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Phone Number</label>
					<div class="controls">
						<input type="text" name="contact_phone" class="span3" value="{{request.post('contact_phone', 'phone') }}" placeholder="555 555-5555" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">Any specific questions?</label>
					<div class="controls">
						<textarea name="questions" class="span10" rows="5">{{request.post('questions', 'stripTags') }}</textarea>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
					<script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k={{config.get('gryphon:turing:keys:public')}}"></script>
					</div>
				</div>

				<hr class="spacer">

				<div class="control-grous">
					<div class="controls">
						<input type="submit" class="btn btn-large btn-duke" value="Get in touch" />
					</div>
				</div>
			</form>
		</div>

		<hr class="mb" />

	</div>
	<div class="span4">
		{% include 'roost/roost/_sidebar.tpl' %}
	</div>
</div>
<hr class="spacer" />
{% endblock %}