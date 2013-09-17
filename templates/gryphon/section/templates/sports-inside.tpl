{#gryphon/section/main.tpl#}


{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}

{% block activeNav %}{{ section.slug }}{% endblock %}
{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
<link rel="stylesheet" type="text/css" href="lud/assets/src/css/bootstrap/carousel.less"/>
<link rel="javascript" href="lud/assets/src/js/vendor/bootstrap-carousel.js"/>
{% endblock %}


{% block content %}

{% helper request %}

{% set featured_story = articles.shift() %}
{% set featured_images = featured_story.media.grab('type', 'image') %}

{% import "macros/article.tpl" as articleRender %}
{% import "macros/meta.tpl" as metaRender %}

<div class="row">
    {% fetch scores from google:document with [
        'where': 'title = "Box Scores"',
        'limit': 1
    ] %}
    {% set scores = scores[0].parsed %}

    <div class="span12">
        <div class="row score-box">
            {% for score in scores %}
                {% if loop.index0 < 6 %}
                    <div class="span2">
                        <header>{{score.sport}}</header>
                        <dl>
                            <dt>{{score.w_score}}</dt>
                            <dd>{{score.winner}}</dd>
                            <dt>{{score.l_score}}</dt>
                            <dd>{{score.loser}}</dd>
                        </dl>
                        <strong>{{score.date|date('M d')}}</strong>
                    </div>
                {% endif %}
            {% endfor %}
        </div>
    </div>
</div>

<hr class="double spacer" />

<div class="row">
  <div class="span8">
<!-- Top Stories -->
        <h1>
            {{ section.name }}
            <div class="subnav pull-right">
                <ul>
                    <li><strong>More</strong></li>
                    <li><a href="{{ 'section/football'|url }}">Football</a></li>
                    <li><a href="{{ 'section/basketball'|url }}">Basketball</a></li>
                    <li><a href="{{ 'section/soccer'|url }}">Soccer</a></li>
                </ul>
            </div>
        </h1>

        <hr class="hairline" />

        {{ articleRender.centerpiece(featured_story) }}

        <hr class="double hairline"/>

        <!-- Multimedia Box -->
        {#<div class="row-fluid">
            <div class="span12">
                    {% if section.slug != 'opinion' %}
                        {% include 'gryphon/multimedia/media-box.tpl' with [section.tags] %}
                    {% endif %}
            </div>
        </div>#}
        <!-- End of Multimedia Box -->

        <!-- <hr class="double hairline"/> -->

        <hr class="spacer" />

        <div class="row-fluid">
            <div class="span12">
                <h2>more {{section.name}}</h2>
                </div>
            {% for article in articles.shift(4) %}
                {% if loop.index % 2 %}
                    </div>
                        <hr class="spacer" />
                    <div class="row-fluid">
                {% endif %}

                <div class="span6">
                    <hr class="hairline" />
                    <article class="summarized-story">
                        <h3><a href="{{article.url}}">{{ article.headline }}</a></h3>
                        <aside>
                            <div class="author">
                                {% if article.authors.length %}
                                By: {{ article.authors.splat('name')|join(',') }}
                                {% endif %}
                            </div>
                            <div class="pubdate">
                                {{ metaRender.dateLine(article.modified) }}
                            </div>
                            <hr class="spacer clearfix">
                        </aside>

                        <p>{{article.abstract_formatted|clip(100)}} <a href="{{article.url}}">Read more</a></p>
                    </article>
                </div>
            {% endfor %}
        </div>

        <hr class="spacer" />

        <div class="row-fluid">
            <div class="span12">
                <h2>more {{section.name}}</h2>
                </div>
            {% for article in articles %}
                {% if loop.index % 2 %}
                    </div>
                        <hr class="spacer" />
                    <div class="row-fluid">
                {% endif %}

                <div class="span6">
                    <hr class="hairline" />
                    <article class="summarized-story">
                        <h3><a href="{{article.url}}">{{ article.headline }}</a></h3>
                        <aside>
                            <div class="author">
                                {% if article.authors.length %}
                                By: {{ article.authors.splat('name')|join(',') }}
                                {% endif %}
                            </div>
                            <div class="pubdate">
                                {{ metaRender.dateLine(article.modified) }}
                            </div>
                            <hr class="spacer clearfix">
                        </aside>

                        <p>{{article.abstract_formatted|clip(100)}} <a href="{{article.url}}">Read more</a></p>
                    </article>
                </div>
            {% endfor %}
        </div>

    </div>
    {% include "gryphon/main/sidebar/sidebar-standard.tpl" %}

</div>

{% endblock content %}
