$("div#feed_container").append("<%= escape_javascript(render :partial => 'feed_entry', :collection => @feed_entries) %>");
$("div#feed_pagination").html("<%= escape_javascript(render 'feed_pagination') %>");
$("#load_more").removeClass("loading");
$("#load_more span").html("Load more");
