txt:","vs first read0`:d15eg.txt
txt:","vs first read0`:d15.txt
hash:{mod[;256]17*x+y}/[0;]
sum hash each `long$txt

slot:{[t;s] 
    b:hash`long$l:$["-"=last s;-1_s;first"="vs s];
    $[null ln:"J"$last"="vs s;
        delete from t where label=`$l;
        t upsert enlist`box`label`lens!(b;`$l;ln)
    ]
    }/[([]box:`long$();label:`$();lens:`long$());];

exec sum raze score from 
select score:(box+1)*(1+iasc pos)*lens by box from 
`box`pos xasc select last lens, pos:first i by box, label from slot txt
