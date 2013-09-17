{#media/audio.tpl#}


{% if media.extension == 'mp3' %}
	<audio src="{{ media.urlOriginal }}" preload="none" /></audio>
{% else %}
	<a href="{{ media.urlOriginal }}">Download {{ media.extension|upper }} file</a>
{% endif %}