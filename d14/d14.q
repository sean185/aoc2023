f:`:d14.txt
f:`:d14eg.txt
txt:read0 f
push:{o:where x="O"; n:?["."=x o+1;o+1;o]; @[ssr[x;"O";"."];n;:;"O"]}/
move:{flip reverse each push each reverse each flip x}
calc:{sum (1+til count x)*reverse sum each "O"=x}
calc move txt
// part 2
rotate90:{reverse each flip x}
cycle:{rotate90 move rotate90 move rotate90 move rotate90 move x}
iter:{[x] show m:calc c:cycle x; hash:`$string[m],raze c; if[hash in s; s,:hash; :x]; s,:hash; c}/
s:(); iter[txt]
a:where s=last s; "J"$first "." vs string s@a[0]+(1000000000-a[0]+1) mod a[1]-a[0]
