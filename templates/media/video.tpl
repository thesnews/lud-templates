<!--media/video.tpl-->

<video id="lud_video_{{ media.uid }}" class="video-js vjs-default-skin" controls
  preload="auto" width="100%" height="auto" poster="{{ media.url }}"
  data-setup="{}">
  <source src="{{ media.urlOriginalMp4 }}" type='video/mp4'>
  <source src="{{ media.urlOriginalWebm }}" type='video/webm"'>
  <source src="{{ media.urlOriginalOgg }}" type='video/ogg; codecs="theora, vorbis"'>
</video>
<script type="text/javascript">
    // Once the video is ready
    _V_("lud_video_{{ media.uid }}").ready(function(){

        var myPlayer = this;  // Store the video object
        var aspectRatio = 9/16; // Make up an aspect ratio

        function resizeVideoJS(){
              // Get the parent element's actual width
              var width = document.getElementById(myPlayer.id).parentElement.offsetWidth;
              myPlayer.width(width).height( width * aspectRatio ); // Set width to fill parent element, Set height
        }

        resizeVideoJS(); // Initialize resizeVideoJS()
        window.onresize = resizeVideoJS; // Call resizeVideoJS() on window.resize();
    });
</script>
