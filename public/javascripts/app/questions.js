(function($){
  var defaults = {
    handle : '.vote', count : '.count', response_count : 'count', 
    message : 'message', message_class : 'notice', message_tag : 'div', 
    messages_selector : '#messages', up : 'up', down : 'down'
  }
  
  $.fn.voting = function(options){
    var options = $.extend({}, defaults, options);
    
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
        count = el.find(options['count']).html();
        new_count = data[options['response_count']];
        if (count < new_count) el.addClass(options['up']).removeClass(options['down']);
        else if (count > new_count) el.addClass(options['down']).removeClass(options['up']);
        
        el.find(options['count']).html(data[options['response_count']]);
        
        if (data[options['message']]) {
          message = $("<"+options['message_tag']+" class='"+options['message_class']+"'/>").append(data[options['message']]);
          message.appendTo(options['messages_selector']).delaySlideUp();
        }
      }
    };
    
    // turns off rails ujs
    this.find(options['handle']).each(function(){ $(this).attr('data-method', '') });
    
    this.each(function(el){
      var el = $(this);
      el.find(options['handle']).unbind('click').bind('click', function(e){
        e.preventDefault();
        vote_methods.send_vote(el, $(this).attr('href'));
        return false;
      });
    });
    
    return this;
  };
})(jQuery);