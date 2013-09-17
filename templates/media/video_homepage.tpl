{#media/video_homepage.tpl#}


<script type="text/javascript" src="{{ 'flash/jwplayer/swfobject.js'|url }}"></script>
<div class="jwplayer" id="player-bigvid-{{ media.uid }}" style="width:620px"></div>
<script type="text/javascript">
//<![CDATA[
 $(document).ready(function() {
 var s1 = new SWFObject("{{ 'flash/jwplayer/player.swf'|url }}","ply","620","369","9","#FFFFFF");
  s1.addParam("allowfullscreen","true");
  s1.addParam("allownetworking","all");
  s1.addParam("allowscriptaccess","always");
  s1.addVariable('plugins', 'viral-1');
  s1.addParam("flashvars","file={{ media.urlOriginal }}&image={{ media.url }}&viral.callout=always&viral.onpause=false&viral.link={{ media.url }}&logo=");
  s1.write("player-bigvid-{{ media.uid }}");
});
//]]>
</script>