

$(function(){
    $('#pledge >li > a').on('click', function(eventObject){
      eventObject.preventDefault();
      $.ajax({
      url: $(this).attr('href'),
      method: 'get',
      data: {},
      dataType: 'json'
    }).done(function(responseData) {
      console.log(responseData)
    }).fail(function(){
      console.log("fail");
    })
    });
});
