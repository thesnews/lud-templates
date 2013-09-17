{% extends "gryphon/base.tpl" %}
{% block title %} :: {{ section.name }}{% endblock %}

{% block activeNav %}{{ section.slug }}{% endblock %}
{% block links %}
<link rel="alternate" type="application/rss+xml" title="{{ config.get('gryphon:publication:name') }} :: {{ section.name }}" href="{{ (section.url~'.xml')|url }}" />
<link rel="stylesheet" type="text/css" href="lud/assets/src/css/bootstrap/carousel.less"/>
<link rel="javascript" href="lud/assets/src/js/vendor/bootstrap-carousel.js"/>
{% endblock %}

{% block content %}

{% set topStory = articles.shift() %}
{% set featuredStories = articles.shift(2) %}
{% import "macros/article.tpl" as articleRender %}

<div class="row">
	<div class="span8">

		<h1>
			Opinion
			<div class="subnav pull-right">
				<ul>
					<li><strong>More</strong></li>
					<li><a href="{{ 'section/editorials'|url }}">Editorials</a></li>
					<li><a href="{{ 'section/columns'|url }}">Columns</a></li>
					<li><a href="{{ 'section/letters'|url }}">Letters</a></li>
					<li><a href="{{ 'page/opinionpodcast'|url}}">Podcast</a></li>
				</ul>
			</div>
		</h1>

		<hr class="hairline" />

		<div class="row-fluid">

			<div class="span4">

				{% fetch cartoons from media with [
					'where': 'status = 1',
					'order': 'created desc',
					'limit': 5,
					'withTags': ['editorial_cartoon']
				] %}

				{% set cartoon = cartoons.shift() %}

				<h3><a href = "{{ cartoon.urlDefault }}">CARTOON:</a></h3>

				<article class="row-fluid">

					<a href="{{ cartoon.url }}" class="fancybox-single"><img src="{{ cartoon.urlPreview }}" style="max-width:210px;" class="photo" /></a>
					<aside>By <a href="{{ cartoon.authors[0].urlSearch }}">{{ cartoon.authors[0].name }}</a></aside>

					<hr class="half spacer"/>

					<a href="{{ 'page/cartoon-main'|url }}">VIEW MORE CARTOONS</a>

				</article>


			</div><!-- end of span4 comics -->

			<div class="span8">
				{{articleRender.centerpiece(topStory)}}
			</div><!-- end of span8 topStory -->

      </div><!-- end of row fluid -->


      <hr class="double hairline"/>

      <div class="row-fluid">
        <div class="span5">

          <div class="well">
      			 <h4>Have something to say?</h4>
      			  Send a <a href="{{ 'tsn:mail/opinion/3'|url }}">letter to the editor</a>.
    		  </div>

          <hr class="spacer">


        </div><!-- end of span5 twitter -->

        <div class="span7">
          <a href="{{ 'gryphon:section/editorials'|url }}"><header class="box"><h3>OUR VOICE:</h3></header></a>
          <hr class="half spacer"/>

        		{% fetch editorials from article with [
        			'where': 'status = 1',
        			'order': 'weight desc, created desc',
        			'limit': 3,
        			'withTags': ['Editorials']
        		] %}

        		{% for article in editorials %}
        			{{ articleRender.topSidebar(article) }}
        		{% endfor %}
        		</div><!-- end of span7 articles -->
        </div><!-- end of row fluid -->

          <hr class="hairline"/>
          <div class = "row-fluid">
      		    <div class="span6">
          		 <a href="{{ 'gryphon:section/columns'|url }}"><header class="box"><h3>COLUMNS:</h3></header></a>
          		 <hr class="half spacer"/>
            		{% fetch articles from article with [
            			'where': 'status = 1',
            			'order': 'weight desc, created desc',
            			'limit': 3,
            			'withTags': ['Columns']
            		] %}

            		{% for article in articles %}
            			{{ articleRender.topSidebar(article) }}
            			<hr class="spacer"/>
            		{% endfor %}
          		</div><!-- end of span6 Columns -->

          		<div class="span6">
            		<a href="{{ 'gryphon:section/letters'|url }}"><header class="box"><h3>LETTERS:</h3></header></a>
            	   <hr class="half spacer"/>
              		{% fetch articles from article with [
              			'where': 'status = 1',
              			'order': 'weight desc, created desc',
              			'limit': 3,
              			'withTags': ['Letters']
              		] %}

              		{% for article in articles %}
              			{{ articleRender.topSidebar(article) }}
              			<hr class="spacer"/>
              		{% endfor %}
              </div><!-- end of span6 Letters -->

      </div><!-- end of rowfluid -->

      <hr class="double  hairline"/>

      <div class="row-fluid">

				{% fetch rundown from article with [
					'order': 'weight desc, created desc',
					'limit': '3',
					'where': 'status = 1',
					'withTags': ['news']
				] %}
				<div class="rundown-box span4">
					<header class="box"><a href="{{ 'section/news'|url }}"><h3>News</h3></a></header>
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
					'withTags': ['sports']
				] %}
				<div class="rundown-box span4">
					<header class="box"><a href="{{ 'section/sports'|url }}"><h3>Sports</h3></a></header>
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
					'withTags': ['arts and entertianment']
				] %}
				<div class="rundown-box span4">
					<header class="box"><a href="{{ 'section/ae'|url }}"><h3>A&E</h3></a></header>
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
					</div><!-- end of rundown-span4 Features -->
      </div>
  </div><!-- end of span8 -->

		{% include 'gryphon/main/sidebar/sidebar-standard.tpl' %}
</div>

{% endblock content %}
