  $(document).on('shown.bs.modal', "#notification-modal", function(e){
    e.preventDefault();
    target = $(e.relatedTarget)
    var action_url = target.attr('href')
    $('#notification-modal .modal-body').html('Loading......')
    var method = target.attr('method')
    $.ajax({url: action_url, type: method, success: function(res){
      $('#notification-modal .modal-body').html(res);
    }});
    $(".close-notification").click(function(){
      history.go(0);
    });  
  });


  $(document).on('click', ".delete-notification", function(e){
    e.preventDefault();
    target = $(this)
    var action_url = target.attr('href')
     var method = target.data('method')
     
    $.ajax({url: action_url, type: method, success: function(res){
       target.closest('.notification').remove();
    }});

  });