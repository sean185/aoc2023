f:`:d09eg.txt
f:`:d09.txt
txt:value each read0 f
fn:{$[all 0=x;x;1_ deltas x]}\
g:{sum last each fn x}
sum g each txt // part 1
sum g each reverse each txt // part 2
