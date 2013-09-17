{#tsn/poll/archive.tpl#}


{% extends "gryphon/base.tpl" %}

{% block title %} :: Poll Archive {% endblock %}
{% block active %}opinion{% endblock %}

{% block content %}


<div class="row">
	<div class="span8">
			
		<h1>Poll Archive</h1>
				
			<hr class="hairline" />
				
				<div class="polls">
				
					<div class="pagination">
					<ul>
					{% for page in pagination %}
					
						{% if page.isCurrent %}
					
							<li class="active"><a href="{{ page.url }}">{{ page.label }}</a></li>
					
						{% else %}
					
						<li><a href="{{ page.url }}">{{ page.label }}</a></li>
					
						{% endif %}
				
					{% endfor %}
					</ul>
					</div>
	
				<ul class="search-results">
		
				{% for poll in polls %}
			
					<li><a href="{{ poll.url }}">{{ poll.question }}</a></li>
			
				{% endfor %}
		
				</ul>

				<hr class="spacer" />
	
					<div class="pagination">
					<ul>
					{% for page in pagination %}
					
						{% if page.isCurrent %}
					
							<li class="active"><a href="{{ page.url }}">{{ page.label }}</a></li>
					
						{% else %}
					
						<li><a href="{{ page.url }}">{{ page.label }}</a></li>
					
						{% endif %}
				
					{% endfor %}
					</ul>
					</div>
	</div>
</div>


{% include "gryphon/main/sidebar/sidebar-standard.tpl" %}


<hr class="spacer" />

{% endblock content %}