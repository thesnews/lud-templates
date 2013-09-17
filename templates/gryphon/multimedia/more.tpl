{#gryphon/multimedia/more.tpl#}


<div class="row-fluid">
	<div class="span4">
		
			{% fetch videos from gryphon:media with [
				'where': '(type = "youtube" or type = "video") and status = 1',
				'order': 'created desc',
				'limit': 4
			] %}
			<header class="box"><h3 class="more-titles">Video <span class="pull-right"><a href="{{ 'multimedia/video'|url }}" style="font-size:11px;">More <i class="icon-chevron-right icon-black"></i></a></span></h3></header>
			<div class="box bg">
				{% for video in videos %}
					<div class="photo-wrap" style="height:125px;">
						<a href="{{ video.urlDefault }}">
							<img src="{{ video.urlPreview }}" style="max-height:125px;" />
						</a>
					</div>
					<hr class="half spacer" />
		  			
		  			<h4><a href="{{ video.urlDefault }}">{{ video.title }}</a></h4>
						<aside class="credit">
							{% if video.authors.length %}
								By {{ video.authors.splat('name')|join(', ') }}
							{% else %}
								&nbsp;
							{% endif %}
							<span class="pull-right">{{ video.created|timeSince }}</span>
						</aside>
		    		<hr class="double spacer" />
				{% endfor %}
			</div>
	</div>
	
	<div class="span4">
		
			{% fetch gals from gryphon:gallery with [
				'where': 'status = 1',
				'order': 'created desc',
				'limit': 4
			] %}
			
			<header class="box"><h3 class="more-titles">Galleries <span class="pull-right"><a href="{{ 'gallery'|url }}" style="font-size:11px;">More <i class="icon-chevron-right icon-black"></i></a></span></h3></header>
			<hr class="spacer clearfix" />
			<div class="box bg">
				{% for gal in gals %}
				
					<div class="photo-wrap">
						<a href="{{ gal.urlDefault }}">
							<img src="{{ gal.urlPreview }}" style="max-height:125px;" />
						</a>
					</div>
				
		  	<hr class="half spacer" />
		  	<h4><a href="{{ gal.urlDefault }}">{{ gal.title }}</a></h4>
				<aside class="credit">
					<span class="pull-right">{{ gal.created|timeSince }}</span>

				</aside>
				
				<hr class="double spacer"/>
				{% endfor %}
			</div>
	</div>
	<div class="span4">
		
			{% fetch audio from gryphon:media with [
				'where': 'type = "audio" and status = 1',
				'order': 'created desc',
				'limit': 4
			] %}
			<header class="box"><h3 class="more-titles">Audio <span class="pull-right"><a href="{{ 'multimedia/audio'|url }}" style="font-size:11px;">More <i class="icon-chevron-right icon-black"></i></a></span></h3></header>
			<hr class="spacer clearfix" />
			<div class="box bg">
				{% for aud in audio %}
				  <h4><a href="{{ aud.urlDefault }}">{{ aud.title }}</a></h4>
				  <aside class="credit">
				    {% if aud.authors.length %}
							By {{ aud.authors.splat('name')|join(', ') }}
					{% else %}
							&nbsp;
					{% endif %}
				  <span class="pull-right">{{ aud.created|timeSince }}</span></aside>
				  <hr class="spacer">
					  <a href="{{ aud.urlDefault }}" class="pull-left btn btn-primary audio-button"><i class="icon-play icon-white"></i></a>
						<span class="copy audio-text">{{ aud.caption_formatted|clip(200) }}</span>
				  <hr class="double spacer" />
				{% endfor %}
		</div>
	</div>

</div>