{#gryphon/base.tpl#}


{% import "macros/render.tpl" as render %}
{% import "macros/disqus.tpl" as disqus %}
{% helper config %}
{% helper weather %}
{% helper issuuDoc %}
{% helper adpilotHelper as ads %}

{% set title %}{% block title %}{% endblock %}{% endset %}

{% set active %}{% block activeNav %}{% endblock %}{% endset %}

{% if not active %}
	{% set active = 'home' %}
{% endif %}

{% set bodyClass %}{% block bodyClass %}{% endblock %}{% endset %}

{% set description %}{% block description %}{% endblock %}{% endset %}
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="generator" content="Gryphon {{ config.appVersion }} (Foundry {{ config.foundryVersion }})" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	{% if noIndex %}
		<meta name="robots" content="noindex, nofollow" />
	{% endif %}

	<link rel="apple-touch-icon-precomposed" href="{{ 'assets/dist/images/webclip.png'|asset }}" />

	<meta name="title" content="{{ config.get('publication:name') }}{{ title }}" />
	{% if title %}
		<title>{{ config.get('publication:name') }}{{ title }}</title>
	{% else %}
		<title>Liberty University Daily</title>
	{% endif %}
  	<!-- <link rel="shortcut icon" href="{{ 'assets/dist/images/favicon.ico'|asset }}"/> -->
	<meta name="description" content="{{ description|default(siteSlogan) }}" />
	<meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" type="text/css" href="{{ 'assets/src/js/vendor/fancybox/jquery.fancybox.css'|asset }}" />
    <link rel="stylesheet" type="text/css" href="{{ 'assets/dist/css/master.css'|asset }}" />


	<link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,700|Oxygen:300,700,400' rel='stylesheet' type='text/css'>

	<!--<script type="text/javascript" src="{{ 'assets/dist/js/master-min.js'|asset }}"></script>-->
	<script type="text/javascript" src="{{ 'assets/src/js/vendor/jquery-1.7.2-min.js'|asset }}"></script>
	<script type="text/javascript" src="{{ 'assets/src/js/dropnav.js'|asset }}"></script>
	<script type="text/javascript" src="{{ 'assets/src/js/ticker.js'|asset }}"></script>
	<script type="text/javascript" src="{{ 'assets/src/js/vendor/bootstrap.min.js'|asset }}"></script>
	<script type="text/javascript" src="{{ 'assets/src/js/vendor/jquery.isotope-min.js'|asset }}"></script>
	<script type="text/javascript" src="{{ 'assets/src/js/master.js'|asset }}"></script>
	<script src="{{ 'assets/dist/js/audiojs/audio.min.js'|asset }}"></script>
	<script>
	  audiojs.events.ready(function() {
	    var as = audiojs.createAll();
	  });
	</script>
	<script type='text/javascript'>
		var googletag = googletag || {};
		googletag.cmd = googletag.cmd || [];
		(function() {
		var gads = document.createElement('script');
		gads.async = true; gads.type = 'text/javascript';
		var useSSL = 'https:' == document.location.protocol;
		gads.src = (useSSL ? 'https:' : 'http:') + '//www.googletagservices.com/tag/js/gpt.js';
		var node = document.getElementsByTagName('script')[0];
		node.parentNode.insertBefore(gads, node);
		}
		)();
	</script>
	<script type='text/javascript'>
		googletag.cmd.push(function() {
				googletag.defineSlot('/23035749/LUD_Banner_Mobile_Bottom_300x50', [320, 50], 'div-gpt-ad-1377878976717-0').addService(googletag.pubads());
				googletag.defineSlot('/23035749/LUD_Banner_Mobile_Top_300x50', [320, 50], 'div-gpt ad-1377878976717-1').addService(googletag.pubads());
				googletag.pubads().enableSingleRequest(); googletag.enableServices();
			}
		);
	</script>
	<hr class="spacer"/>

	<script type="text/javascript" src="{{ 'assets/src/js/vendor/jquery.fancybox.pack.js'|asset }}"></script>
    <script>
        (function($) {
            $(function() {
                $('.fancybox-single').fancybox();
            });
        })(jQuery);
    </script>


	{% block styles %}{% endblock %}
	{% block links %}{% endblock %}


	<link rel="alternate" type="application/rss+xml" title="{{ config.get('publication:name') }} : Top Stories" href="{{ 'section/pageOne'|url }}.xml" />

	<link href="http://vjs.zencdn.net/c/video-js.css" rel="stylesheet">
	<script src="http://vjs.zencdn.net/c/video.js"></script>

	{% block scripts %}{% endblock %}

</head>

<body{% if bodyClass %} class="{{ bodyClass }}"{% endif %}>

	<div class="container">
		<hr class="spacer"/>


		<header>
			<div class="row"id="top-ticker">
				<div class="span12 text-left hidden-phone hidden-tablet" >
					<ul class="unstyled pull-right">
						<li><a href="{{ 'page/about'|url }}">About</a></li>
						<!--<li><a href="{{ 'page/templates/work'|url }}">Work for us</a></li>-->
						<li><a href="{{ 'page/advertise'|url }}">Advertising</a></li>
						<li><a href="{{ 'google:calendar'|url }}">Calendar</a></li>
						<li><a href="{{ 'page/contact'|url }}">Contact Us</a></li>
						<li><a href="{{ 'dining'|url}}">Dining Guide</a></li>
						<li><a href="{{ 'housing'|url}}">Housing Guide</a></li>
						<li><a href="{{ 'tsn:mail/submitnews/2'|url }}">Submit a News Story</a></li>

			  		</ul>
				</div><!-- /.span6 -->
			</div>
			<hr class="double spacer" />
			<div class="row">
				<div class="span12">
					<a href="{{ '/'|url }}"><img src="{{ 'assets/dist/images/fd_logo.png'|asset }}"/></a>
				</div><!-- /.span3 .text-center -->
			</div><!--/row -->

			<div class="row">

			  	<div class="offset8 span4 hidden-phone hidden-tablet" id="weather">
					<span>{{ weather }}</span><br/>
					<span><strong>{{ weather.temp }}&deg;F&nbsp;</strong>/&nbsp;{{ weather.tempC}}&deg;C</span><br/>
					<a href="{{ weather.url }}" target = "_blank">7 day forecast</a>
					<hr class="spacer" />
					<strong class="text-right date">{{ now|date('l, F j, Y')}}</strong>
			    </div>
			</div><!--/row-->
		</header>

		<hr class="spacer" />

		<div class="navbar">
			<div class="navbar-inner">
				<a class="brand hidden-desktop" href="#" data-toggle="collapse" data-target=".nav-collapse">Navigation</a>
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-chevron-down"></span>
				</a>
				  <div class="nav-collapse collapse">
					   <ul class="nav">

						    <li{% if not active or active == "home" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'top_stories']) }}"><a href="{{ '/'|url }}">front</a></li>

						    <li{% if active == "news" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'news']) }}"><a href="{{ 'section/news'|url }}">news</a></li>

						    <li{% if active == "sports" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'sports']) }}"><a href="{{ 'section/sports'|url }}">sports</a></li>

						    <li{% if active == "ae" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'ae']) }}"><a href="{{ 'section/ae'|url }}">a&amp;e</a></li>

						    <li{% if active == "tech" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'tech']) }}"><a href="{{ 'section/tech'|url }}">tech</a></li>

							<li{% if active == "multimedia" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'multimedia']) }}"><a href="{{ 'multimedia'|url }}">multimedia</a></li>

						    <li{% if active == "opinion" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'opinion']) }}"><a href="{{ 'section/opinion'|url }}">opinion</a></li>

							<li{% if active == "blog" %} class="active"{% endif %} data-dropnav-source="{{ 'section/dropnav'|url(['t':'blog']) }}"><a href="{{ 'blog'|url }}">blogs</a></li>
						</ul><!--nav-->
						<form method="get" class="navbar-search pull-right" action="{{ 'search'|url }}">
							<input id="searchField" type="text" name="q" placeholder="Search" style="width:100%; border-radius:0;"  />
						</form>
						<ul class="nav pull-right">
							<li><a href="http://www.facebook.com/flamesdaily" id="nav-fb"></a></li>
							<li><a href="http://www.twitter.com/flamesdaily" id="nav-tw"></a></li>
							<li><a href="http://www.youtube.com/user/flames-daily-2374" id="nav-yt"></a></li>
							<li><a href="http://plus.google.com/115162173526418020230" id="nav-plus"></a></li>
						</ul>
					</div>
				</div><!--navbar collapse-->
			</div><!-- /.navbar-inner -->
		<div>

		<hr class="half spacer clearfix hidden-phone" />


		<div class="row-fluid" style="padding-bottom: 7px;">
			<div class="span12 text-center hidden-phone">
				<div style="display:inline-block;">{% include 'gryphon/ads/leaderboard.tpl' %}</div>
			</div><!--span12-->
		</div><!--row-->

		{% include 'gryphon/main/ticker.tpl' %}

		<hr class="spacer" />

		<div class="container" id="main-content">
		    {# THIS IS THE MAIN CONTENT BLOCK #}
		    {% block content %}{% endblock %}
		    <hr class="spacer clearfix" />
	    </div>

	    <hr class="spacer" />

		<div class="hidden-phone" style="text-align:center;">{% include 'gryphon/ads/leaderboard.tpl' %}</div>

		<footer class="text-center" >

				<div class="wide">

					<ul class="unstyled">
						<li><a href="{{ '/'|url }}">HOME</a></li>
						<li><a href="{{ 'section/news'|url }}">NEWS</a></li>
						<li><a href="{{ 'section/sports'|url }}">SPORTS</a></li>
						<li><a href="{{ 'section/ae'|url }}">A&amp;E</a></li>
						<li><a href="{{ 'section/tech'|url }}">TECH</a></li>
						<li><a href="{{ 'section/opinion'|url }}">OPINION</a></li>
						<li><a href="{{ 'blog'|url }}">BLOGS</a></li>
					</ul>

					<ul class="unstyled" >
						<li><a href="{{ 'page/about'|url }}">About</a></li>
						<li><a href="{{ 'page/advertise'|url }}">Advertising</a></li>
						<li><a href="{{ 'google:calendar'|url }}">Calendar</a></li>
						<li><a href="{{ 'page/contact'|url }}">Contact Us</a></li>
						<li><a href="{{ 'dining'|url}}">Dining Guide</a></li>
						<li><a href="{{ 'housing'|url}}">Housing Guide</a></li>
						<li><a href="{{ 'tsn:mail/submitnews/2'|url }}">Submit a News Story</a></li>
						<li><a href="{{ 'page/feeds'|url }}">RSS</a></li>
						<li><a href="{{ 'page/privacy'|url }}">Privacy Policy</a></li>
					</ul>

					<a class="fancybox" href="{{ '/'|url }}">
					<img class="logo" src="{{ 'assets/dist/images/fd_bottom_logo.png'|asset }}"/>
					</a>

				</div>

			<hr class="spacer"/>
			<div class=" wide row">
				<div>
					<strong>&copy; {{ now|date('Y') }} Flames Daily</strong>

					<hr class="half spacer" />
					<div id="snworks-bug">
						Powered by <a href="http://getsnworks.com" target="_blank"><img src="http://cdn.thesn.net/gAssets/SNworks_gray.png" alt="powered by SNworks" title="powered by SNworks" style="padding:0 10px 0 0;position:relative;top:-2px;" /></a> Solutions by The State News
					</div><!-- /#snworks-bug -->
				</div>
			</div>
		</footer>
		<hr class="spacer clearfix"/>
</div>

    <script type="text/javascript">

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-1746956-15']);
      _gaq.push(['_setDomainName', 'none']);
      _gaq.push(['_setAllowLinker', true]);
      _gaq.push(['_trackPageview']);

      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>

{{ disqus.includejs() }}
</body>

</html>
