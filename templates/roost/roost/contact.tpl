{#roost/roost/contact.tpl#}


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
<div class="row-fluid property-listing">
	<div class="span8">
		<header>
			<h1>{{ property.name }}</h1>
			{{ property.address }}
			| <span class="phone">{{ property.phone }}</span>
			{% if property.email %}
				| <a href="{{ ('roost:roost/contact/'~property.uid)|url }}" class="email">Contact via email</a>
			{% endif %}
			{% if property.url %}
				| <a class="website" href="{{ property.url }}">Visit website</a>
			{% endif %}
			<div class="pull-right">{{property.type}}</div>
		</header>

		<hr class="spacer" />

		{% if success %}
			<div class="alert alert-success">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<p><strong>Success</strong> Your message was successfully sent.</p>
			</div>
		{% elseif errors %}
			<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				<p><strong>Oops</strong> Please check the following:</p>

				{% for id, label in errors %}
					{{ label }}<br />
				{% endfor %}
			</div>
		{% endif %}

		<hr class="spacer" />

		<div class="row-fluid listing-features">
			<div class="span4">
				{% if property.sale %}
					<h3>${{ property.sale}}</h3>
				{% else %}
					<h3>{{property.rentLabel}}</h3>
					<h4>per month</h4>
				{% endif %}
			</div>
			<div class="span4">
				<h3>{{ property.bedrooms }}</h3>
				<h4>Bedrooms</h4>
			</div>
			<div class="span4">
				<h3>{{property.bathrooms}}</h3>
				<h4>Bathrooms</h4>
			</div>
		</div>
		<div class="row-fluid listing-features">
			<div class="span12">
				<h5>Distance from Liberty: <em>{{property.chapel_distance}} miles</em></h4>
			</div>
		</div>

		<hr class="spacer" />

		<form method="post" action="{{ ('roost:roost/contact/'~property.uid)|url }}" class="form-horizontal">
			<div class="control-group">
				<label class="control-label" for="input_name">Name</label>
				<div class="controls">
					<input type="text" name="name" id="input_name" value="{{ posted.name }}" size="20" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input_email">Email</label>
				<div class="controls">
					<input type="text" name="email" id="input_email" value="{{ posted.email }}" size="20" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input_phone">Telephone</label>
				<div class="controls">
					<input type="text" name="phone" id="input_phone" value="{{ posted.phone }}" size="20" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="input_description">Message</label>
				<div class="controls">
					<textarea rows="10" style="width:100%;color:#333;" id="input_description" name="description">{{ posted.description }}</textarea>
					<span class="help-block">What do you want to ask? Please be as specific as possible.</span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">Verify<span class="req">*</span></label>
				<div class="controls">
					<script type="text/javascript" src="http://www.google.com/recaptcha/api/challenge?k={{config.get('gryphon:turing:keys:public')}}"></script>

				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<input type="submit" class="btn" value="Send message" />
					or
					<a href="{{property.urlListing}}">Return to listing</a>
				</div>
			</div>
		</form>
	</div>
	<div class="span4">
		{% include 'roost/roost/_sidebar.tpl' %}
	</div>

	<hr class="spacer" />
</div>
{% endblock content %}
