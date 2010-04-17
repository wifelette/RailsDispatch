(function($){
  var defaults = {up : '.up', down : '.down'}
  
  $.fn.voting = function(options){
    options = $.extend({}, defaults, options);
    
    this.each(function(el){
      var el = $(this);
      el.find(options['up']).click(function(e){
        alert("vote up");
      });
      
      el.find(options['down']).click(function(e){
        alert('vote down');
      });
    });
    
    return this;
  };
})(jQuery);