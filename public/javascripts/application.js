function initialize() {

  // logger
  window.log = function(){
    log.history = log.history || [];
    log.history.push(arguments);
    window.console && console.log[console.firebug ? 'apply' : 'call'](console, Array.prototype.slice.call(arguments));
  }
  
  window.logargs = function(context){
    log(context,arguments.callee.caller.arguments); 
  }

  application = {
    authenticity_token: $('meta[name=authenticity_token]').attr('content')
  }
}

$.fn.load_bio = function(options) {  
  $("#contributors_page .person_thumb").live("click", function(event) {
    $(this).removeClass("active");
    $(this).addClass("loading");
    $(this).prepend("<span class='bio_loader'></span>")
    $.getScript(this.href);
    event.preventDefault();
  });
};

$.fn.load_more = function(options) {  
  $("#load_more").live("click", function(event) {
    $(this).addClass("loading")
    $("#load_more span").html("Loading...")
    $.getScript(this.href);
    event.preventDefault();
  });
};

// New Gold Leaf Form Helper Text Plugin for jQuery $('input').helper('inactive_class')
(function($){
$.fn.helper = function(helperText) {
  return this.each(function() {

    var tag = this.tagName
    
    if (jQuery(this).val() != "") {
      jQuery(this).next().hide();
    }
    
    jQuery(this).next().click(function () {
      jQuery(this).prev(tag).focus();
      jQuery(this).hide();
    });
    
    
    jQuery(this).focus(function () {
      jQuery(this).next().hide();
    });
    
    jQuery(this).blur(function () {
      if (jQuery(this).val() == "") {
        jQuery(this).next().fadeIn("fast");
      };
    });
    
  });
};
})(jQuery);


$(document).ready(function () {
  // $("select, input, textarea").uniform();
  
  $('#newsletter_input').helper('inactive_class');

  $('a[rel=tipsy]').tipsy({gravity: 's'});

  $("a.close_alert").click(function(event) {
    $("div.alert").fadeOut("fast");
  });
  
  // load bio
  $(".person_thumb").load_bio();
  
  // load more style pagination
  $("#load_more").load_more();

  $.ajaxSetup({
    'beforeSend' : function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
  });
});