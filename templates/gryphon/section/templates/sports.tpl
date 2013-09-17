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

{% fetch centerpiece from article with [
 'order': 'weight desc, created desc',
						'limit': '1',
						'where': 'status = 1',
						'withTags': ['sports', 'centerpiece']
] %}

{% set featured_story = centerpiece[0] %}
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
                    <div class="row-fluid">
                        {% fetch rundown from article with [
                            'order': 'weight desc, created desc',
                            'limit': '3',
                            'where': 'status = 1',
                            'withTags': ['football']
                        ] %}
                        <div class="rundown-box span4">
                            <header class="box"><a href="{{ 'section/football'|url }}"><h3>Football</h3></a></header>
                            <div class="box bg">
                                {% for article in rundown %}
                                    {% set topMedia = article.media.grab('type', 'image')[0] %}
                                    <article class="clearfix">
                                        {% if topMedia %}
                                            <a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
                                            <div class="has-media">
                                        {% endif %}
                                        <h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
                                        <hr class="half spacer" />
                                        <aside>
                                            <div class="pull-right">
                                                Published {{ article.created|timeSince }}
                                            </div>
                                        </aside>
                                        {% if topMedia %}
                                            </div>
                                        {% endif %}
                                    </article>
                                    <hr class="hairline" />
                                {% endfor %}
                            </div>
                        </div>

                        {% fetch rundown from article with [
                            'order': 'weight desc, created desc',
                            'limit': '3',
                            'where': 'status = 1',
                            'withTags': ['basketball']
                        ] %}
                        <div class="rundown-box span4">
                            <header class="box"><a href="{{ 'section/basketball'|url }}"><h3>Basketball</h3></a></header>
                            <div class="box bg">
                                {% for article in rundown %}
                                    {% set topMedia = article.media.grab('type', 'image')[0] %}
                                    <article class="clearfix">
                                        {% if topMedia %}
                                            <a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
                                            <div class="has-media">
                                        {% endif %}
                                        <h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
                                        <hr class="half spacer" />
                                        <aside>
                                            <div class="pull-right">
                                                Published {{ article.created|timeSince }}
                                            </div>
                                        </aside>
                                        {% if topMedia %}
                                            </div>
                                        {% endif %}
                                    </article>
                                    <hr class="hairline" />
                                {% endfor %}
                            </div>
                        </div>

                        {% fetch rundown from article with [
                            'order': 'weight desc, created desc',
                            'where': 'status = 1',
                            'withTags': ['soccer'],
                            'limit': 3
                        ] %}
                        <div class="rundown-box span4">
                            <header class="box"><a href="{{ 'section/soccer'|url }}"><h3>Soccer</h3></a></header>
                            <div class="box bg">
                                {% for article in rundown %}
                                    {% set topMedia = article.media.grab('type', 'image')[0] %}
                                    <article class="clearfix">
                                        {% if topMedia %}
                                            <a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
                                            <div class="has-media">
                                        {% endif %}


                                        <h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
                                        <hr class="half spacer" />
                                        <aside>
                                            <div class="pull-right">
                                                Published {{ article.created|timeSince }}
                                            </div>

                                        </aside>
                                        {% if topMedia %}
                                            </div>
                                        {% endif %}
                                    </article>
                                    <hr class="hairline" />
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <hr class="spacer" />

            <div class="row-fluid">
                <div class="span12">
                    <div class="row-fluid">
                        {% fetch rundown from article with [
                            'order': 'weight desc, created desc',
                            'limit': '3',
                            'where': 'status = 1',
                            'withTags': ['baseball']
                        ] %}
                        <div class="rundown-box span4">
                            <header class="box"><a href="{{ 'section/baseball'|url }}"><h3>Baseball</h3></a></header>
                            <div class="box bg">
                                {% for article in rundown %}
                                    {% set topMedia = article.media.grab('type', 'image')[0] %}
                                    <article class="clearfix">
                                        {% if topMedia %}
                                            <a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
                                            <div class="has-media">
                                        {% endif %}
                                        <h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
                                        <hr class="half spacer" />
                                        <aside>
                                            <div class="pull-right">
                                                Published {{ article.created|timeSince }}
                                            </div>
                                        </aside>
                                        {% if topMedia %}
                                            </div>
                                        {% endif %}
                                    </article>
                                    <hr class="hairline" />
                                {% endfor %}
                            </div>
                        </div>

                        {% fetch rundown from article with [
                            'order': 'weight desc, created desc',
                            'limit': '3',
                            'where': 'status = 1',
                            'withTags': ['Softball']
                        ] %}
                        <div class="rundown-box span4">
                            <header class="box"><a href="{{ 'section/softball'|url }}"><h3>Softball</h3></a></header>
                            <div class="box bg">
                                {% for article in rundown %}
                                    {% set topMedia = article.media.grab('type', 'image')[0] %}
                                    <article class="clearfix">
                                        {% if topMedia %}
                                            <a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
                                            <div class="has-media">
                                        {% endif %}
                                        <h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
                                        <hr class="half spacer" />
                                        <aside>
                                            <div class="pull-right">
                                                Published {{ article.created|timeSince }}
                                            </div>
                                        </aside>
                                        {% if topMedia %}
                                            </div>
                                        {% endif %}
                                    </article>
                                    <hr class="hairline" />
                                {% endfor %}
                            </div>
                        </div>

                        {% fetch rundown from article with [
                            'order': 'weight desc, created desc',
                            'where': 'status = 1',
                            'withTags': ['Hockey'],
                            'limit': 3
                        ] %}
                        <div class="rundown-box span4">
                            <header class="box"><a href="{{ 'section/hockey'|url }}"><h3>Hockey</h3></a></header>
                            <div class="box bg">
                                {% for article in rundown %}
                                    {% set topMedia = article.media.grab('type', 'image')[0] %}
                                    <article class="clearfix">
                                        {% if topMedia %}
                                            <a class="pull-left" href="{{ article.url }}"><img class="media-object inline" src="{{ topMedia.urlPreview }}"  style="max-width:75px;" /></a>
                                            <div class="has-media">
                                        {% endif %}


                                        <h4><a href="{{ article.url }}">{{ article.headline }}</a></h4>
                                        <hr class="half spacer" />
                                        <aside>
                                            <div class="pull-right">
                                                Published {{ article.created|timeSince }}
                                            </div>

                                        </aside>
                                        {% if topMedia %}
                                            </div>
                                        {% endif %}
                                    </article>
                                    <hr class="hairline" />
                                {% endfor %}
                            </div>
                        </div>
                    </div>
                </div>
        </div>

    </div>
    {% include "gryphon/main/sidebar/sidebar-standard.tpl" %}

</div>

{% endblock content %}
