$(function() {
  var myPhotoId;
  var myPinId;
  var currentPhoto;

  function init() {
    onClickPhotoState();
    onViewMap();
    onOpenRejectModal();
    initValidation();
    onFocusStatus();
  }

  init();

  function onFocusStatus() {
    $('body').popover({
      selector: '.status',
      content: getReason,
      title: 'Reason',
      placement: 'bottom',
      trigger: 'focus',
      container: 'body'
    });
  }

  function getReason() {
    return $(this).parents('td').data('reason');
  }

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
      currentPhoto = $(event.relatedTarget);
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
    var reason = $('#reason-text').val();
    $.ajax({
      url: "/pins/" + myPinId + "/photos/" + myPhotoId,
      type: 'PUT',
      data: { 'photo': {'status': 'rejected', 'reason': reason } },
      success: function(result) {
        setReasonToPhoto(reason);
        displayStatus();
        clearReasonDom();
        showAlert('The photo has been rejected successfully.');
      }
    });
  }

  function setReasonToPhoto(reason) {
    $(currentPhoto).parents('td').data('reason', reason);
  }

  function displayStatus() {
    $('#reason-modal').modal('hide');
    $('#' + myPhotoId).addClass('rejected');
  }

  function clearReasonDom() {
    $('#reason-text').val('');
  }
});
