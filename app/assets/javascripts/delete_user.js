$(document).ready(function() {
  $('body').on('click', '.delete', function(e) {
    var id = $(this).data('id')
    var childLi = $(this).closest('li')
    $.ajax({
      url: '/users/' + id,
      type: 'delete'
    })

    .done(function() {
      childLi.hide();
    })
    return false;
  })
})
