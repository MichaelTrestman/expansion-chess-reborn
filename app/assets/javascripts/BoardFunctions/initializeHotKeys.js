
BoardFunctions.initializeHotKeys = function(){
    $(document).on('keypress', function(e){
    console.log('key pressed!')
    var key = e.keyCode
    console.log(key)
    var $board = $('#board')
    if (key == 116) {
      console.log('taking it back');
      if (confirm("do you want to take back your move?")){
        BoardFunctions.hitTakeBackEndpoint();
      }

    } else if (key == 93) {

      var currentScale = $board.css('transform')

      var matrixRegex = /matrix\((-?\d*\.?\d+),\s*0,\s*0,\s*(-?\d*\.?\d+),\s*0,\s*0\)/;

      var matches = currentScale.match(matrixRegex);

      var xScale = parseFloat(matches[1]);
      var yScale = parseFloat(matches[2]);

      xScale = ( xScale + 0.05 ).toString();
      yScale = ( yScale + 0.05 ).toString();

      $board.css('transform', 'scale(' + xScale + ',' + yScale + ')')
    } else if (key==88 || key ==120){
      BoardFunctions.clearMoves();
    } else if (key == 91) {
      var $board = $('#board')
      var currentScale = $board.css('transform')

      var matrixRegex = /matrix\((-?\d*\.?\d+),\s-?\d*\.?\d+,\s-?\d*\.?\d+,\s*(-?\d*\.?\d+),\s*\d*\.?\d+,\s*\d*\.?\d+\)/;

      var matches = currentScale.match(matrixRegex);

      var xScale = parseFloat(matches[1]);
      var yScale = parseFloat(matches[2]);

      xScale = ( xScale - 0.05 ).toString();
      yScale = ( yScale - 0.05 ).toString();

      $board.css('transform', 'scale(' + xScale + ',' + yScale + ')')
    } else if ( key == 100) {

      var left = $board.css('left').match(/\d+/)[0]
      left = (parseInt(left) + 22).toString() + 'px';
      $board.css('left', left)
    } else if ( key == 97) {

      var left = $board.css('left').match(/\d+/)[0]
      left = (parseInt(left) - 22).toString() + 'px';
      $board.css('left', left)
    } else if ( key == 119) {
      console.log('raising!')
      var top = $board.css('top').match(/\d+/)[0]
      top = (parseInt(top) - 22).toString() + 'px';
      $board.css('top', top)
      console.log($board.css('top'))
    } else if ( key == 115) {
      console.log('lowering!')
      var top = $board.css('top').match(/\d+/)[0]
      top = (parseInt(top) + 22).toString() + 'px';
      $board.css('top', top)
    }
  })
}