function notify(message, level) {
  if (level === undefined) level = "info";
  // display a notification under the page header
  $('<div class="alert alert-' + level + '">' + message + '</div>').
    appendTo('.footer').
    delay(5000).
    fadeOut(500, function() {
      $(this).remove()
    });
}

