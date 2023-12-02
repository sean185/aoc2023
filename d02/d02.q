// "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
// "(1; max((3*0 0 1)+ (4*1 0 0); (1*1 0 0)+ (2*0 1 0)+ (6*0 0 1); (2*0 1 0)))"
txt:read0`:d02eg.txt
txt:read0`:d02.txt
prse:{ssr[;"Game ";"("] ssr[;";";";("] ssr[;":";";max(("] ssr[;",";"+("] ssr[;" red";"*1 0 0)"] ssr[;" green";"*0 1 0)"] ssr[;" blue";"*0 0 1)"] x,")))"}
t:`id`mx!/:value each prse each txt
// part 1
exec sum id from t where all each mx<=\:(12 13 14)
// part 2
exec sum prd each mx from t
