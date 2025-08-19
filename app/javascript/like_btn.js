$(document).on('click', ".like-btn, .unlike-btn", function(e){
   e.preventDefault();
   target = $(this)
   var urls = target.attr('href')
   var method = target.attr('data-turbo-method')
    $.ajax({url: urls, type: method, success: function(res){
      target.closest('.post-action').replaceWith(res)
    }});
  });