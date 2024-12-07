BoardFunctions.watchAndbuildBoardFromMongo = function( id ){
  setInterval(function(){

    if (false){
      BoardFunctions.getDataAndTriggerRebuildFromMongo(id);
    }
    if (true){
      BoardFunctions.getMoveIfItIsAITurn();
    }
   }, 1000);

}


BoardFunctions.getDataAndTriggerRebuildFromMongo = function(id){
  var mongoDataEndpoint = BoardFunctions.base_url + '/mongo_data';

  $.ajax({
    url: mongoDataEndpoint,
    contentType: "application/json",
    dataType: 'json',
    data: {game_id: id},
    success: function(result){
      BoardFunctions.buildBoardFromMongo(result);
    },
    failure: function(r){
      alert('failed to get any mongo ajaxes!!')
    }
  })

}


BoardFunctions.buildBoardFromMongo = function(gameData){

  $('.piece').remove();
  BoardFunctions.clearMoves();
  BoardFunctions.startingBoardName = gameData['name'];
  BoardFunctions.playerSides = gameData.playerSides;
  var currentPiecePositions = gameData.boardStack[gameData.boardStack.length - 1];

  BoardFunctions.currentPiecePositions = currentPiecePositions;

  if (currentPiecePositions==undefined) {
    throw "missing board :("
  }
  BoardFunctions.loadPieces(currentPiecePositions);
  BoardFunctions.setWalls(gameData.walls);
  BoardFunctions.setUpgradeSquares(gameData.upgradeSquares);
  BoardFunctions.setTurn(gameData.turn);
  BoardFunctions.initializeSquares();

}
