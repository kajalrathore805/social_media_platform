
$(document).on('shown.bs.modal', "#search-modal", function(e){
  e.preventDefault();
});



$(document).ready(function(){

  $('#search-button').click(function(e){
    e.preventDefault();
    let  searchData =  $("#my-input").val()

    $.ajax({url: "/users", method: "GET",data: {search: searchData}, success: function(res){
      $('#nav-accounts').html(res);
    }});
  });
});

$(document).ready(function(){

  $('#search-button').click(function(e){
    e.preventDefault();
    let  searchData =  $("#my-input").val()

    $.ajax({url: "/posts", method: "GET",data: {search: searchData}, success: function(res){
      $('#nav-posts').html(res);
    }});
  });
});

function myFunction() {
  document.getElementById("my-form").reset();
}