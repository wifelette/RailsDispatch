(function($){
  var defaults = {handle : '.vote', count : '.count', response_count : 'count'}
  
  $.fn.voting = function(options){
    options = $.extend({}, defaults, options);
    
    var vote_methods = {
      send_vote : function(el, href) {
        $.ajax({
          url : href,
          type : "PUT",
          dataType: 'json',
          data: {method: '_put'},
          success : function(data){
            vote_methods.set_count(el, data)
          }
        });
      },
      set_count : function(el, data) {
        el.find(options['count']).html(data[options['response_count']]);
      }
    };
    
    this.each(function(el){
      var el = $(this);
      el.find(options['handle']).unbind('click').bind('click', function(e){
        vote_methods.send_vote(el, $(this).attr('href'));
        return false;
      });
    });
    
    return this;
  };
})(jQuery);