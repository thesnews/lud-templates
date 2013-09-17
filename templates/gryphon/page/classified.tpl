{#gryphon/page/classified.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ page.title }}{% endblock %}
{% block description %}{{ page.content_formatted|striptags|clip(400) }}{% endblock %}
{% block activeNav %}{{ active }}{% endblock %}

{% block styles %}

{% endblock %}

{% block scripts %}
{% endblock %}

{% block content %}
{% import "macros/meta.tpl" as metaRender %}

<div class="row">
	<div class="span8">

        <div id="Partner_API_CampusAve" partnerid="540" partnerdomain="http://dailygamecock.campusave.com/">
        loading classifieds...
        </div>
        <script type="text/javascript" src="http://dailygamecock.campusave.com/includes/api.js"></script>
        <div id="Partner_API_CampusAve_BI"><a href="http://sc.uloop.com" target="_blank"><img src="http://dailygamecock.campusave.com/images/powered-by-uloop3.gif" alt="Univ. of South Carolina Classifieds in Columbia, South Carolina" title="Univ. of South Carolina Classifieds in Columbia, South Carolina"/></a></div>

   	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}