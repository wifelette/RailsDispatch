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
  $(".person_thumb").click(function(event) {
    $(this).addClass("loading");
    $(this).prepend("<span class='bio_loader'></span>")
    
    $.ajax({
      url: this.href,
      dataType: 'json',
      success: function(html){
        $("#person_bio").append(html);
        $("#person_bio").addClass("active");
        $(".person_thumb").removeClass("loading");
      }
    });
    
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
  })


  // load bio
  $(".person_thumb").load_bio();

});