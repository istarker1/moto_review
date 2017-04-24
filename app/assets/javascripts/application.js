// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

let hide_link = (link) => {
  $(link).hide();
};

let show_link = (link) => {
  $(link).show();
};

$(document).ready(function() {
  return $(".vote_link_up").on("ajax:success", function(e, data, status, xhr) {
    alert("header_" + data.id);
    var current_score = parseInt($("#score_" + data.id).text());
    var new_score = current_score + 1;
    hide_link("#vote_up_" + data.id);
    show_link("#vote_down_" + data.id);
    return $("#score_" + data.id).text(new_score);

  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#new_article").append("<p>ERROR</p>");
  });
});

$(document).ready(function() {
  return $(".vote_link_down").on("ajax:success", function(e, data, status, xhr) {
    alert("header_" + data.id);
    var current_score = parseInt($("#score_" + data.id).text());
    var new_score = current_score - 1;
    show_link("#vote_up_" + data.id);
    hide_link("#vote_down_" + data.id);
    return $("#score_" + data.id).text(new_score);

  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#new_article").append("<p>ERROR</p>");
  });
});
