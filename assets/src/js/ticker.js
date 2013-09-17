// jQuery(document).ready(function($) {
// 	var ticker = function()
// 	{
// 		setTimeout(function(){
// 			$("ul.ticker-list li:first").animate( {marginTop: '-30px'}, 800, function()
// 			{
// 				$(this).detach().appendTo("ul.ticker-list").removeAttr("style");
// 			});
// 			ticker();
// 		}, 5000);
// 	};
// 	ticker();

// });

(function($) {
	$(function() {
		$('#header-ticker .span8 li').hide();
		$('#header-ticker .span8 ul').children().first().show();
		var current = 0,
			total = $('#header-ticker .span8 ul').children().length;
		setInterval(function() {
			var next = current + 1;
			if( next >= total ) {
				next = 0;
			}
			$($('#header-ticker .span8 ul').children().get(current)).slideUp(function() {
				$($('#header-ticker .span8 ul').children().get(next)).slideDown();
			});
			current = next;
		}, 5000);
	});
})(jQuery);