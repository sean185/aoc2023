f:`:d07eg.txt
f:`:d07.txt
t:flip `hand`bid!("*J";" ")0: read0 f
ord:"23456789TJQKA"
gettype:{
    m:desc value g:count each group x;
    $[
        5=first m;6;
        4=first m;5;
        3 2~m;4;
        3=first m;3;
        2 2 1~m;2;
        2=first m;1;
        0
        ]
    }
// part 1
exec sum bid*i+1 from `typ`pow xasc update typ:gettype each hand, pow:ord ? hand from t

// part 2
ord:"J23456789TQKA"
getbesttype:{[hand] 
    if[(all "J"=hand)or not "J" in hand;:gettype hand]; 
    try:distinct hand except "J";
    max gettype each hands:ssr[hand;"J";] each try
    }
exec sum bid*i+1 from `typ`pow xasc update typ:getbesttype each hand, pow:ord ? hand from t
