filename = 'd01eg1.txt'
filename = 'd01eg2.txt'
filename = 'd01.txt'

with open(filename) as f:
    txt = f.read().splitlines()
# print(txt)

# part 1
def check(line):
    pos = []
    for i, c in enumerate(line):
        if c in "123456789":
            pos.append(i)
    return int(line[pos[0]]+line[pos[-1]])

# print(sum([check(l) for l in txt])) # does not work for eg1

def findall(s, m):
    matches = []
    i = s.find(m)
    while i > -1:
        matches.append(i)
        i = s.find(m, i+1)
    return matches

# part 2
numd = dict(zip(list("123456789")+["one","two","three","four","five","six","seven","eight","nine"], 2*[str(i) for i in range(1,10,1)]))

def check(line):
    matches = []
    for s, n in numd.items():
        matches.extend([(m, n) for m in findall(line, s)])
    matches.sort(key=lambda x:x[0])
    return int(matches[0][1]+matches[-1][1])

print(sum([check(l) for l in txt]))
