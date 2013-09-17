{#gryphon/comment/main.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: Oops{% endblock %}

{% block content %}
<div class="grid_8">
	<p class="attn"><strong>Sorry, an error has occurred.</strong></p>
	
	<p>
		<ul>
			{% for error in errors %}
				<li>{{ error }}</li>
			{% endfor %}
		</ul>
	</p>
	
	<p><a href="{{ returnUrl }}">Back to the page from whence you came</a></p>
</div>
<div class="grid_4">
	{% include 'gryphon/main/sidebar/article.tpl' %}
</div>
{% endblock %}