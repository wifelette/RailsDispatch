$("div#person_bio").html("<%= escape_javascript(render :partial => 'contributor_bio') %>");
$('div#questions').html("<%= escape_javascript(render :partial => 'questions') %>");
$('div#posts').html("<%= escape_javascript(render :partial => 'posts') %>")
$("div#person_bio").show();
$(".person_thumb").removeClass("loading");
$(".person_thumb").addClass("active");
$('[rel=tipsy]').tipsy({gravity: 's'});