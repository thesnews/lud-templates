{#media/soundSlide_viewer.tpl#}


<div class="image mmb">
	<a href="{{ media.urlMultimedia }}"><img src="{{ media.url }}" /></a>
</div>

<div class="mmb">
	<h3 class="mmb"><span class="mime-soundslide">SLIDESHOW</span> <a href="{{ media.urlMultimedia }}">{{ media.title }}</a></h3>
	
	<p>{{ media.caption_formatted|extract(1) }}</p>
</div>