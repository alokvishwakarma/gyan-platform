
INSERT INTO daily_puzzles (
  puzzle_date,
  puzzle_number,
  stage,
  board_size,
  max_moves,
  mystery_count,
  start_board_json,
  solved_board_json,
  solution_moves_json,
  mystery_reveal_order_json,
  verified,
  status
)
VALUES (
  '2026-08-08',
  219,
  '5x5',
  5,
  5,
  5,
  '[{"id":1,"color":"red","hidden":true},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"green","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"red","hidden":false},{"id":5,"color":"red","hidden":false},{"id":11,"color":"orange","hidden":true},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"yellow","hidden":true},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":18,"color":"purple","hidden":true},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":21,"color":"purple","hidden":true},{"id":23,"color":"blue","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"yellow","hidden":false}]',
  '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"red","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"blue","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"yellow","hidden":false}]',
  '[{"from":{"row":4,"column":1},"to":{"row":4,"column":0}},{"from":{"row":1,"column":4},"to":{"row":0,"column":4}},{"from":{"row":1,"column":3},"to":{"row":0,"column":3}},{"from":{"row":1,"column":2},"to":{"row":0,"column":2}},{"from":{"row":1,"column":1},"to":{"row":0,"column":1}}]',
  '[1,11,14,18,21]',
  1,
  'draft'
)
ON CONFLICT(
  puzzle_date,
  stage
)
DO UPDATE SET
  puzzle_number =
    excluded.puzzle_number,
  board_size =
    excluded.board_size,
  max_moves =
    excluded.max_moves,
  mystery_count =
    excluded.mystery_count,
  start_board_json =
    excluded.start_board_json,
  solved_board_json =
    excluded.solved_board_json,
  solution_moves_json =
    excluded.solution_moves_json,
  mystery_reveal_order_json =
    excluded.mystery_reveal_order_json,
  verified = 1,
  status = 'draft',
  updated_at =
    CURRENT_TIMESTAMP;


INSERT INTO daily_puzzles (
  puzzle_date,
  puzzle_number,
  stage,
  board_size,
  max_moves,
  mystery_count,
  start_board_json,
  solved_board_json,
  solution_moves_json,
  mystery_reveal_order_json,
  verified,
  status
)
VALUES (
  '2026-08-08',
  219,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"red","hidden":true},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"orange","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"red","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"red","hidden":false},{"id":7,"color":"red","hidden":false},{"id":15,"color":"orange","hidden":true},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"yellow","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"orange","hidden":true},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"blue","hidden":true},{"id":27,"color":"green","hidden":false},{"id":28,"color":"yellow","hidden":false},{"id":29,"color":"purple","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"green","hidden":true},{"id":33,"color":"yellow","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"green","hidden":false},{"id":38,"color":"yellow","hidden":true},{"id":39,"color":"purple","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"blue","hidden":false},{"id":42,"color":"green","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":43,"color":"yellow","hidden":true},{"id":45,"color":"orange","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"yellow","hidden":false},{"id":49,"color":"purple","hidden":false}]',
  '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"red","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"red","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"orange","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"yellow","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"blue","hidden":false},{"id":27,"color":"green","hidden":false},{"id":28,"color":"yellow","hidden":false},{"id":29,"color":"purple","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"green","hidden":false},{"id":33,"color":"yellow","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"green","hidden":false},{"id":38,"color":"yellow","hidden":false},{"id":39,"color":"purple","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"blue","hidden":false},{"id":42,"color":"green","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"orange","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"yellow","hidden":false},{"id":49,"color":"purple","hidden":false}]',
  '[{"from":{"row":6,"column":1},"to":{"row":6,"column":0}},{"from":{"row":1,"column":6},"to":{"row":0,"column":6}},{"from":{"row":1,"column":5},"to":{"row":0,"column":5}},{"from":{"row":1,"column":4},"to":{"row":0,"column":4}},{"from":{"row":1,"column":3},"to":{"row":0,"column":3}},{"from":{"row":1,"column":2},"to":{"row":0,"column":2}},{"from":{"row":1,"column":1},"to":{"row":0,"column":1}}]',
  '[1,15,20,26,32,38,43]',
  1,
  'draft'
)
ON CONFLICT(
  puzzle_date,
  stage
)
DO UPDATE SET
  puzzle_number =
    excluded.puzzle_number,
  board_size =
    excluded.board_size,
  max_moves =
    excluded.max_moves,
  mystery_count =
    excluded.mystery_count,
  start_board_json =
    excluded.start_board_json,
  solved_board_json =
    excluded.solved_board_json,
  solution_moves_json =
    excluded.solution_moves_json,
  mystery_reveal_order_json =
    excluded.mystery_reveal_order_json,
  verified = 1,
  status = 'draft',
  updated_at =
    CURRENT_TIMESTAMP;

