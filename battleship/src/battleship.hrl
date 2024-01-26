-type ship_state() :: 'ACTIVE' | 'DAMAGED' | 'KILLED'.
-define(EMPTY, '_').
-define(BLOCKED, 'o').
-define(HIT, '+').
-define(MISS, 'x').
-type grid_state() :: ?EMPTY | ?BLOCKED | ?HIT | ?MISS.
-type strike_res() :: 'MISS' | 'HIT' | 'ERROR'.
-type ship_orientation() :: 'VERTICAL' | 'HORIZONTAL'.
-type row() :: integer().
-type column() :: integer().
-type player_id() :: string.

-type board() :: [[grid_state()]].

-record(ship, {
    id :: string,
    health :: ship_state(),
    orientation :: ship_orientation(),
    column :: number(),
    row :: number(),
    grid_state :: [number()],
    hitcount :: number(),
    size :: number()
}).
-type fleet() :: [#ship{}].

-record(strike, {
    id :: player_id(), 
    x :: number(),
    y :: number(), 
    res :: strike_res()
}).

-record(player, {
    id :: player_id(),
    board :: board()
}).

-record(game, {
    player_one :: #player{},
    player_two :: #player{},
    first_turn :: player_id(),
    turns :: [strike]
}).

