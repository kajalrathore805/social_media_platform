
  $(document).on('shown.bs.modal', "#commentModal", function(e){
    e.preventDefault();
    target = $(e.relatedTarget)
    var action_url = target.attr('href')
    $('#commentModal .modal-body').html('Loading......')
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

  $(document).on('click',".edit-comment", function(e){
    e.preventDefault();
    target = $(this)
    delete_url = target.attr('href')

    var method = target.attr('data-turbo-method')
      $.ajax  ({url: delete_url, type: method, success: function(res){
        target.closest('.comment').html(res);
      }});
  });

  $(".edit-comment").submit(function(e) {
    e.preventDefault(); 

    var form = $(this);
    var actionUrl = form.attr('action');
    
    $.ajax({type: "POST",url: actionUrl, data: form.serialize(), success: function(data)
        {
          $('.edit-comment-form').append(data);
          form[0].reset()
        }
    });
});



  
  

  