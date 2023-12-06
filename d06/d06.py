# part 1
from functools import reduce
times = [7, 15, 30]; dists = [9, 40, 200]
times = [61, 70, 90, 66]; dists = [643, 1184, 1362, 1041]
def fn(t, d):
    for i in range(t):
        if i*(t-i)>d:
            break
    return (t+1)-2*i

res = [fn(t,d) for t, d in zip(times, dists)]
print(reduce(lambda x, y: x*y, res))

# part 2
# use quadratic formula to determine exact roots
from math import floor, ceil
def fn(t, d):
    root = (t*t-4*d)**0.5
    lb = floor(1+(-t+root)/-2) # must ensure is greater to break the record
    ub = ceil(-1+(-t-root)/-2) # vice versa
    return ub-lb+1

print(fn(71530, 940200))
print(fn(61709066, 643118413621041))

