BoardFunctions.buildBoardFromSnapshot = function(snapshot){
  $('.piece').remove();
  BoardFunctions.clearMoves();
  var gameData = snapshot.val();
  BoardFunctions.startingBoardName = gameData['starting board name'];
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

BoardFunctions.setWalls = function(walls){
  $.each(walls, function(i, wall){
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
  $this.off('click');
  $this.on('click', function(){
    BoardFunctions.clearMoves();

    var $thisPiece = $this.find('.piece');

    var selectedPieceData = {
      posx: $thisPiece.attr('data-posX'),
      posy: $thisPiece.attr('data-posY'),
      side: $thisPiece.attr('data-side'),
      type: $thisPiece.attr('data-type')
    }

    BoardFunctions.selectedPieceData = selectedPieceData;
    BoardFunctions.selectedPieceSquare = $this;
    BoardFunctions.$selectedPiece = $this.find('.piece');

    var moves = BoardFunctions.getMoves(
      BoardFunctions.startingBoardName,
      BoardFunctions.currentPiecePositions,
      selectedPieceData
    );

  })
}

BoardFunctions.getMoves = function(startingBoardName, currentPiecePositions, selectedPiece){
  var movesEndpoint = BoardFunctions.base_url + '/calculate_moves';

  var moveData = {
    move_data: {
      starting_board: startingBoardName,
      chosen_piece: selectedPiece,
      game_ref: BoardFunctions.gameId
    }
  }

  var moves;

  $.ajax({
    url: movesEndpoint,
    contentType: "application/json",
    dataType: 'json',
    data: moveData,
    success: function(result){
      $.each(result, BoardFunctions.makeMovable);
    },
    failure: function(r){
      alert('failed to get any ajaxes :(')
    }
  })




}

BoardFunctions.clearMoves = function(){
  var $movable = $('.square.movable');
  $('.pending').removeClass('pending');
  $movable.off('click');
  $movable.removeClass('movable');
}
BoardFunctions.makeMovable = function(_, move){

  var $square = $('.square#posx-'+ move.posx + 'posy-' + move.posy);

  $square.addClass('movable');
  $square.off('click');
  $square.on('click', function(){
    $square.off('click');

    var pendingPiece = {
      posx: move.posx,
      posy: move.posy,
      side: BoardFunctions.selectedPieceData.side,
      type: BoardFunctions.selectedPieceData.type
    }

    var $pendingKilledPiece = $square.find('.piece');

    $pendingKilledPiece.remove();
    var pendingKilledPieceData = {
      posx: $pendingKilledPiece.attr('data-posX'),
      posy: $pendingKilledPiece.attr('data-posY'),
      side: $pendingKilledPiece.attr('data-side'),
      type: $pendingKilledPiece.attr('data-type')
    }


    var $pendingPiece = BoardFunctions.placePiece(null, pendingPiece);
    BoardFunctions.$selectedPiece.remove();
    $pendingPiece.addClass('pendingPiece');



    $(this).addClass('pending');
    BoardFunctions.selectedPieceSquare.addClass('pending');

    setTimeout(function(){
      if (confirm("do you want to submit this move?")){
        BoardFunctions.clearMoves();


        var submitMoveEndpoint = BoardFunctions.base_url + '/submit_move';

        var proposed_move = {
          posx: move.posx,
          posy: move.posy,
          killed_piece_type: null,
          killed_piece_side: null
        }

        var $pieceToKill = $pendingKilledPiece;

        if ($pieceToKill.length > 0){
          proposed_move.killed_piece_type = $pieceToKill.attr('class').match(/piece-(\w+)/)[1];
          proposed_move.killed_piece_side = $pieceToKill.attr('class').match(/side-(\w+)/)[1];
        }


        var moveData = {
          move_data: {
            starting_board: BoardFunctions.startingBoardName,
            chosen_piece: BoardFunctions.selectedPieceData,
            game_ref: BoardFunctions.gameId,
            proposed_move: proposed_move
          }
        }
        movestring = JSON.stringify(moveData)
        console.log('movestring')
        console.log(movestring);

        $.ajax({
          url: submitMoveEndpoint,
          type: "POST",
          dataType: 'json',
          data: moveData,
          success: function(result){
            console.log("worked i guess?")
            console.log(result)
            BoardFunctions.getDataAndTriggerRebuildFromMongo(BoardFunctions.gameId);
          },
          failure: function(r){
            alert('failed to get any ajaxes :(')
          }
        })
        $('.pendingPiece').removeClass('pendingPiece');
      } else {
        BoardFunctions.clearMoves();
        $square.find('.piece').remove();
        BoardFunctions.placePiece(null, BoardFunctions.selectedPieceData);
        BoardFunctions.placePiece(null, pendingKilledPieceData);
      }
    }, 0)
  })
}