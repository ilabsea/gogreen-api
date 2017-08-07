$(function(){

  $('.photo-state').on('click', function() {
    var $photo = $(this);
    var pinId = $photo.data('pin-id');
    var id = $photo.data('id');
    var status = $photo.data('state') === 'unchecked' ? 'approved' : 'pending' ;

    $.ajax({
      url: "/pins/" + pinId + "/photos/" + id,
      type: 'PUT',
      data: { 'photo': {'status': status} },
      success: function(result) {
        if(result['status'] === 'approved') {
          $photo.data('state', 'check');
          $photo.removeClass('glyphicon-unchecked').addClass('glyphicon-check');
          showAlert('The photo has been approved successfully.');
        } else {
          $photo.data('state', 'unchecked');
          $photo.removeClass('glyphicon-check').addClass('glyphicon-unchecked');
          showAlert('The photo has been change to pending.');
        }
      }
    });

  });

  var myPhotoId;
  var myReason;
  var myPinId;

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

  $('#reason-modal').on('show.bs.modal', function (event) {
    myPhotoId = $(event.relatedTarget).data('id');
    myReason = $('#reason-text').val();
    myPinId = $(event.relatedTarget).data('pinId');
  })

  $('#confirm').on('click', function(e) {
    $.ajax({
      url: "/pins/" + myPinId + "/photos/" + myPhotoId,
      type: 'PUT',
      data: { 'photo': {'status': 'rejected', 'reason': myReason} },
      success: function(result) {
        $('#reason-modal').modal('hide');
        $('#' + myPhotoId).addClass('rejected');

        showAlert('The photo has been rejected successfully.');
      }
    });
  })

  function showAlert(message){
    $('#alert-message').html(message);
    $('.alert').fadeIn(100, function() {
      $('.alert').fadeOut(3000);
    });
  }
});
