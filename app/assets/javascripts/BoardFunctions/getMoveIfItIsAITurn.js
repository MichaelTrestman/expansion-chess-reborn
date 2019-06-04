BoardFunctions.getMoveIfItIsAITurn = function(){
  if (BoardFunctions.playerSides[BoardFunctions.turn] == 'ai'){

    var ai_move_data = {
      move_data: {
        starting_board: BoardFunctions.startingBoardName,
        game_ref: BoardFunctions.gameRef
      }
    }

    var ai_move_endpoint = BoardFunctions.base_url + '/ai_move';

    $.ajax({
      url: ai_move_endpoint,
      contentType: "application/json",
      dataType: 'json',
      data: ai_move_data,
      success: function(result){
        console.log('ai should be moving soon...')
      },
      failure: function(r){
        alert('failed to get any ajaxes :(')
      }
    })




  }
}