f:`:d10eg.txt
f:`:d10eg2.txt
f:`:d10eg3.txt
f:`:d10eg4.txt
f:`:d10.txt
map:read0 f
// part 1
where2d:{raze (til count x),/:'where each x} // get 2d coords
udlr:(-1 0;1 0;0 -1;0 1)
check:"S-|7JLF"!(til 4;2 3;0 1;1 2;0 2;0 3;1 3)
valid:("|7F";"|JL";"-FL";"-7J")
// find pipes connected to the current point and update it with i+1
step:{
    t:select from x where order=max order;
    o:exec first order from t;
    t:update pipe:map ./: location from t;
    t:update possible:check pipe from t;
    t:update {l where b:(map ./: l:x+/:udlr y) in' valid[y]}'[location;possible] from t;
    t:ungroup select location:possible, visited:1b, order:o+1 from t;
    x,select from t where not location in x[`location]
    } 
last boundary:(step/)([]location:where2d "S"=map;visited:1b;order:0)
// 6897

// part 2
// expand the pipes so that flood fill can work
// extract the loop
loop:{.[x;y[`location];:;y[`tile]]}/[". "map=0;update tile:map ./: location from boundary]
// expand gaps between pipes
expandr:{x,y,$[y in "FL-";">";"."]}/[1#".";]
expandd:{x,y,$[y in "SF7|";"v";"."]}/[1#".";]
expand:{flip expandd each flip expandr each x}
// flood fill
flood:{last {pos:first x;m:last x;m:.[;;:;" "]/[m;]r:distinct npos where "."=m ./: npos:raze pos+\:/:udlr;(r;m)}/[(enlist 0 0;x)]}
// drop rows and columns 
contract:{flip x where not ">" in/:x:flip x where not "v"in/:x}
sum "."=raze contract flood expand loop
// 367 
