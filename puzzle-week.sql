
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
  '2026-08-07',
  219,
  '5x5',
  5,
  5,
  5,
  '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"green","hidden":true},{"id":5,"color":"purple","hidden":false},{"id":11,"color":"red","hidden":true},{"id":7,"color":"purple","hidden":false},{"id":13,"color":"red","hidden":false},{"id":9,"color":"orange","hidden":true},{"id":15,"color":"red","hidden":false},{"id":6,"color":"purple","hidden":true},{"id":17,"color":"orange","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":10,"color":"green","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":12,"color":"red","hidden":false},{"id":18,"color":"green","hidden":false},{"id":14,"color":"red","hidden":false},{"id":20,"color":"blue","hidden":true},{"id":21,"color":"red","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"red","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"red","hidden":false}]',
  '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"purple","hidden":false},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"red","hidden":false},{"id":13,"color":"red","hidden":false},{"id":14,"color":"red","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"green","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"red","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"red","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"red","hidden":false}]',
  '[{"from":{"row":1,"column":0},"to":{"row":2,"column":0}},{"from":{"row":3,"column":1},"to":{"row":2,"column":1}},{"from":{"row":1,"column":4},"to":{"row":2,"column":4}},{"from":{"row":3,"column":3},"to":{"row":2,"column":3}},{"from":{"row":1,"column":2},"to":{"row":2,"column":2}}]',
  '[11,20,6,9,4]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-07',
  219,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"orange","hidden":false},{"id":2,"color":"orange","hidden":true},{"id":3,"color":"purple","hidden":false},{"id":5,"color":"blue","hidden":false},{"id":4,"color":"red","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":11,"color":"red","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"green","hidden":false},{"id":18,"color":"red","hidden":true},{"id":17,"color":"orange","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"green","hidden":true},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"red","hidden":false},{"id":25,"color":"red","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":26,"color":"blue","hidden":false},{"id":27,"color":"red","hidden":true},{"id":28,"color":"yellow","hidden":false},{"id":29,"color":"orange","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":32,"color":"red","hidden":false},{"id":31,"color":"green","hidden":false},{"id":33,"color":"purple","hidden":false},{"id":34,"color":"green","hidden":false},{"id":35,"color":"green","hidden":false},{"id":36,"color":"blue","hidden":true},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"green","hidden":false},{"id":40,"color":"yellow","hidden":false},{"id":39,"color":"red","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"purple","hidden":false},{"id":43,"color":"purple","hidden":true},{"id":44,"color":"red","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":47,"color":"yellow","hidden":false},{"id":46,"color":"red","hidden":false},{"id":48,"color":"orange","hidden":true},{"id":49,"color":"purple","hidden":false}]',
  '[{"id":1,"color":"orange","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"purple","hidden":false},{"id":4,"color":"red","hidden":false},{"id":5,"color":"blue","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"red","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"green","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"red","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"red","hidden":false},{"id":26,"color":"blue","hidden":false},{"id":27,"color":"red","hidden":false},{"id":28,"color":"yellow","hidden":false},{"id":29,"color":"orange","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"green","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"purple","hidden":false},{"id":34,"color":"green","hidden":false},{"id":35,"color":"green","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"yellow","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"purple","hidden":false},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"red","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":46,"color":"red","hidden":false},{"id":47,"color":"yellow","hidden":false},{"id":48,"color":"orange","hidden":false},{"id":49,"color":"purple","hidden":false}]',
  '[{"from":{"row":2,"column":2},"to":{"row":2,"column":3}},{"from":{"row":4,"column":2},"to":{"row":4,"column":3}},{"from":{"row":3,"column":2},"to":{"row":3,"column":3}},{"from":{"row":1,"column":2},"to":{"row":1,"column":3}},{"from":{"row":5,"column":4},"to":{"row":5,"column":3}},{"from":{"row":6,"column":4},"to":{"row":6,"column":3}},{"from":{"row":0,"column":4},"to":{"row":0,"column":3}}]',
  '[18,36,2,27,21,43,48]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  220,
  '5x5',
  5,
  5,
  5,
  '[{"id":1,"color":"orange","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":2,"color":"purple","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"orange","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":14,"color":"green","hidden":true},{"id":13,"color":"orange","hidden":true},{"id":15,"color":"yellow","hidden":false},{"id":16,"color":"blue","hidden":true},{"id":18,"color":"orange","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"green","hidden":false},{"id":22,"color":"blue","hidden":true},{"id":24,"color":"green","hidden":true},{"id":23,"color":"orange","hidden":false},{"id":25,"color":"green","hidden":false}]',
  '[{"id":1,"color":"orange","hidden":false},{"id":2,"color":"purple","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"orange","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"green","hidden":false},{"id":15,"color":"yellow","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"green","hidden":false},{"id":22,"color":"blue","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"green","hidden":false}]',
  '[{"from":{"row":3,"column":1},"to":{"row":3,"column":2}},{"from":{"row":4,"column":3},"to":{"row":4,"column":2}},{"from":{"row":0,"column":1},"to":{"row":0,"column":2}},{"from":{"row":2,"column":3},"to":{"row":2,"column":2}},{"from":{"row":1,"column":1},"to":{"row":1,"column":2}}]',
  '[13,22,16,14,24]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  220,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"orange","hidden":true},{"id":5,"color":"green","hidden":true},{"id":6,"color":"red","hidden":false},{"id":7,"color":"red","hidden":true},{"id":15,"color":"red","hidden":false},{"id":16,"color":"red","hidden":false},{"id":10,"color":"orange","hidden":true},{"id":11,"color":"green","hidden":false},{"id":12,"color":"red","hidden":false},{"id":20,"color":"red","hidden":false},{"id":14,"color":"green","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"orange","hidden":true},{"id":24,"color":"red","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"blue","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":28,"color":"purple","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"purple","hidden":false},{"id":17,"color":"red","hidden":true},{"id":18,"color":"red","hidden":false},{"id":19,"color":"red","hidden":false},{"id":27,"color":"blue","hidden":false},{"id":21,"color":"red","hidden":false},{"id":29,"color":"orange","hidden":false},{"id":30,"color":"yellow","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"yellow","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"yellow","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"green","hidden":true},{"id":38,"color":"blue","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"yellow","hidden":false},{"id":41,"color":"green","hidden":false},{"id":42,"color":"blue","hidden":false},{"id":43,"color":"blue","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"purple","hidden":false},{"id":46,"color":"green","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"green","hidden":false},{"id":49,"color":"orange","hidden":false}]',
  '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"red","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"orange","hidden":false},{"id":11,"color":"green","hidden":false},{"id":12,"color":"red","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"green","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"red","hidden":false},{"id":17,"color":"red","hidden":false},{"id":18,"color":"red","hidden":false},{"id":19,"color":"red","hidden":false},{"id":20,"color":"red","hidden":false},{"id":21,"color":"red","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"purple","hidden":false},{"id":24,"color":"red","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"blue","hidden":false},{"id":27,"color":"blue","hidden":false},{"id":28,"color":"purple","hidden":false},{"id":29,"color":"orange","hidden":false},{"id":30,"color":"yellow","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"yellow","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"yellow","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"green","hidden":false},{"id":38,"color":"blue","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"yellow","hidden":false},{"id":41,"color":"green","hidden":false},{"id":42,"color":"blue","hidden":false},{"id":43,"color":"blue","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"purple","hidden":false},{"id":46,"color":"green","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"green","hidden":false},{"id":49,"color":"orange","hidden":false}]',
  '[{"from":{"row":3,"column":2},"to":{"row":2,"column":2}},{"from":{"row":1,"column":5},"to":{"row":2,"column":5}},{"from":{"row":3,"column":3},"to":{"row":2,"column":3}},{"from":{"row":3,"column":4},"to":{"row":2,"column":4}},{"from":{"row":1,"column":0},"to":{"row":2,"column":0}},{"from":{"row":3,"column":6},"to":{"row":2,"column":6}},{"from":{"row":1,"column":1},"to":{"row":2,"column":1}}]',
  '[17,37,9,10,7,4,5]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-09',
  221,
  '5x5',
  5,
  5,
  5,
  '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":3,"color":"blue","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"purple","hidden":true},{"id":13,"color":"red","hidden":false},{"id":15,"color":"blue","hidden":true},{"id":14,"color":"blue","hidden":false},{"id":16,"color":"orange","hidden":true},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"green","hidden":true},{"id":20,"color":"green","hidden":false},{"id":19,"color":"blue","hidden":true},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"green","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":25,"color":"red","hidden":false}]',
  '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"blue","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"red","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"green","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"red","hidden":false}]',
  '[{"from":{"row":1,"column":2},"to":{"row":1,"column":3}},{"from":{"row":2,"column":4},"to":{"row":2,"column":3}},{"from":{"row":0,"column":2},"to":{"row":0,"column":3}},{"from":{"row":3,"column":4},"to":{"row":3,"column":3}},{"from":{"row":4,"column":2},"to":{"row":4,"column":3}}]',
  '[19,15,12,18,16]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-09',
  221,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"yellow","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"blue","hidden":true},{"id":6,"color":"blue","hidden":true},{"id":7,"color":"red","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"red","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":23,"color":"red","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":26,"color":"red","hidden":false},{"id":27,"color":"purple","hidden":false},{"id":28,"color":"orange","hidden":true},{"id":22,"color":"orange","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"red","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"orange","hidden":true},{"id":29,"color":"blue","hidden":false},{"id":30,"color":"blue","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"purple","hidden":true},{"id":37,"color":"green","hidden":false},{"id":38,"color":"yellow","hidden":false},{"id":39,"color":"purple","hidden":false},{"id":40,"color":"red","hidden":false},{"id":41,"color":"green","hidden":true},{"id":42,"color":"yellow","hidden":false},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"blue","hidden":false},{"id":45,"color":"red","hidden":false},{"id":46,"color":"orange","hidden":true},{"id":47,"color":"red","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"red","hidden":false}]',
  '[{"id":1,"color":"yellow","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"blue","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"red","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"orange","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"red","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"red","hidden":false},{"id":26,"color":"red","hidden":false},{"id":27,"color":"purple","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"blue","hidden":false},{"id":30,"color":"blue","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"purple","hidden":false},{"id":37,"color":"green","hidden":false},{"id":38,"color":"yellow","hidden":false},{"id":39,"color":"purple","hidden":false},{"id":40,"color":"red","hidden":false},{"id":41,"color":"green","hidden":false},{"id":42,"color":"yellow","hidden":false},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"blue","hidden":false},{"id":45,"color":"red","hidden":false},{"id":46,"color":"orange","hidden":false},{"id":47,"color":"red","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"red","hidden":false}]',
  '[{"from":{"row":3,"column":4},"to":{"row":2,"column":4}},{"from":{"row":3,"column":5},"to":{"row":2,"column":5}},{"from":{"row":1,"column":3},"to":{"row":2,"column":3}},{"from":{"row":3,"column":6},"to":{"row":2,"column":6}},{"from":{"row":1,"column":0},"to":{"row":2,"column":0}},{"from":{"row":1,"column":2},"to":{"row":2,"column":2}},{"from":{"row":3,"column":1},"to":{"row":2,"column":1}}]',
  '[21,28,46,5,6,36,41]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-10',
  222,
  '5x5',
  5,
  5,
  5,
  '[{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"yellow","hidden":false},{"id":3,"color":"red","hidden":false},{"id":9,"color":"yellow","hidden":true},{"id":5,"color":"purple","hidden":false},{"id":1,"color":"green","hidden":true},{"id":2,"color":"orange","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"green","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":14,"color":"yellow","hidden":true},{"id":10,"color":"yellow","hidden":false},{"id":16,"color":"orange","hidden":true},{"id":17,"color":"purple","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"yellow","hidden":true},{"id":20,"color":"red","hidden":false},{"id":21,"color":"red","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"purple","hidden":false}]',
  '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"yellow","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":9,"color":"yellow","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"purple","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"red","hidden":false},{"id":21,"color":"red","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"purple","hidden":false}]',
  '[{"from":{"row":0,"column":0},"to":{"row":1,"column":0}},{"from":{"row":2,"column":4},"to":{"row":1,"column":4}},{"from":{"row":0,"column":1},"to":{"row":1,"column":1}},{"from":{"row":2,"column":2},"to":{"row":1,"column":2}},{"from":{"row":0,"column":3},"to":{"row":1,"column":3}}]',
  '[9,16,14,19,1]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-10',
  222,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"purple","hidden":false},{"id":3,"color":"orange","hidden":true},{"id":4,"color":"green","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"purple","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"yellow","hidden":true},{"id":18,"color":"green","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"blue","hidden":true},{"id":29,"color":"blue","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"blue","hidden":false},{"id":33,"color":"blue","hidden":true},{"id":27,"color":"yellow","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":37,"color":"red","hidden":false},{"id":24,"color":"red","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"yellow","hidden":false},{"id":41,"color":"orange","hidden":false},{"id":42,"color":"green","hidden":false},{"id":36,"color":"green","hidden":false},{"id":30,"color":"blue","hidden":false},{"id":38,"color":"yellow","hidden":true},{"id":39,"color":"green","hidden":true},{"id":40,"color":"green","hidden":false},{"id":34,"color":"blue","hidden":false},{"id":35,"color":"blue","hidden":false},{"id":43,"color":"red","hidden":false},{"id":44,"color":"yellow","hidden":false},{"id":45,"color":"green","hidden":true},{"id":46,"color":"orange","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"yellow","hidden":false},{"id":49,"color":"yellow","hidden":false}]',
  '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"purple","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"purple","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":18,"color":"green","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"red","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"yellow","hidden":false},{"id":27,"color":"yellow","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"blue","hidden":false},{"id":30,"color":"blue","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"blue","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"blue","hidden":false},{"id":35,"color":"blue","hidden":false},{"id":36,"color":"green","hidden":false},{"id":37,"color":"red","hidden":false},{"id":38,"color":"yellow","hidden":false},{"id":39,"color":"green","hidden":false},{"id":40,"color":"green","hidden":false},{"id":41,"color":"orange","hidden":false},{"id":42,"color":"green","hidden":false},{"id":43,"color":"red","hidden":false},{"id":44,"color":"yellow","hidden":false},{"id":45,"color":"green","hidden":false},{"id":46,"color":"orange","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"yellow","hidden":false},{"id":49,"color":"yellow","hidden":false}]',
  '[{"from":{"row":3,"column":4},"to":{"row":4,"column":4}},{"from":{"row":5,"column":6},"to":{"row":4,"column":6}},{"from":{"row":3,"column":2},"to":{"row":4,"column":2}},{"from":{"row":3,"column":3},"to":{"row":4,"column":3}},{"from":{"row":3,"column":0},"to":{"row":4,"column":0}},{"from":{"row":5,"column":5},"to":{"row":4,"column":5}},{"from":{"row":5,"column":1},"to":{"row":4,"column":1}}]',
  '[33,39,21,38,17,45,3]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-11',
  223,
  '5x5',
  5,
  5,
  5,
  '[{"id":1,"color":"blue","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":10,"color":"orange","hidden":true},{"id":11,"color":"red","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"red","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":5,"color":"yellow","hidden":true},{"id":6,"color":"orange","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"green","hidden":true},{"id":9,"color":"orange","hidden":false},{"id":15,"color":"green","hidden":true},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"purple","hidden":false},{"id":18,"color":"yellow","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"red","hidden":false},{"id":21,"color":"green","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"green","hidden":true},{"id":24,"color":"green","hidden":false},{"id":25,"color":"purple","hidden":false}]',
  '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"orange","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"orange","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"green","hidden":false},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"purple","hidden":false},{"id":18,"color":"yellow","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"red","hidden":false},{"id":21,"color":"green","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"purple","hidden":false}]',
  '[{"from":{"row":0,"column":2},"to":{"row":1,"column":2}},{"from":{"row":2,"column":3},"to":{"row":1,"column":3}},{"from":{"row":0,"column":4},"to":{"row":1,"column":4}},{"from":{"row":2,"column":0},"to":{"row":1,"column":0}},{"from":{"row":0,"column":1},"to":{"row":1,"column":1}}]',
  '[10,13,23,15,5]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-11',
  223,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"red","hidden":false},{"id":3,"color":"red","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":4,"color":"orange","hidden":true},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"purple","hidden":false},{"id":7,"color":"red","hidden":false},{"id":9,"color":"yellow","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"red","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"orange","hidden":true},{"id":20,"color":"green","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":24,"color":"green","hidden":true},{"id":25,"color":"blue","hidden":false},{"id":26,"color":"yellow","hidden":true},{"id":27,"color":"orange","hidden":false},{"id":28,"color":"red","hidden":false},{"id":29,"color":"purple","hidden":false},{"id":31,"color":"green","hidden":false},{"id":30,"color":"yellow","hidden":true},{"id":32,"color":"green","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"red","hidden":true},{"id":35,"color":"purple","hidden":false},{"id":37,"color":"yellow","hidden":false},{"id":36,"color":"red","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"blue","hidden":false},{"id":41,"color":"purple","hidden":false},{"id":42,"color":"blue","hidden":false},{"id":43,"color":"red","hidden":false},{"id":45,"color":"yellow","hidden":true},{"id":44,"color":"yellow","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"yellow","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"orange","hidden":false}]',
  '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"purple","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"yellow","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"blue","hidden":false},{"id":26,"color":"yellow","hidden":false},{"id":27,"color":"orange","hidden":false},{"id":28,"color":"red","hidden":false},{"id":29,"color":"purple","hidden":false},{"id":30,"color":"yellow","hidden":false},{"id":31,"color":"green","hidden":false},{"id":32,"color":"green","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"purple","hidden":false},{"id":36,"color":"red","hidden":false},{"id":37,"color":"yellow","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"blue","hidden":false},{"id":41,"color":"purple","hidden":false},{"id":42,"color":"blue","hidden":false},{"id":43,"color":"red","hidden":false},{"id":44,"color":"yellow","hidden":false},{"id":45,"color":"yellow","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"yellow","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"orange","hidden":false}]',
  '[{"from":{"row":5,"column":0},"to":{"row":5,"column":1}},{"from":{"row":6,"column":2},"to":{"row":6,"column":1}},{"from":{"row":0,"column":2},"to":{"row":0,"column":1}},{"from":{"row":2,"column":2},"to":{"row":2,"column":1}},{"from":{"row":3,"column":0},"to":{"row":3,"column":1}},{"from":{"row":1,"column":0},"to":{"row":1,"column":1}},{"from":{"row":4,"column":2},"to":{"row":4,"column":1}}]',
  '[30,26,45,4,24,34,19]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-12',
  224,
  '5x5',
  5,
  5,
  5,
  '[{"id":2,"color":"yellow","hidden":false},{"id":1,"color":"blue","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"yellow","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"green","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":7,"color":"yellow","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"green","hidden":true},{"id":20,"color":"yellow","hidden":false},{"id":21,"color":"yellow","hidden":true},{"id":23,"color":"yellow","hidden":true},{"id":22,"color":"yellow","hidden":true},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"green","hidden":true}]',
  '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"yellow","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"yellow","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"green","hidden":false},{"id":20,"color":"yellow","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"green","hidden":false}]',
  '[{"from":{"row":0,"column":0},"to":{"row":0,"column":1}},{"from":{"row":4,"column":2},"to":{"row":4,"column":1}},{"from":{"row":3,"column":0},"to":{"row":3,"column":1}},{"from":{"row":1,"column":2},"to":{"row":1,"column":1}},{"from":{"row":2,"column":0},"to":{"row":2,"column":1}}]',
  '[22,23,21,25,19]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-12',
  224,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"yellow","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"yellow","hidden":true},{"id":7,"color":"blue","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":21,"color":"blue","hidden":true},{"id":8,"color":"red","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"green","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":26,"color":"purple","hidden":false},{"id":27,"color":"orange","hidden":false},{"id":14,"color":"green","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":25,"color":"purple","hidden":true},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":28,"color":"blue","hidden":true},{"id":29,"color":"purple","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"green","hidden":false},{"id":35,"color":"blue","hidden":false},{"id":36,"color":"blue","hidden":true},{"id":37,"color":"green","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"red","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"orange","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"orange","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"blue","hidden":true},{"id":49,"color":"green","hidden":true}]',
  '[{"id":1,"color":"yellow","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"green","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"purple","hidden":false},{"id":26,"color":"purple","hidden":false},{"id":27,"color":"orange","hidden":false},{"id":28,"color":"blue","hidden":false},{"id":29,"color":"purple","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"green","hidden":false},{"id":35,"color":"blue","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"green","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"red","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"orange","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"orange","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"green","hidden":false}]',
  '[{"from":{"row":3,"column":5},"to":{"row":2,"column":5}},{"from":{"row":1,"column":6},"to":{"row":2,"column":6}},{"from":{"row":3,"column":2},"to":{"row":2,"column":2}},{"from":{"row":3,"column":1},"to":{"row":2,"column":1}},{"from":{"row":1,"column":0},"to":{"row":2,"column":0}},{"from":{"row":1,"column":3},"to":{"row":2,"column":3}},{"from":{"row":3,"column":4},"to":{"row":2,"column":4}}]',
  '[21,25,28,48,6,49,36]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-13',
  225,
  '5x5',
  5,
  5,
  5,
  '[{"id":1,"color":"blue","hidden":true},{"id":2,"color":"green","hidden":false},{"id":3,"color":"purple","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"orange","hidden":true},{"id":6,"color":"green","hidden":false},{"id":7,"color":"yellow","hidden":false},{"id":8,"color":"green","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"red","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":true},{"id":18,"color":"blue","hidden":true},{"id":24,"color":"purple","hidden":true},{"id":25,"color":"red","hidden":false}]',
  '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"purple","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"yellow","hidden":false},{"id":8,"color":"green","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"purple","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"red","hidden":false}]',
  '[{"from":{"row":2,"column":1},"to":{"row":3,"column":1}},{"from":{"row":4,"column":2},"to":{"row":3,"column":2}},{"from":{"row":2,"column":4},"to":{"row":3,"column":4}},{"from":{"row":4,"column":0},"to":{"row":3,"column":0}},{"from":{"row":2,"column":3},"to":{"row":3,"column":3}}]',
  '[18,24,1,22,5]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
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
  '2026-08-13',
  225,
  '7x7',
  7,
  7,
  7,
  '[{"id":1,"color":"purple","hidden":true},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"purple","hidden":true},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"orange","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"purple","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":27,"color":"orange","hidden":false},{"id":21,"color":"yellow","hidden":true},{"id":15,"color":"green","hidden":false},{"id":16,"color":"red","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"yellow","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":35,"color":"blue","hidden":false},{"id":29,"color":"green","hidden":false},{"id":30,"color":"red","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"orange","hidden":true},{"id":26,"color":"orange","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":36,"color":"blue","hidden":true},{"id":37,"color":"orange","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"yellow","hidden":false},{"id":40,"color":"green","hidden":false},{"id":41,"color":"red","hidden":true},{"id":42,"color":"orange","hidden":false},{"id":43,"color":"green","hidden":false},{"id":44,"color":"green","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":46,"color":"blue","hidden":true},{"id":47,"color":"green","hidden":false},{"id":48,"color":"green","hidden":false},{"id":49,"color":"yellow","hidden":false}]',
  '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"orange","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"purple","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"green","hidden":false},{"id":16,"color":"red","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"orange","hidden":false},{"id":27,"color":"orange","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"green","hidden":false},{"id":30,"color":"red","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"yellow","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":35,"color":"blue","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"orange","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"yellow","hidden":false},{"id":40,"color":"green","hidden":false},{"id":41,"color":"red","hidden":false},{"id":42,"color":"orange","hidden":false},{"id":43,"color":"green","hidden":false},{"id":44,"color":"green","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"green","hidden":false},{"id":49,"color":"yellow","hidden":false}]',
  '[{"from":{"row":4,"column":4},"to":{"row":3,"column":4}},{"from":{"row":4,"column":3},"to":{"row":3,"column":3}},{"from":{"row":4,"column":6},"to":{"row":3,"column":6}},{"from":{"row":2,"column":5},"to":{"row":3,"column":5}},{"from":{"row":2,"column":1},"to":{"row":3,"column":1}},{"from":{"row":2,"column":0},"to":{"row":3,"column":0}},{"from":{"row":4,"column":2},"to":{"row":3,"column":2}}]',
  '[25,4,21,1,46,36,41]',
  1,
  'published'
)
ON CONFLICT (
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
  status =
    excluded.status,
  updated_at =
    CURRENT_TIMESTAMP;

