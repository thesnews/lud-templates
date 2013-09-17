{#media/image_viewer.tpl#}


<div class="mmb">
	<img src="{{ media.url }}" alt="{{ media.base_name }}" />
</div>

<div class="mmb">
	<h3 class="mmb"><span class="mime-video">VIDEO</span> <a href="{{ media.urlMultimedia }}">{{ media.title }}</a></h3>

	<p>{{ media.caption_formatted|extract(1) }}</p>
</div>