{#media/audio_viewer.tpl#}


<div class="mmb">
	<script type="text/javascript" src="{{ 'flash/1pxout/audio-player.js'|url }}"></script>
	<object type="application/x-shockwave-flash" data="{{ 'flash/1pxout/player.swf'|url }}" id="audioplayer1" height="30" width="300">
	<param name="movie" value="{{ 'flash/1pxout/player.swf'|url }}">
	<param name="FlashVars" value="playerID=1&amp;soundFile={{ media.urlOriginal }}&amp;leftbg=0x666666&amp;lefticon=0xffffff">
	<param name="quality" value="high">
	<param name="menu" value="false">
	<param name="wmode" value="transparent">
	</object>
</div>
	
<div class="mmb">
	<h3 class="mmb"><span class="mime-audio">AUDIO</span> <a href="{{ media.urlMultimedia }}">{{ media.title }}</a></h3>
	
	<p>{{ media.caption_formatted|extract(1) }}</p>
</div>