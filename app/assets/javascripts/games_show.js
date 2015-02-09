$( document ).ready(function() {

// Games page wlil auto-refresh
  var $timestampDiv = $('#game-timestamp');
  var gameTimestamp = $timestampDiv.attr('gameTimestamp')
  var roundTimestamp = $timestampDiv.attr('roundTimestamp')
  var gameId = $timestampDiv.attr('game-id')
  // console.log(gameTimestamp)
  // console.log(roundTimestamp)

  var interval = 2000;  // 1000 = 1 second, 3000 = 3 seconds
  function checkForGameChanges() {
    $.ajax({
            type: 'PATCH',
            url: '/games/' + gameId,
            data: { },
            dataType: 'json',
            success: function (data) {
                    // console.log("Success!")
                    // console.log(data)

                    // Do NOT use !== here; the data types are not the same
                    if ((gameTimestamp != data.gameTimestamp) || (roundTimestamp != data.roundTimestamp)) {
                      location.reload()
                    }
            },
            complete: function (data) {
                    setTimeout(checkForGameChanges, interval);
            }
    });
  }

  // initial checkForGameChanges, don't remove this condition (it checks that the route is actually games#show)
  if (gameTimestamp && roundTimestamp) {
    setTimeout(checkForGameChanges, interval);
  }

});