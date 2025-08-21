
$(document).on('click', ".follow-btn, .unfollow-btn", function(e){
  e.preventDefault();
  const target = $(this);
  const urls = target.attr('href');
  const method = target.attr('data-turbo-method');
  const userId = target.closest('.user-action').data('user-id'); // get user ID

  $.ajax({
    url: urls,
    type: method,
    success: function(res){
      $(`.user-action[data-user-id="${userId}"]`).replaceWith(res);
    }
  });
});
