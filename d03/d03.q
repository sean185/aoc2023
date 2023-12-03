txt:read0`:d03.txt
txt:read0`:d03eg.txt
where2d:{raze (til count x),/:'where each x} // get 2d coords
t:update chr:(txt ./: idx) from t:([] idx:where2d txt in\: .Q.n) // construct a table of the chrs
t:0!`g xgroup update g:sums 1<sum each abs deltas idx from t // get adj digits to form the group

// part 1
adjm:(1 0;-1 0;0 1;0 -1;1 1;-1 1;-1 -1;1 -1)
t:update nb:{distinct except[;x]raze adjm +\:/:x}each idx from t
exec sum "J"$chr from t where not all each (txt ./:/: nb) in\:" ."

// part 2
t:update gear:nb@'first each where each "*"=(txt ./:/: distinct each nb) from t
exec sum s from select s:prd "J"$chr by gear from t where 1<(count;i) fby gear, 0<count each gear
