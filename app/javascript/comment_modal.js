
  $(document).on('click', ".cbtn", function(e){
    e.preventDefault();
    target = $(this)
    var action_url = target.attr('href')

    var method = target.attr('data-turbo-method')
      $.ajax({url: action_url, type: method, success: function(res){
        $('#commentModal .modal-body').html(res);
      }});
 });

  $(document).on('click',".delete-data", function(e){
    e.preventDefault();
    target = $(this)
    delete_url = target.attr('href')

    var method = target.attr('data-turbo-method')
      $.ajax  ({url: delete_url, type: method, success: function(res){
        target.closest('.comment').remove();
      }});
  });
  



  
  

  