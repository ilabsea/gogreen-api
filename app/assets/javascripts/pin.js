$(function() {
  var myPhotoId;
  var myPinId;

  function init() {
    onClickPhotoState();
    onViewMap();
    onOpenRejectModal();
    initValidation();
  }

  init();

  function onClickPhotoState() {
    $('.photo-state').on('click', function() {
      var photo = $(this);
      var pinId = photo.data('pin-id');
      var id = photo.data('id');
      var status = photo.data('state') === 'unchecked' ? 'approved' : 'pending' ;

      $.ajax({
        url: "/pins/" + pinId + "/photos/" + id,
        type: 'PUT',
        data: { 'photo': {'status': status} },
        success: function(result) {
          if(result['status'] === 'approved') {
            photo.data('state', 'check');
            photo.removeClass('glyphicon-unchecked').addClass('glyphicon-check');
            showAlert('The photo has been approved successfully.');
          } else {
            photo.data('state', 'unchecked');
            photo.removeClass('glyphicon-check').addClass('glyphicon-unchecked');
            showAlert('The photo has been change to pending.');
          }
        }
      });

    });
  }

  function onViewMap() {
    $('#map-modal').on('shown.bs.modal', function (e) {
      google.maps.event.trigger(map, "resize");
      var button = $(e.relatedTarget);
      var position = new google.maps.LatLng(button.data('lat'), button.data('lng'));
      var icon = button.data('icon')

      if (marker && marker.setPosition) {
        marker.setPosition(position);
        marker.setIcon('/assets/'+icon+'-small.png');
      } else{
        marker = new google.maps.Marker({
                      position: position,
                      map: map,
                      title: 'Pin',
                      icon: '/assets/'+icon+'-small.png'
                });
      }

      map.setCenter(position);
    })
  }

  function onOpenRejectModal() {
    $('#reason-modal').on('show.bs.modal', function (event) {
      myPhotoId = $(event.relatedTarget).data('id');
      myPinId = $(event.relatedTarget).data('pinId');
    })
  }

  function showAlert(message){
    $('#alert-message').html(message);
    $('.alert').fadeIn(100, function() {
      $('.alert').fadeOut(3000);
    });
  }

  function initValidation() {
    $('#myForm').validator().on('submit', function (e) {
      if (e.isDefaultPrevented()) { return; }

      e.preventDefault();
      submitForm();
    })
  }

  function submitForm() {
    $.ajax({
      url: "/pins/" + myPinId + "/photos/" + myPhotoId,
      type: 'PUT',
      data: { 'photo': {'status': 'rejected', 'reason': $('#reason-text').val() } },
      success: function(result) {
        displayStatus();
        clearReasonDom();
        showAlert('The photo has been rejected successfully.');
      }
    });
  }

  function displayStatus() {
    $('#reason-modal').modal('hide');
    $('#' + myPhotoId).addClass('rejected');
  }

  function clearReasonDom() {
    $('#reason-text').val('');
  }
});
