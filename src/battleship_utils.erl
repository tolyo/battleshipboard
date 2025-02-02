-module(battleship_utils).
-export([get_random_binary/2, update_list_at/3]).

-spec get_random_binary(T, T) -> T.
get_random_binary(Val1, Val2) ->
    case rand:uniform(2) of
        1 -> Val1;
        2 -> Val2
    end.

-spec update_list_at(list(), integer(), any()) -> list().
update_list_at([_ | T], 1, V) -> [V | T];
update_list_at([H | T], I, V) -> [H | update_list_at(T, I - 1, V)].
