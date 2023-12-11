txt:read0`:d11eg.txt
txt:read0`:d11.txt
expand:{$[10h=type x;enlist x;x],$[all y=".";2;1]#enlist y}/
map:flip expand flip expand txt
where2d:{raze (til count x),/:'where each x} // get 2d coords
div[;2]sum raze {x {sum abs x-y}\:/: x}where2d"#"=map

expand:{d:{?[x>1;x-1;0]} o:deltas first x:flip asc x; x[0]:sums o+d*y-1; flip x}
div[;2]sum raze {x {sum abs x-y}\:/: x}
asc reverse each expand[;10] reverse each expand[;10] where2d"#"=txt
asc reverse each expand[;100] reverse each expand[;100] where2d"#"=txt
asc reverse each expand[;1000000] reverse each expand[;1000000] where2d"#"=txt
