// part 1
txt:(7 15 30;9 40 200)
txt:(61 70 90 66;643 1184 1362 1041)
prd {sum y<reverse[r]*r:til x+1} ./: flip txt
// part 2
{sum y<reverse[r]*r:til x+1}[71530;940200]
{sum y<reverse[r]*r:til x+1}[61709066;643118413621041]