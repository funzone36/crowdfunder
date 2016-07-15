

$(function(){
    $('#pledge >li > a').on('click', function(eventObject){
      eventObject.preventDefault();
      $.ajax({
      url: $(this).attr('href'),
      method: 'get',
      data: {},
      dataType: 'html'
    }).done(function(responseData) {
      $('#pledge').append(responseData)
    }).fail(function(){
      console.log("fail");
    })
    });
});
