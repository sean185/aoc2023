filename = 'd13eg.txt'
filename = 'd13.txt'
with open(filename) as f:
    images = [img.splitlines() for img in f.read().split('\n\n')]

def parse(img):
    return [[c=='#' for c in line] for line in img]

images = [parse(img) for img in images]

def flip(lines):
    return [list(l) for l in zip(*lines)]

from pprint import pprint

def symmetry(img):
    v = len(img)
    poss = []
    for i in range(1, v):
        # take min(i,v-i) from position i
        n = min(i, v-i)
        left = img[i-n:i]
        right = img[i:i+n]
        if left == list(reversed(right)):
            poss.append(i)
    return poss

def check(img):
    # check horizontal symmetry
    h = symmetry(img)
    # check vertical symmetry
    v = symmetry(flip(img))
    return v+[x*100 for x in h]

print(sum([sum(check(img)) for img in images]))

def part2(img):
    orig = set(check(img))
    after = set()
    for i in range(len(img)):
        for j in range(len(img[0])):
            img[i][j] = not img[i][j]
            after.update(check(img))
            # print(v, h, orig)
            img[i][j] = not img[i][j]
    return after.difference(orig)

print(sum([sum(part2(img)) for img in images]))
