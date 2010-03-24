$("div#person_bio").html("<%= escape_javascript(render :partial => 'contributor_bio') %>");
$("div#person_bio").show();
$(".person_thumb").removeClass("loading");
$(".person_thumb").addClass("active");