BoardFunctions.watchAndUpdateBoard = function(boardPath){
  firebase.database().ref(boardPath)
    .on('value', function(snapshot){
      BoardFunctions.buildBoardFromSnapshot(snapshot);
      BoardFunctions.getMoveIfItIsAITurn();
    });
}

