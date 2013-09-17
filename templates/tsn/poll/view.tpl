{#tsn/poll/view.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: {{ poll.title }} {% endblock %}
{% block active %}opinion{% endblock %}

{% block scripts %}
	<script src="{{ 'javascript/vendor/bluff/js-class.js'|url }}" type="text/javascript"></script>
	<script src="{{ 'javascript/vendor/bluff/bluff-min.js'|url }}" type="text/javascript"></script>
{% endblock %}

{% block content %}

<div class="row">
	<div class="span8">

		<div class="row-fluid">
			<div class="span12">
				<div class="polls">
					<h3>{{ poll.question }}</h3>
					<hr class="hairline" />
					<hr class="spacer" />
						<ul class="chartlist">
						{% for response in poll.getResponses() %}
				  			<li>
				    			<span class="item">{{ response.answer }}</span> 
				    			<span class="count">{{ response.percent }}%</span>
				    			<span class="index" style="width:{{ response.percent }}%;"></span>
				  			</li>
							{% endfor %}
						<hr class="spacer" />  
						</ul>
 		      <h5>{{ poll.responses }} total responses.</h5>
				</div>		
			</div>
		</div>
		
		
		<div class="row-fluid">
			<div class="span12">
				<hr class="hairline" />
				<div id="comments">
				{{ disqus.list(poll) }}
				</div>
			</div>
	
		</div>

	</div>

			
{% include "gryphon/main/sidebar/sidebar-standard.tpl" %}

</div>

<hr class="spacer" />

{% endblock content %}