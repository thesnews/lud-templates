{#gryphon/page/main.tpl#}


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

        <h2>RSS/Atom Feeds</h2>
        <hr class="spacer" />
        <p class="smaller">RSS and Atom feeds allow you to add State News content to your favorite feed reader, like <a href="http://reader.google.com">Google Reader</a> or add us to your <a href="http://facebook.com">Facebook</a> news feed.</p>

        <hr class="spacer" />
        <ul>
            <li><a href="{{ 'gryphon:recent/article.xml'|url }}">Recent Articles and Blogs</a></li>
            <li><a href="{{ 'gryphon:recent/comment.xml'|url }}">Recent Comments</a></li>
        </ul>

        <h3>Blogs:</h3>
        <ul>
            {% fetch blogs from blog with [
                'where': 'status = 1',
                'order': 'name asc'
            ] %}
            {% for blog in blogs %}
                <li><a href="{{ blog.url }}.xml">{{ blog.name }}</a></li>
            {% endfor %}
        </ul>

        <hr class="spacer" />

        <h3>Sections:</h3>
         <ul>
            <li><a href="{{ 'gryphon:section/pageOne.xml'|url }}">Top Stories</a></li>
            <li><a href="{{ 'gryphon:section/news.xml'|url }}">News</a>
            <li><a href="{{ 'gryphon:section/ae.xml'|url }}">A&amp;E</a>
            <li><a href="{{ 'gryphon:section/tech.xml'|url }}">Tech</a>
            </li>
            <li><a href="{{ 'gryphon:section/sports.xml'|url }}">Sports</a>
                <ul>
                    <li><a href="{{ 'gryphon:section/baseball.xml'|url }}">Baseball</a></li>
                    <li><a href="{{ 'gryphon:section/basketball.xml'|url }}">Basketball</a></li>
                    <!-- <li><a href="{{ 'gryphon:section/crosscountry.xml'|url }}">Cross Country</a></li> -->
                    <li><a href="{{ 'gryphon:section/football.xml'|url }}">Football</a></li>
                    <!-- <li><a href="{{ 'gryphon:section/golf.xml'|url }}">Golf</a></li> -->
                    <!-- <li><a href="{{ 'gryphon:section/gymnastics.xml'|url }}">Gymnastics</a></li> -->
                    <!-- <li><a href="{{ 'gryphon:section/fieldhockey.xml'|url }}">Field Hockey</a></li> -->
                    <li><a href="{{ 'gryphon:section/icehockey.xml'|url }}">Ice Hockey</a></li>
                    <!-- <li><a href="{{ 'gryphon:section/rowing.xml'|url }}">Rowing</a></li> -->
                    <li><a href="{{ 'gryphon:section/soccer.xml'|url }}">Soccer</a></li>
                    <li><a href="{{ 'gryphon:section/softball.xml'|url }}">Softball</a></li>
                    <!-- <li><a href="{{ 'gryphon:section/swimmingdiving.xml'|url }}">Swimming &amp; Diving</a></li> -->
                    <!-- <li><a href="{{ 'gryphon:section/trackfield.xml'|url }}">Track &amp; Field</a></li> -->
                    <!-- <li><a href="{{ 'gryphon:section/volleyball.xml'|url }}">Volleyball</a></li> -->
                    <!-- <li><a href="{{ 'gryphon:section/wrestling.xml'|url }}">Wrestling</a></li> -->
                </ul>

            </li>
            <li><a href="{{ 'gryphon:section/opinion.xml'|url }}">Opinion</a>
                <ul>
                    <li><a href="{{ 'gryphon:section/editorials.xml'|url }}">Editorials</a></li>
                    <li><a href="{{ 'gryphon:section/columns.xml'|url }}">Columns</a></li>
                    <li><a href="{{ 'gryphon:section/letters.xml'|url }}">Letters</a></li>
                </ul>
            </li>
            <!-- <li><a href="{{ 'gryphon:section/features.xml'|url }}">Features</a></li> -->
        </ul>
	</div>

	{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}

</div>


{% endblock content %}