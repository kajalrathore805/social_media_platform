
  $(document).on('shown.bs.modal', "#comment-modal", function(e){
    e.preventDefault();
    target = $(e.relatedTarget)
    var action_url = target.attr('href')
    $('#comment-modal .modal-body').html('Loading......')
    var method = target.attr('data-turbo-method')

      $.ajax({url: action_url, type: method, success: function(res){
        $('#comment-modal .modal-body').html(res);
      }});

    $(".close-comment").click(function(){
      history.go(0);
    });  
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
    action_url = target.attr('href')

    var method = target.attr('data-turbo-method')
      $.ajax  ({url: action_url, type: method, success: function(res){
        target.closest('.comment').html(res);
      }});
  });



  $("#edit-comment-form").submit(function(e) {
    e.preventDefault(); 

    var form = $(this);
    var actionUrl = form.attr('action');
    
    $.ajax({type: "PATCH",url: actionUrl, data: form.serialize(), success: function(data)
      {
        $('#edit-form').replaceWith(data);
        form[0].reset();
      }
    });
  });

  


  
  

  