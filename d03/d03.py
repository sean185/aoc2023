filename = 'd03eg.txt'
filename = 'd03.txt'
with open(filename) as f:
    txt = f.read().splitlines()

# part 1
nums = []
symbols = []
for j, l in enumerate(txt):
    chrs = ''; pos = []
    for i, c in enumerate(l):
        if c in '0123456789':
            chrs += c
            pos.append((i, j))
        else:
            if c != '.': 
                symbols.append((i, j))
            if chrs != '':
                nums.append((int(chrs), pos))
                chrs = ''; pos = []
    if chrs != '':
        nums.append((int(chrs), pos))
        chrs = ''; pos = []

dirs = [(-1, -1), (0, -1), (1, -1), (1, 0), (1, 1), (0, 1), (-1, 1), (-1, 0)]
search_area = set()
for symbol in symbols:
    for dir in dirs:
        search_area.add(tuple([sum(x) for x in zip(symbol, dir)]))

parts = []
for num, pos in nums:
    if len(set(pos).intersection(search_area)) > 0:
        parts.append(num)

print(sum(parts))

# part 2
gears = [s for s in symbols if txt[s[1]][s[0]] == '*']
result = 0
for gear in gears:
    search_area = set()
    for dir in dirs:
        search_area.add(tuple([sum(x) for x in zip(gear, dir)]))
    parts = []
    for num, pos in nums:
        if len(set(pos).intersection(search_area)) > 0:
            parts.append(num)
    if len(parts) == 2:
        result += parts[0]*parts[1]

print(result)