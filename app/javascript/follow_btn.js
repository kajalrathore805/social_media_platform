$(document).on('click', ".follow-btn, .unfollow-btn", function(e){
   e.preventDefault();
   target = $(this)
   var urls = target.attr('href')
   var method = target.attr('data-turbo-method')
    $.ajax({url: urls, type: method, success: function(res){
      target.closest('.user-action').replaceWith(res)
    }});
  });