BoardFunctions.watchAndUpdateBoard = function(boardPath){
  firebase.database().ref(boardPath)
    .on('value', BoardFunctions.buildBoardFromSnapshot);
}

BoardFunctions.buildBoardFromSnapshot = function(snapshot){
  var gameData = snapshot.val();
  var playerSides = gameData.playerSides;
  var currentPiecePositions = gameData.boardStack[gameData.boardStack.length - 1];
  if (currentPiecePositions==undefined) {
    throw "missing board :("
  }
  BoardFunctions.loadPieces(currentPiecePositions);
  BoardFunctions.setWalls(gameData.walls);
  BoardFunctions.setUpgradeSquares(gameData.upgradeSquares);
  BoardFunctions.setTurn(gameData.turn);
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

BoardFunctions.placePiece = function(_, piece){
  var $piece = $("<div></div>")
    .addClass('piece')
    .addClass('piece-' + piece.type)
    .addClass('side-' + piece.side)
    .attr('draggable', 'false')
    .attr('data-type', piece.type)
    .attr('data-side', piece.side)
    .attr('data-posX', piece.posx)
    .attr('data-posY', piece.posy);
    // .css('transform', pieceRotation);

  var svgText = PieceSVG[piece.type];
  var $svg = $(svgText).attr('transform', 'scale(2,2)');

  var colorToStroke;
  if (piece.side == 'black' || piece.side == 'blue'){
    colorToStroke = 'white';
  } else {
    colorToStroke = 'black';
  }

  var $paths = $svg.find('path');
  $paths.attr('fill', piece.side).css('fill', piece.side);
  $paths.attr('fill', piece.side);
  var $filledThings = $svg.find('[fill="ffffff"]');
  $filledThings.attr('fill', piece.side).css('fill', piece.side);


  $piece.append($svg)
  var $square = $('#posx-' + piece.posx +'posy-' + piece.posy);
  $square.append($piece);

}
BoardFunctions.setTurn = function(playerWhosTurn) {
  console.log(playerWhosTurn)
}

