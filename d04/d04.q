txt:read0`:d04eg.txt
txt:read0`:d04.txt
prse:{x:":" vs x; id:"J"$last " " vs first x; nums:value each "|" vs last x; winning:first nums; nums:last nums; `id`winning`nums!(id;winning;nums)}
t:prse each txt
t:update c:count each winning inter' nums from t
// part 1
exec sum ?[c>1; 2 xexp c-1; c] from t
// part 2
t:update nxt:id+'1+til each c, extra:1 from t
exec sum extra from {[x;y]x pj 1!ungroup select id:nxt, extra from x where id=y}/[t;t`id]
