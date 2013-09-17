{#media/video_viewer.tpl#}


<div class="mmb">
	<script type="text/javascript" src="{{ 'flash/jwplayer/swfobject.js'|url }}"></script>
	<div class="jwplayer" id="player-{{ media.uid }}" style="width:380px"></div>
	<script type="text/javascript">
	//<![CDATA[
	 $(document).ready(function() {
	 var s1 = new SWFObject("{{ 'flash/jwplayer/player.swf'|url }}","ply","380","234","9","#FFFFFF");
	  s1.addParam("allowfullscreen","true");
	  s1.addParam("allownetworking","all");
	  s1.addParam("allowscriptaccess","always");
	  s1.addVariable('plugins', 'viral-1');
	  s1.addParam("flashvars","file={{ media.urlOriginal }}&image={{ media.url }}&viral.callout=always&viral.onpause=false&viral.link={{ media.url }}&logo=");
	  s1.write("player-{{ media.uid }}");
	});
	//]]>
	</script>
</div>

<div class="mmb">
	<h3 class="mmb"><span class="mime-video">VIDEO</span> <a href="{{ media.urlMultimedia }}">{{ media.title }}</a></h3>
	
	<p>{{ media.caption_formatted|extract(1) }}</p>
</div>