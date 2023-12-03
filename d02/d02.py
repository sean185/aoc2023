filename = 'd02eg.txt'
filename = 'd02.txt'

from functools import reduce 

with open(filename) as f:
    txt = f.read().splitlines()

def parse_game(chars):
    gameid, draws = chars.split(":")
    id = int(gameid.split()[1])
    draws = parse_draw(draws)
    return (id, draws)

def parse_draw(chars):
    draws = [parse_cubes(c) for c in chars.strip().split(";")]
    return reduce(vec_op(max), draws)

def parse_cubes(chars):
    cubes = [parse_pair(*c.strip().split(" ")) for c in chars.strip().split(",")]
    return reduce(vec_op(sum), cubes)

def parse_pair(num, color):
    mag = int(num)
    return {'red':(mag, 0, 0), 'green':(0, mag, 0), 'blue':(0, 0, mag)}[color]

def vec_op(op):
    return lambda x, y: tuple([op(v) for v in zip(x, y)])

games = [parse_game(t) for t in txt]

# part 1
possible = [g for g in games if all(vec_op(lambda x:x[0]<=x[1])(g[1], (12, 13, 14)))]
print(sum([g[0] for g in possible]))

# part 2
print(sum([reduce(lambda x, y: x*y,g[1]) for g in games]))
