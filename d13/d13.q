f:`:d13eg.txt
f:`:d13.txt
pats:"\n" vs/: "\n\n" vs "\n" sv read0 f
folds:{m:reverse n:1+til t:-1+count x; {l:y#x;r:y _x;m:min y,z;(neg[m]#l)~reverse m#r}[x;;]'[n;m]}
symmetry:{where each (folds x;folds flip x)}
sum {sum 100 1*1+first each symmetry x}each pats
// part 2
perm:{idx:(til count x) cross til count first x;.[x;;:;]'[idx;not[x]./:idx]}
sum {
    old:symmetry x; 
    m:distinct symmetry each perm x;
    m:distinct m except'\:old; 
    r:m where 0<count each raze each m;
    sum 100 1*1+first each first r 
    }each "#"=pats
