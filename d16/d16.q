f:`:d16eg.txt
f:`:d16.txt
map:read0 f
udlr:(-1 0;1 0;0 -1;0 1)
bound:{(all/)(x>=0;x<count map)} // luckily, map is square

// given a point, calc next state
step:{[p;d]
    // current location and direction determines next directions
    m:map . p;
    nd:$[
        m="\\"; 1#'2 3 0 1; // udlr => lrud
        m="/"; 1#'3 2 1 0; // udlr => rldu
        m="|"; (1#0;1#1;0 1;0 1); // udlr => ud(ud)(ud)
        m="-"; (2 3;2 3;1#2;1#3); // udlr => (lr)(lr)lr
        1#'4#d // no change in direction
    ][d];
    np:p +/: udlr nd;
    idx:where bound each np;
    flip `pos`dir!(np[idx];nd idx)
    };

trace:{[t] nxt:raze exec step'[pos;dir] from t where not visited; if[0=count nxt;:t]; (update visited:1b from t) upsert select from nxt where not ([]pos;dir) in (select pos, dir from t)}/
pt1:{exec count distinct pos from trace x} 
pt1([]pos:enlist 0 0; dir:3; visited:0b)

l:count map;
max pt1 each enlist each update visited:0b from 
([]pos:(til l),'0; dir:3),
([]pos:(til l),'l-1; dir:2),
([]pos:0,'(til l); dir:1),
([]pos:(l-1),'(til l); dir:0)
