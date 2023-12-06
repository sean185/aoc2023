f:`:d05eg.txt
f:`:d05.txt
inp:{x:"\n" vs x; value each $[1=count x;x;1_ x]} each last each ": " vs/: "\n\n" vs "\n" sv read0 f
maps:`d`s`r!/:/: 1_ inp
seed:first inp
// part 1
fn:{[m;n] n^exec first d+n-s from m where n within (s;s+r-1)}
min {[s;m] fn[m;]each s}/[first seed;maps]

// part 2 - to map ranges, break them up into sub ranges
// determine how the range splits
spl:{[sro;dsr] // 2 x (s;r) pairs
    x1:sro 0; x2:-1+sum sro[0 1]; y1:dsr 1; r:dsr 2; y2:-1+y1+r; o:dsr[0]-dsr[1];
    $[
        (x2<y1)or(x1>y2); enlist(sro); // OOB case, return self
        (x1>=y1)and(x2<=y2); enlist(sro+(0;0;o)); // subset of range case, also return self
        x1>=y1; ((x1;1+min[x2,y2]-x1;o);(y2+1;x2-y2;0)); // left side
        x2<=y2; ((x1;y1-x1;0);(y1;r;o)); // right side
        ((x1;y1-x1;0);(y1;r;o);(y2+1;x2-y2;0)) // within
    ]
    }

spl[74 13 0;52 50 48] // no move
spl[74 30 0;52 50 48] // partial move
spl[74 13 0;10 39 48] // all move by -29
spl[39 48 0;10 74 13] // right-bounded partial move
spl[74 13 0;0 79 4] // center portion move
spl[74 13 0;0 74 8] // left-bounded move
{raze spl[;y]each x}/[(74 13 0; 55 10 0);(0 74 4; 100 80 4)]

// pass in (start;range;offset), apply (dest;source;range), get back (start;range;offset)...
fn:{[inps;m] {(sum x 0 2;x 1; 0)} each {raze spl[;y]each x}/[inps;exec flip(d;s;r) from m] }
asc fn/[(2 cut first seed),'0;maps]

