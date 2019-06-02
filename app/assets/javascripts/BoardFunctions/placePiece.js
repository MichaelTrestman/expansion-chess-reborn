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
  return $piece
}
