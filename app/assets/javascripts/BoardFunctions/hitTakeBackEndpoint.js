BoardFunctions.hitTakeBackEndpoint = function(){

 var takeBackEndpoint = BoardFunctions.base_url + '/take_back_last_move';

 var takeBackData = {
          move_data: {
            starting_board: BoardFunctions.startingBoardName,
            game_ref: BoardFunctions.gameId
          }
        }

        $.ajax({
          url: takeBackEndpoint,
          type: "POST",
          dataType: 'json',
          data: takeBackData,
          success: function(result){
            console.log("worked i guess?")
            console.log(result)
            BoardFunctions.getDataAndTriggerRebuildFromMongo(BoardFunctions.gameId);
          },
          failure: function(r){
            alert('failed to get any ajaxes :(')
          }
        })
}