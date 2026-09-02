-- GYAN puzzle reset using actual stored puzzle dates
-- Replaces #227-#235 with mode-aware boards and clears their old test history.

DELETE FROM puzzle_guest_names WHERE puzzle_number BETWEEN 227 AND 235;
DELETE FROM puzzle_winners WHERE puzzle_number BETWEEN 227 AND 235;
DELETE FROM puzzle_results WHERE puzzle_number BETWEEN 227 AND 235;

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":17,"color":"blue","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"blue","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"blue","hidden":true},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"blue","hidden":true},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"purple","hidden":true},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"yellow","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":1,"color":"purple","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"blue","hidden":true},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"purple","hidden":true},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"orange","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"blue","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"purple","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"yellow","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"orange","hidden":false}]',
  solution_moves_json = '[{"from":{"row":0,"column":0},"to":{"row":3,"column":1}}]',
  mystery_reveal_order_json = '[19,21,6,8,10]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 227
  AND puzzle_date = '2026-08-15'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"red","hidden":true},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":23,"color":"green","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"blue","hidden":true},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"purple","hidden":true},{"id":17,"color":"blue","hidden":true},{"id":18,"color":"green","hidden":false},{"id":19,"color":"red","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"green","hidden":false},{"id":26,"color":"green","hidden":true},{"id":27,"color":"green","hidden":false},{"id":28,"color":"green","hidden":false},{"id":29,"color":"yellow","hidden":false},{"id":30,"color":"purple","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"orange","hidden":false},{"id":33,"color":"yellow","hidden":false},{"id":34,"color":"red","hidden":true},{"id":35,"color":"yellow","hidden":false},{"id":36,"color":"green","hidden":false},{"id":37,"color":"green","hidden":false},{"id":38,"color":"blue","hidden":true},{"id":39,"color":"red","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"purple","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"red","hidden":false},{"id":45,"color":"yellow","hidden":false},{"id":46,"color":"yellow","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"red","hidden":false},{"id":49,"color":"orange","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"green","hidden":false},{"id":19,"color":"red","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"green","hidden":false},{"id":26,"color":"green","hidden":false},{"id":27,"color":"green","hidden":false},{"id":28,"color":"green","hidden":false},{"id":29,"color":"yellow","hidden":false},{"id":30,"color":"purple","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"orange","hidden":false},{"id":33,"color":"yellow","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"yellow","hidden":false},{"id":36,"color":"green","hidden":false},{"id":37,"color":"green","hidden":false},{"id":38,"color":"blue","hidden":false},{"id":39,"color":"red","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"purple","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"red","hidden":false},{"id":45,"color":"yellow","hidden":false},{"id":46,"color":"yellow","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"red","hidden":false},{"id":49,"color":"orange","hidden":false}]',
  solution_moves_json = '[{"from":{"row":0,"column":5},"to":{"row":3,"column":1}}]',
  mystery_reveal_order_json = '[26,34,2,16,8,38,17]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 227
  AND puzzle_date = '2026-08-15'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"purple","hidden":true},{"id":3,"color":"green","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"purple","hidden":false},{"id":17,"color":"green","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"red","hidden":true},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"green","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":18,"color":"green","hidden":true},{"id":19,"color":"green","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"orange","hidden":true},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"purple","hidden":true}]',
  solved_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"purple","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"green","hidden":false},{"id":19,"color":"green","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"purple","hidden":false}]',
  solution_moves_json = '[{"from":{"row":1,"column":2},"to":{"row":3,"column":1}}]',
  mystery_reveal_order_json = '[18,25,22,10,2]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 228
  AND puzzle_date = '2026-08-16'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"orange","hidden":true},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"orange","hidden":true},{"id":10,"color":"red","hidden":false},{"id":11,"color":"red","hidden":true},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"orange","hidden":false},{"id":22,"color":"blue","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"red","hidden":false},{"id":26,"color":"yellow","hidden":false},{"id":27,"color":"red","hidden":false},{"id":28,"color":"red","hidden":false},{"id":29,"color":"green","hidden":false},{"id":39,"color":"green","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"purple","hidden":false},{"id":33,"color":"orange","hidden":false},{"id":34,"color":"blue","hidden":true},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"orange","hidden":false},{"id":37,"color":"orange","hidden":false},{"id":38,"color":"blue","hidden":true},{"id":30,"color":"orange","hidden":false},{"id":40,"color":"purple","hidden":false},{"id":41,"color":"yellow","hidden":true},{"id":42,"color":"red","hidden":true},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"orange","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":46,"color":"green","hidden":false},{"id":47,"color":"orange","hidden":false},{"id":48,"color":"orange","hidden":false},{"id":49,"color":"yellow","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"orange","hidden":false},{"id":22,"color":"blue","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"red","hidden":false},{"id":26,"color":"yellow","hidden":false},{"id":27,"color":"red","hidden":false},{"id":28,"color":"red","hidden":false},{"id":29,"color":"green","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"purple","hidden":false},{"id":33,"color":"orange","hidden":false},{"id":34,"color":"blue","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"orange","hidden":false},{"id":37,"color":"orange","hidden":false},{"id":38,"color":"blue","hidden":false},{"id":39,"color":"green","hidden":false},{"id":40,"color":"purple","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"orange","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":46,"color":"green","hidden":false},{"id":47,"color":"orange","hidden":false},{"id":48,"color":"orange","hidden":false},{"id":49,"color":"yellow","hidden":false}]',
  solution_moves_json = '[{"from":{"row":5,"column":3},"to":{"row":4,"column":1}}]',
  mystery_reveal_order_json = '[9,41,3,11,38,34,42]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 228
  AND puzzle_date = '2026-08-16'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"orange","hidden":true},{"id":4,"color":"purple","hidden":true},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"orange","hidden":true},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"red","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"blue","hidden":true},{"id":10,"color":"green","hidden":true},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"orange","hidden":false},{"id":22,"color":"red","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"red","hidden":false},{"id":25,"color":"purple","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"red","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"blue","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"orange","hidden":false},{"id":22,"color":"red","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"red","hidden":false},{"id":25,"color":"purple","hidden":false}]',
  solution_moves_json = '[{"from":{"row":1,"column":4},"to":{"row":3,"column":3}}]',
  mystery_reveal_order_json = '[18,3,10,4,7]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 229
  AND puzzle_date = '2026-08-17'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":1,"color":"green","hidden":true},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"purple","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"orange","hidden":true},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"red","hidden":false},{"id":13,"color":"yellow","hidden":true},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"red","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":36,"color":"purple","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"green","hidden":true},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"blue","hidden":false},{"id":26,"color":"purple","hidden":false},{"id":27,"color":"green","hidden":false},{"id":28,"color":"purple","hidden":false},{"id":29,"color":"blue","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"orange","hidden":true},{"id":32,"color":"blue","hidden":false},{"id":33,"color":"green","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"yellow","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"orange","hidden":false},{"id":39,"color":"blue","hidden":true},{"id":40,"color":"green","hidden":false},{"id":41,"color":"purple","hidden":false},{"id":42,"color":"yellow","hidden":false},{"id":43,"color":"green","hidden":false},{"id":44,"color":"red","hidden":false},{"id":45,"color":"purple","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"green","hidden":true},{"id":48,"color":"orange","hidden":false},{"id":49,"color":"green","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"purple","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"red","hidden":false},{"id":6,"color":"orange","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"red","hidden":false},{"id":13,"color":"yellow","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"red","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"blue","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"blue","hidden":false},{"id":26,"color":"purple","hidden":false},{"id":27,"color":"green","hidden":false},{"id":28,"color":"purple","hidden":false},{"id":29,"color":"blue","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"orange","hidden":false},{"id":32,"color":"blue","hidden":false},{"id":33,"color":"green","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"yellow","hidden":false},{"id":36,"color":"purple","hidden":false},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"orange","hidden":false},{"id":39,"color":"blue","hidden":false},{"id":40,"color":"green","hidden":false},{"id":41,"color":"purple","hidden":false},{"id":42,"color":"yellow","hidden":false},{"id":43,"color":"green","hidden":false},{"id":44,"color":"red","hidden":false},{"id":45,"color":"purple","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"orange","hidden":false},{"id":49,"color":"green","hidden":false}]',
  solution_moves_json = '[{"from":{"row":5,"column":0},"to":{"row":2,"column":3}}]',
  mystery_reveal_order_json = '[39,6,13,20,1,47,31]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 229
  AND puzzle_date = '2026-08-17'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":1,"color":"green","hidden":true},{"id":11,"color":"red","hidden":true},{"id":3,"color":"orange","hidden":true},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"red","hidden":false},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":2,"color":"red","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"red","hidden":true},{"id":18,"color":"green","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":21,"color":"red","hidden":false},{"id":14,"color":"red","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"red","hidden":false},{"id":17,"color":"green","hidden":true},{"id":22,"color":"blue","hidden":false},{"id":23,"color":"purple","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"orange","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"red","hidden":false},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"red","hidden":false},{"id":14,"color":"red","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"green","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"red","hidden":false},{"id":21,"color":"red","hidden":false},{"id":22,"color":"blue","hidden":false},{"id":23,"color":"purple","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"orange","hidden":false}]',
  solution_moves_json = '[{"from":{"row":2,"column":0},"to":{"row":0,"column":1}},{"from":{"row":3,"column":1},"to":{"row":4,"column":0}},{"from":{"row":3,"column":2},"to":{"row":2,"column":3}}]',
  mystery_reveal_order_json = '[3,13,1,17,11]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 230
  AND puzzle_date = '2026-08-18'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":18,"color":"purple","hidden":false},{"id":2,"color":"purple","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":true},{"id":5,"color":"green","hidden":false},{"id":6,"color":"orange","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"green","hidden":false},{"id":35,"color":"red","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"orange","hidden":true},{"id":13,"color":"blue","hidden":true},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":1,"color":"orange","hidden":true},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"blue","hidden":true},{"id":21,"color":"blue","hidden":false},{"id":43,"color":"purple","hidden":false},{"id":23,"color":"blue","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"green","hidden":true},{"id":26,"color":"purple","hidden":false},{"id":27,"color":"orange","hidden":false},{"id":28,"color":"green","hidden":false},{"id":29,"color":"red","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"green","hidden":true},{"id":33,"color":"red","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":10,"color":"purple","hidden":false},{"id":36,"color":"orange","hidden":false},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"red","hidden":false},{"id":39,"color":"green","hidden":false},{"id":40,"color":"red","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"purple","hidden":false},{"id":22,"color":"green","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":46,"color":"yellow","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"green","hidden":false},{"id":49,"color":"red","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"orange","hidden":false},{"id":2,"color":"purple","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"orange","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"blue","hidden":false},{"id":9,"color":"green","hidden":false},{"id":10,"color":"purple","hidden":false},{"id":11,"color":"blue","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"blue","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"green","hidden":false},{"id":26,"color":"purple","hidden":false},{"id":27,"color":"orange","hidden":false},{"id":28,"color":"green","hidden":false},{"id":29,"color":"red","hidden":false},{"id":30,"color":"orange","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"green","hidden":false},{"id":33,"color":"red","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":35,"color":"red","hidden":false},{"id":36,"color":"orange","hidden":false},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"red","hidden":false},{"id":39,"color":"green","hidden":false},{"id":40,"color":"red","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"purple","hidden":false},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"blue","hidden":false},{"id":46,"color":"yellow","hidden":false},{"id":47,"color":"green","hidden":false},{"id":48,"color":"green","hidden":false},{"id":49,"color":"red","hidden":false}]',
  solution_moves_json = '[{"from":{"row":4,"column":6},"to":{"row":1,"column":2}},{"from":{"row":3,"column":0},"to":{"row":6,"column":0}},{"from":{"row":0,"column":0},"to":{"row":2,"column":3}}]',
  mystery_reveal_order_json = '[20,4,1,25,32,12,13]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 230
  AND puzzle_date = '2026-08-18'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":3,"color":"green","hidden":false},{"id":2,"color":"blue","hidden":true},{"id":1,"color":"green","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":9,"color":"green","hidden":false},{"id":15,"color":"green","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":6,"color":"green","hidden":true},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"blue","hidden":true},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"blue","hidden":true},{"id":7,"color":"orange","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"red","hidden":false},{"id":19,"color":"red","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"purple","hidden":true},{"id":24,"color":"purple","hidden":false},{"id":23,"color":"green","hidden":false},{"id":22,"color":"green","hidden":false},{"id":25,"color":"yellow","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"purple","hidden":false},{"id":5,"color":"yellow","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":9,"color":"green","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"blue","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"green","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"red","hidden":false},{"id":19,"color":"red","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"yellow","hidden":false}]',
  solution_moves_json = '[{"from":{"row":1,"column":1},"to":{"row":2,"column":4}},{"from":{"row":4,"column":3},"to":{"row":4,"column":1}},{"from":{"row":0,"column":0},"to":{"row":0,"column":2}},{"from":{"row":1,"column":0},"to":{"row":1,"column":3}}]',
  mystery_reveal_order_json = '[2,14,12,6,21]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 231
  AND puzzle_date = '2026-08-19'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":27,"color":"red","hidden":false},{"id":2,"color":"orange","hidden":true},{"id":3,"color":"red","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"blue","hidden":true},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":44,"color":"red","hidden":false},{"id":10,"color":"red","hidden":false},{"id":34,"color":"yellow","hidden":true},{"id":12,"color":"red","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"yellow","hidden":true},{"id":15,"color":"red","hidden":true},{"id":16,"color":"yellow","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"blue","hidden":false},{"id":19,"color":"red","hidden":false},{"id":25,"color":"purple","hidden":false},{"id":26,"color":"green","hidden":false},{"id":1,"color":"red","hidden":false},{"id":28,"color":"green","hidden":false},{"id":29,"color":"green","hidden":false},{"id":30,"color":"green","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"orange","hidden":false},{"id":11,"color":"red","hidden":false},{"id":35,"color":"red","hidden":false},{"id":36,"color":"red","hidden":false},{"id":37,"color":"yellow","hidden":false},{"id":38,"color":"red","hidden":false},{"id":39,"color":"blue","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"yellow","hidden":true},{"id":42,"color":"yellow","hidden":false},{"id":43,"color":"green","hidden":false},{"id":9,"color":"yellow","hidden":false},{"id":45,"color":"green","hidden":false},{"id":46,"color":"green","hidden":false},{"id":47,"color":"blue","hidden":false},{"id":48,"color":"purple","hidden":true},{"id":49,"color":"red","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"red","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"purple","hidden":false},{"id":8,"color":"purple","hidden":false},{"id":9,"color":"yellow","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"red","hidden":false},{"id":13,"color":"purple","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":17,"color":"yellow","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"red","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"blue","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"purple","hidden":false},{"id":26,"color":"green","hidden":false},{"id":27,"color":"red","hidden":false},{"id":28,"color":"green","hidden":false},{"id":29,"color":"green","hidden":false},{"id":30,"color":"green","hidden":false},{"id":31,"color":"blue","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"orange","hidden":false},{"id":34,"color":"yellow","hidden":false},{"id":35,"color":"red","hidden":false},{"id":36,"color":"red","hidden":false},{"id":37,"color":"yellow","hidden":false},{"id":38,"color":"red","hidden":false},{"id":39,"color":"blue","hidden":false},{"id":40,"color":"orange","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"yellow","hidden":false},{"id":43,"color":"green","hidden":false},{"id":44,"color":"red","hidden":false},{"id":45,"color":"green","hidden":false},{"id":46,"color":"green","hidden":false},{"id":47,"color":"blue","hidden":false},{"id":48,"color":"purple","hidden":false},{"id":49,"color":"red","hidden":false}]',
  solution_moves_json = '[{"from":{"row":4,"column":5},"to":{"row":1,"column":3}},{"from":{"row":3,"column":2},"to":{"row":2,"column":4}},{"from":{"row":0,"column":0},"to":{"row":3,"column":5}},{"from":{"row":1,"column":1},"to":{"row":6,"column":1}}]',
  mystery_reveal_order_json = '[15,34,2,6,14,41,48]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 231
  AND puzzle_date = '2026-08-19'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"yellow","hidden":true},{"id":5,"color":"orange","hidden":true},{"id":4,"color":"blue","hidden":false},{"id":3,"color":"green","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"green","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"orange","hidden":true},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"green","hidden":true},{"id":15,"color":"green","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":17,"color":"purple","hidden":false},{"id":18,"color":"green","hidden":true},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"yellow","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"green","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"green","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"yellow","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"green","hidden":false},{"id":15,"color":"green","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":17,"color":"purple","hidden":false},{"id":18,"color":"green","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"yellow","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"orange","hidden":false},{"id":25,"color":"green","hidden":false}]',
  solution_moves_json = '[{"from":{"row":0,"column":4},"to":{"row":0,"column":2}}]',
  mystery_reveal_order_json = '[18,14,5,2,11]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 232
  AND puzzle_date = '2026-08-20'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":1,"color":"orange","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"blue","hidden":true},{"id":8,"color":"green","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"red","hidden":true},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":true},{"id":16,"color":"yellow","hidden":true},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":33,"color":"purple","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"purple","hidden":true},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"green","hidden":false},{"id":26,"color":"orange","hidden":false},{"id":27,"color":"blue","hidden":false},{"id":28,"color":"red","hidden":false},{"id":29,"color":"purple","hidden":false},{"id":30,"color":"purple","hidden":true},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"purple","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":35,"color":"purple","hidden":false},{"id":36,"color":"red","hidden":false},{"id":37,"color":"blue","hidden":false},{"id":38,"color":"orange","hidden":false},{"id":39,"color":"yellow","hidden":false},{"id":40,"color":"green","hidden":false},{"id":41,"color":"red","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"blue","hidden":false},{"id":45,"color":"green","hidden":false},{"id":46,"color":"purple","hidden":false},{"id":47,"color":"red","hidden":false},{"id":48,"color":"blue","hidden":true},{"id":49,"color":"yellow","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"orange","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"green","hidden":false},{"id":9,"color":"orange","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"red","hidden":false},{"id":12,"color":"red","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"yellow","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"green","hidden":false},{"id":21,"color":"blue","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"purple","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"green","hidden":false},{"id":26,"color":"orange","hidden":false},{"id":27,"color":"blue","hidden":false},{"id":28,"color":"red","hidden":false},{"id":29,"color":"purple","hidden":false},{"id":30,"color":"purple","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"purple","hidden":false},{"id":33,"color":"purple","hidden":false},{"id":34,"color":"purple","hidden":false},{"id":35,"color":"purple","hidden":false},{"id":36,"color":"red","hidden":false},{"id":37,"color":"blue","hidden":false},{"id":38,"color":"orange","hidden":false},{"id":39,"color":"yellow","hidden":false},{"id":40,"color":"green","hidden":false},{"id":41,"color":"red","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"blue","hidden":false},{"id":45,"color":"green","hidden":false},{"id":46,"color":"purple","hidden":false},{"id":47,"color":"red","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"yellow","hidden":false}]',
  solution_moves_json = '[{"from":{"row":2,"column":4},"to":{"row":4,"column":4}}]',
  mystery_reveal_order_json = '[30,15,7,48,12,23,16]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 232
  AND puzzle_date = '2026-08-20'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"purple","hidden":true},{"id":6,"color":"red","hidden":true},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":14,"color":"red","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"purple","hidden":true},{"id":13,"color":"orange","hidden":true},{"id":22,"color":"yellow","hidden":true},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"red","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"orange","hidden":false},{"id":3,"color":"orange","hidden":false},{"id":4,"color":"green","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"red","hidden":false},{"id":7,"color":"blue","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"red","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"green","hidden":false},{"id":18,"color":"orange","hidden":false},{"id":19,"color":"yellow","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"orange","hidden":false},{"id":24,"color":"purple","hidden":false},{"id":25,"color":"red","hidden":false}]',
  solution_moves_json = '[{"from":{"row":4,"column":0},"to":{"row":2,"column":2}}]',
  mystery_reveal_order_json = '[13,5,6,20,22]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 233
  AND puzzle_date = '2026-08-21'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"orange","hidden":true},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"purple","hidden":true},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":26,"color":"green","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"orange","hidden":true},{"id":23,"color":"green","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":27,"color":"red","hidden":true},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"yellow","hidden":false},{"id":30,"color":"red","hidden":false},{"id":31,"color":"yellow","hidden":false},{"id":32,"color":"blue","hidden":false},{"id":33,"color":"green","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"green","hidden":false},{"id":36,"color":"yellow","hidden":false},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"purple","hidden":false},{"id":39,"color":"blue","hidden":false},{"id":40,"color":"blue","hidden":false},{"id":41,"color":"yellow","hidden":true},{"id":42,"color":"purple","hidden":true},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"green","hidden":false},{"id":45,"color":"orange","hidden":false},{"id":46,"color":"red","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"yellow","hidden":true},{"id":49,"color":"green","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"purple","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"red","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"orange","hidden":false},{"id":6,"color":"yellow","hidden":false},{"id":7,"color":"red","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"purple","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"yellow","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"purple","hidden":false},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"purple","hidden":false},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"orange","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"blue","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"green","hidden":false},{"id":27,"color":"red","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"yellow","hidden":false},{"id":30,"color":"red","hidden":false},{"id":31,"color":"yellow","hidden":false},{"id":32,"color":"blue","hidden":false},{"id":33,"color":"green","hidden":false},{"id":34,"color":"red","hidden":false},{"id":35,"color":"green","hidden":false},{"id":36,"color":"yellow","hidden":false},{"id":37,"color":"purple","hidden":false},{"id":38,"color":"purple","hidden":false},{"id":39,"color":"blue","hidden":false},{"id":40,"color":"blue","hidden":false},{"id":41,"color":"yellow","hidden":false},{"id":42,"color":"purple","hidden":false},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"green","hidden":false},{"id":45,"color":"orange","hidden":false},{"id":46,"color":"red","hidden":false},{"id":47,"color":"purple","hidden":false},{"id":48,"color":"yellow","hidden":false},{"id":49,"color":"green","hidden":false}]',
  solution_moves_json = '[{"from":{"row":3,"column":4},"to":{"row":2,"column":5}}]',
  mystery_reveal_order_json = '[17,22,5,41,42,27,48]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 233
  AND puzzle_date = '2026-08-21'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"yellow","hidden":true},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"orange","hidden":true},{"id":9,"color":"red","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":23,"color":"red","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"orange","hidden":true},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"blue","hidden":true},{"id":18,"color":"yellow","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"purple","hidden":true},{"id":22,"color":"green","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":24,"color":"red","hidden":false},{"id":25,"color":"blue","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"red","hidden":false},{"id":3,"color":"yellow","hidden":false},{"id":4,"color":"blue","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"orange","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"red","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":12,"color":"orange","hidden":false},{"id":13,"color":"orange","hidden":false},{"id":14,"color":"orange","hidden":false},{"id":15,"color":"orange","hidden":false},{"id":16,"color":"purple","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"yellow","hidden":false},{"id":19,"color":"orange","hidden":false},{"id":20,"color":"orange","hidden":false},{"id":21,"color":"purple","hidden":false},{"id":22,"color":"green","hidden":false},{"id":23,"color":"red","hidden":false},{"id":24,"color":"red","hidden":false},{"id":25,"color":"blue","hidden":false}]',
  solution_moves_json = '[{"from":{"row":4,"column":2},"to":{"row":2,"column":1}}]',
  mystery_reveal_order_json = '[15,17,8,21,3]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 234
  AND puzzle_date = '2026-08-23'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"green","hidden":false},{"id":9,"color":"green","hidden":false},{"id":41,"color":"purple","hidden":false},{"id":11,"color":"green","hidden":false},{"id":12,"color":"green","hidden":true},{"id":13,"color":"green","hidden":false},{"id":14,"color":"green","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"orange","hidden":true},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"green","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"purple","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"orange","hidden":false},{"id":27,"color":"purple","hidden":false},{"id":28,"color":"orange","hidden":true},{"id":29,"color":"orange","hidden":false},{"id":30,"color":"blue","hidden":true},{"id":31,"color":"yellow","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"purple","hidden":false},{"id":34,"color":"yellow","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"blue","hidden":true},{"id":37,"color":"yellow","hidden":false},{"id":38,"color":"orange","hidden":false},{"id":39,"color":"purple","hidden":false},{"id":40,"color":"green","hidden":false},{"id":10,"color":"green","hidden":false},{"id":42,"color":"red","hidden":true},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"orange","hidden":false},{"id":45,"color":"yellow","hidden":false},{"id":46,"color":"blue","hidden":true},{"id":47,"color":"red","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"purple","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"yellow","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"green","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"green","hidden":false},{"id":9,"color":"green","hidden":false},{"id":10,"color":"green","hidden":false},{"id":11,"color":"green","hidden":false},{"id":12,"color":"green","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"green","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"blue","hidden":false},{"id":19,"color":"green","hidden":false},{"id":20,"color":"purple","hidden":false},{"id":21,"color":"yellow","hidden":false},{"id":22,"color":"purple","hidden":false},{"id":23,"color":"purple","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"orange","hidden":false},{"id":26,"color":"orange","hidden":false},{"id":27,"color":"purple","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"orange","hidden":false},{"id":30,"color":"blue","hidden":false},{"id":31,"color":"yellow","hidden":false},{"id":32,"color":"red","hidden":false},{"id":33,"color":"purple","hidden":false},{"id":34,"color":"yellow","hidden":false},{"id":35,"color":"orange","hidden":false},{"id":36,"color":"blue","hidden":false},{"id":37,"color":"yellow","hidden":false},{"id":38,"color":"orange","hidden":false},{"id":39,"color":"purple","hidden":false},{"id":40,"color":"green","hidden":false},{"id":41,"color":"purple","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"purple","hidden":false},{"id":44,"color":"orange","hidden":false},{"id":45,"color":"yellow","hidden":false},{"id":46,"color":"blue","hidden":false},{"id":47,"color":"red","hidden":false},{"id":48,"color":"blue","hidden":false},{"id":49,"color":"purple","hidden":false}]',
  solution_moves_json = '[{"from":{"row":5,"column":5},"to":{"row":1,"column":2}}]',
  mystery_reveal_order_json = '[12,46,28,17,30,36,42]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 234
  AND puzzle_date = '2026-08-23'
  AND stage = '7x7';

UPDATE daily_puzzles
SET
  board_size = 5,
  max_moves = 5,
  mystery_count = 5,
  start_board_json = '[{"id":22,"color":"blue","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"green","hidden":true},{"id":19,"color":"green","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":12,"color":"purple","hidden":true},{"id":21,"color":"green","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"blue","hidden":true},{"id":16,"color":"green","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"red","hidden":true},{"id":6,"color":"blue","hidden":true},{"id":20,"color":"blue","hidden":false},{"id":13,"color":"green","hidden":false},{"id":1,"color":"green","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"green","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"green","hidden":false},{"id":2,"color":"blue","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"orange","hidden":false},{"id":5,"color":"green","hidden":false},{"id":6,"color":"blue","hidden":false},{"id":7,"color":"green","hidden":false},{"id":8,"color":"red","hidden":false},{"id":9,"color":"red","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":11,"color":"orange","hidden":false},{"id":12,"color":"purple","hidden":false},{"id":13,"color":"green","hidden":false},{"id":14,"color":"blue","hidden":false},{"id":15,"color":"blue","hidden":false},{"id":16,"color":"green","hidden":false},{"id":17,"color":"orange","hidden":false},{"id":18,"color":"red","hidden":false},{"id":19,"color":"green","hidden":false},{"id":20,"color":"blue","hidden":false},{"id":21,"color":"green","hidden":false},{"id":22,"color":"blue","hidden":false},{"id":23,"color":"yellow","hidden":false},{"id":24,"color":"yellow","hidden":false},{"id":25,"color":"green","hidden":false}]',
  solution_moves_json = '[{"from":{"row":4,"column":0},"to":{"row":2,"column":2}},{"from":{"row":1,"column":0},"to":{"row":3,"column":3}},{"from":{"row":4,"column":1},"to":{"row":0,"column":0}}]',
  mystery_reveal_order_json = '[5,12,15,6,18]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 235
  AND puzzle_date = '2026-08-24'
  AND stage = '5x5';

UPDATE daily_puzzles
SET
  board_size = 7,
  max_moves = 7,
  mystery_count = 7,
  start_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"green","hidden":false},{"id":25,"color":"blue","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"red","hidden":true},{"id":7,"color":"orange","hidden":true},{"id":8,"color":"yellow","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"red","hidden":true},{"id":21,"color":"orange","hidden":true},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"green","hidden":true},{"id":24,"color":"green","hidden":false},{"id":4,"color":"yellow","hidden":false},{"id":26,"color":"red","hidden":false},{"id":27,"color":"green","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"orange","hidden":true},{"id":30,"color":"blue","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"purple","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"yellow","hidden":false},{"id":49,"color":"blue","hidden":false},{"id":36,"color":"yellow","hidden":false},{"id":37,"color":"orange","hidden":true},{"id":38,"color":"green","hidden":false},{"id":39,"color":"orange","hidden":false},{"id":40,"color":"red","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":41,"color":"blue","hidden":false},{"id":45,"color":"purple","hidden":false},{"id":46,"color":"purple","hidden":false},{"id":47,"color":"blue","hidden":false},{"id":48,"color":"orange","hidden":false},{"id":35,"color":"purple","hidden":false}]',
  solved_board_json = '[{"id":1,"color":"blue","hidden":false},{"id":2,"color":"green","hidden":false},{"id":3,"color":"green","hidden":false},{"id":4,"color":"yellow","hidden":false},{"id":5,"color":"purple","hidden":false},{"id":6,"color":"red","hidden":false},{"id":7,"color":"orange","hidden":false},{"id":8,"color":"yellow","hidden":false},{"id":9,"color":"blue","hidden":false},{"id":10,"color":"blue","hidden":false},{"id":11,"color":"purple","hidden":false},{"id":12,"color":"yellow","hidden":false},{"id":13,"color":"blue","hidden":false},{"id":14,"color":"yellow","hidden":false},{"id":15,"color":"red","hidden":false},{"id":16,"color":"orange","hidden":false},{"id":17,"color":"blue","hidden":false},{"id":18,"color":"purple","hidden":false},{"id":19,"color":"purple","hidden":false},{"id":20,"color":"red","hidden":false},{"id":21,"color":"orange","hidden":false},{"id":22,"color":"yellow","hidden":false},{"id":23,"color":"green","hidden":false},{"id":24,"color":"green","hidden":false},{"id":25,"color":"blue","hidden":false},{"id":26,"color":"red","hidden":false},{"id":27,"color":"green","hidden":false},{"id":28,"color":"orange","hidden":false},{"id":29,"color":"orange","hidden":false},{"id":30,"color":"blue","hidden":false},{"id":31,"color":"purple","hidden":false},{"id":32,"color":"purple","hidden":false},{"id":33,"color":"blue","hidden":false},{"id":34,"color":"yellow","hidden":false},{"id":35,"color":"purple","hidden":false},{"id":36,"color":"yellow","hidden":false},{"id":37,"color":"orange","hidden":false},{"id":38,"color":"green","hidden":false},{"id":39,"color":"orange","hidden":false},{"id":40,"color":"red","hidden":false},{"id":41,"color":"blue","hidden":false},{"id":42,"color":"red","hidden":false},{"id":43,"color":"yellow","hidden":false},{"id":44,"color":"purple","hidden":false},{"id":45,"color":"purple","hidden":false},{"id":46,"color":"purple","hidden":false},{"id":47,"color":"blue","hidden":false},{"id":48,"color":"orange","hidden":false},{"id":49,"color":"blue","hidden":false}]',
  solution_moves_json = '[{"from":{"row":4,"column":6},"to":{"row":6,"column":6}},{"from":{"row":6,"column":1},"to":{"row":5,"column":5}},{"from":{"row":0,"column":3},"to":{"row":3,"column":3}}]',
  mystery_reveal_order_json = '[37,29,21,20,7,23,6]',
  verified = 1,
  status = 'published',
  updated_at = CURRENT_TIMESTAMP
WHERE
  puzzle_number = 235
  AND puzzle_date = '2026-08-24'
  AND stage = '7x7';

-- Verification
SELECT puzzle_number, puzzle_date, stage, verified, status
FROM daily_puzzles
WHERE puzzle_number BETWEEN 227 AND 235
ORDER BY puzzle_number, stage;