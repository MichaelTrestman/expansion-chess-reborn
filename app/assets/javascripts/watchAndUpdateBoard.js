BoardFunctions.watchAndUpdateBoard = function(boardPath){
  firebase.database().ref(boardPath)
    .on('value', BoardFunctions.buildBoardFromSnapshot);
}

BoardFunctions.buildBoardFromSnapshot = function(snapshot){
  var gameData = snapshot.val();
  BoardFunctions.startingBoardName = gameData['starting board name'];
  var playerSides = gameData.playerSides;
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

BoardFunctions.setWalls = function(walls){
  $.each(walls, function(_, wall){
    var $square = $('div.square#posx-'+wall.posx+'posy-'+wall.posy).addClass('wall');
  })
}

BoardFunctions.setUpgradeSquares = function(upgradeSquares){
  $.each(upgradeSquares, function(_, upgradeSquare){
    var $square = $('div.square#posx-'+upgradeSquare.posx+'posy-'+upgradeSquare.posy).addClass('upgrade');
  })
}

BoardFunctions.loadPieces = function(pieces){
  $.each(pieces, BoardFunctions.placePiece)
}


BoardFunctions.setTurn = function(playerWhosTurn) {
  BoardFunctions.turn = playerWhosTurn;
  $('#turn-indicator').text(playerWhosTurn);
}

BoardFunctions.initializeSquares = function(){
  var activeSquareSelector = '.square:has(div.piece.side-'+ BoardFunctions.turn  +')';

  $(activeSquareSelector).each(BoardFunctions.initializeSquare);
}

BoardFunctions.initializeSquare = function(){
  var $this = $(this);
  $this.on('click', function(){
    var $thisPiece = $this.find('.piece');



    var selectedPieceData = {
      posx: $thisPiece.attr('data-posX'),
      posy: $thisPiece.attr('data-posY'),
      side: $thisPiece.attr('data-side'),
      type: $thisPiece.attr('data-type')
    }
    console.log(selectedPieceData)

    var moves = BoardFunctions.getMoves(
      BoardFunctions.startingBoardName,
      BoardFunctions.currentPiecePositions,
      selectedPieceData
    );
    $.each(moves, BoardFunctions.displayMove);
  })
}

BoardFunctions.getMoves = function(startingBoardName, currentPiecePositions, selectedPiece){

  var movesEndpoint = BoardFunctions.base_url;

  //make request to calculate moves endpoint
  return []
}

BoardFunctions.displayMove = function(){
  console.log('attempting to display move :/');
}