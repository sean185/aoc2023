f:`:d08eg.txt
f:`:d08.txt
f:`:d08eg2.txt
txt:read0 f
inst:`$'first txt
t:`n`L`R!/:{x:"=" vs x;`$enlist[x 0],"," vs x[1] except "()"} each 2_ txt
pt1:{if[x[0]=`ZZZ;:x];(exec from t where n=x 0)[inst x[1]mod count inst],x[1]+1}/
pt1[`AAA,0]

pt2:{if[x[0]like"*Z";:x];(exec from t where n=x 0)[inst x[1]mod count inst],x[1]+1}/
nums:last each pt2 each (exec n from t where n like "*A"),'0
gcd:max@{if[any 0=x;:x];last[x],(mod/)desc x}/
lcm:{[x;y]`long$(x*y)%gcd x,y}
(lcm/) 15871 19637 12643 14257 21251 19099
