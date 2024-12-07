BoardFunctions.isPlayersTurn = function()
{}
BoardFunctions.watchAndbuildBoardFromMongo = function( id ){
  setInterval(function(){
    
    BoardFunctions.getDataAndTriggerRebuildFromMongo(id);
    
    // if (true){
    //   BoardFunctions.getMoveIfItIsAITurn();
    // }
   }, 3000);

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
  if(BoardFunctions.turn === gameData.turn){}else{
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
    console.log("setting turn!")
    console.log(gameData.turn)
    BoardFunctions.initializeSquares();
  }
}
