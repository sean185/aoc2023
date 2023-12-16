f:`:d16eg.txt
f:`:d16.txt
map:read0 f
udlr:(-1 0;1 0;0 -1;0 1)
bound:{all (x >= 0 0) and x < (count map; count first map)}
// given a point, calc next state
step:{[p;d]
    // current location and direction determines next directions
    m:map . p 0 1;
    nd:$[
        m="\\"; 1#'2 3 0 1; // udlr => lrud
        m="/"; 1#'3 2 1 0; // udlr => rldu
        m="|"; (1#0;1#1;0 1;0 1); // udlr => ud(ud)(ud)
        m="-"; (2 3;2 3;1#2;1#3); // udlr => (lr)(lr)lr
        1#'4#d // no change in direction
    ][d];
    np:p[0 1] +/: udlr nd;
    idx:where bound each np;
    flip `pos`dir!(np[idx];nd idx)
    };

trace:{nxt:raze exec step'[pos;dir] from x where not visited; if[0=count nxt;:x]; (update visited:1b from x) upsert select from nxt where not ([]pos;dir) in (select pos, dir from x)}/
pt1:{0N!exec count distinct pos from trace x} 
pt1([]pos:enlist 0 0; dir:3; visited:0b)

l:count map
max pt1 each enlist each  update visited:0b from 
([]pos:(til l),'0; dir:3),
([]pos:(til l),'l-1; dir:2),
([]pos:0,'(til l); dir:1),
([]pos:(l-1),'(til l); dir:0)
