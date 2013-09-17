<!-- gryphon/multimedia/detail.tpl -->

<h3>{{ topMedia.title|default(topMedia.type) }}</h3>
<hr class="spacer" />

{{ mediaRender.media(topMedia) }}
<hr class="half spacer" />
<aside class="credit">
	{% if topMedia.authors.length %}
		{% set author = topMedia.authors.shift() %}
		by <a href="{{ author.url }}">{{ author.name }}</a>
		{% for author in topMedia.authors %}
			and <a href="{{author.url}}">{{author.name}}</a>
		{% endfor %}
	{% else %}
		&nbsp;
	{% endif %}
	<span class="pull-right">
		{{ topMedia.created|timeSince }}
	</span>
</aside>
  <ul class="unstyled">
    <li><a href="http://www.facebook.com/share.php?u={{ topMedia.urlDefault }}"><img src="{{ 'assets/dist/images/facebook_logo.png'|	asset}}"/></a></li>
    <li><a class="socialite twitter-share" href="http://twitter.com/share" data-url="{{ topMedia.urlDefault }}"><img src="{{ 'assets/dist/images/twitter-logo.png'|asset}}"/></a></li>
    <li><a href="mailto:?subject=Daily%20Gamecock:%20{{ topMedia.caption }}&body=Hi%20there.%20%20Check%20out%20this%20article%20from%20The%20Daily%20Gamecock:%20{{ topMedia.urlDefault }}" class="mail"><img src="{{ 'assets/dist/images/mail.png'|asset}}"/></a></li>
  </ul>
<p class="copy">{{ topMedia.caption_formatted }}</p>



<hr class="double spacer" />

<div class="well">
	{{ disqus.list(topMedia) }}
</div>

<hr class="double hairline clearfix" />

{% include 'gryphon/multimedia/more.tpl' %}

<hr class="spacer double" />