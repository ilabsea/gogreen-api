$(function(){

  $('.photo-state').on('click', function(){
    var $photo = $(this);
    var pinId = $photo.data('pin-id');
    var id = $photo.data('id');
    var isApproved = $photo.data('state') === 'unchecked' ? true : false ;

    $.ajax({
        url: "/pins/"+pinId+"/photos/"+id,
        type: 'PUT',
        data: { 'photo': {'is_approved': isApproved} },
        success: function(result) {
          if(result['is_approved'] === true){
            $photo.data('state', 'check');
            $photo.removeClass('glyphicon-unchecked').addClass('glyphicon-check');
          }else{
            $photo.data('state', 'unchecked');
            $photo.removeClass('glyphicon-check').addClass('glyphicon-unchecked');
          }
          showAlert('You successfully approve the photo.');

        }
    });

  });

  $('.delete-photo').on('click', function(){
    var result = confirm("Are you sure, you want to delete this photo?");
    if (result) {
      var pinId = $(this).data('pin-id');
      var id = $(this).data('id');

      $.ajax({
          url: "/pins/"+pinId+"/photos/"+id,
          type: 'DELETE',
          success: function(result) {
            showAlert('Photo has been deleted.');
            $('#'+id).remove();
          }
      });
    }
  });

  $('#map-modal').on('shown.bs.modal', function (e) {
    google.maps.event.trigger(map, "resize");
    var button = $(e.relatedTarget);
    var position = new google.maps.LatLng(button.data('lat'), button.data('lng'));
    var icon = button.data('icon')

    if(marker && marker.setPosition){
      marker.setPosition(position);
      marker.setIcon('/assets/'+icon+'-small.png');
    }else{
      marker = new google.maps.Marker({
                    position: position,
                    map: map,
                    title: 'Pin',
                    icon: '/assets/'+icon+'-small.png'
              });
    }

    map.setCenter(position);

  })


  function showAlert(message){
    $('#alert-message').html(message);
    $('.alert').fadeIn(2000, function(){
      $('.alert').fadeOut(2000);
    });
  }


});
