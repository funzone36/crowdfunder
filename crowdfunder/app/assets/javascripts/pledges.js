

$(function(){
  alert("first alert")
    $('#pledge >li > a').on('click', function(eventObject){
      alert("hey")
      console.log("clicked")
      eventObject.preventDefault();
      $.ajax({
      url: $(this).attr('href'),
      method: 'get',
      data: {},
      dataType: 'json'
    }).done(function(responseData) {
      console.log("hello")
    }).fail(function(){
      console.log("fail");
    })
    });
});


$(function(){
    console.log("works");
});
