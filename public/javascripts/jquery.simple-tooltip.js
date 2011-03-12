/*
MIT license
https://github.com/arnklint/simple-jquery-tooltip-plugin
*/
(function($) {
  $.fn.simpleTooltip = function(options){
	  var opts = $.extend({}, $.fn.simpleTooltip.defaults, options);

	  return this.each(function(){
	    var me = $(this);
	    var originalTitle = "";
      me.hover(function(e){
        originalTitle = me.attr('title');
        titleDisplayed = originalTitle && !opts.overrideElementTitle ? originalTitle : opts.title;
        me.attr("title","");
        if(titleDisplayed.length>0){
  	  	  $("body").append("<p id='v-tooltip'>"+titleDisplayed+"</p>");
  	  	  $("#v-tooltip")
  	  	    .animate({opacity: 1.0}, opts.delay)
  	  	  	.css("top",(e.pageY - opts.xOffset) + "px")
  	  	  	.css("left",(e.pageX + opts.yOffset) + "px")
  	  	  	.fadeIn("fast");
  	  	}
      },function(){
        me.attr("title", originalTitle);
  	    $("#v-tooltip").remove();
      });
  	  me.mousemove(function(e){
  	  	$("#v-tooltip")
  	  		.css("top",(e.pageY - opts.xOffset) + "px")
  	  		.css("left",(e.pageX + opts.yOffset) + "px");
  	  });
	  });
	}

  $.fn.simpleTooltip.defaults = {
    title: null,
    xOffset: 10,
    yOffset: 20,
    delay: 400,
    overrideElementTitle: false
  }
})(jQuery);
