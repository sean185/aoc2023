filename = 'd08eg.txt'
filename = 'd08.txt'
with open(filename) as f:
    txt = f.read().splitlines()

instructions = txt[0]

links = dict()
for line in txt[2:]:
    source, branches = line.split(" = ")
    left, right = branches.strip("()").split(", ")
    links[source] = (left, right)

# part 1
curr = "AAA"
i = 0
while curr != "ZZZ":
    inst = instructions[i % len(instructions)]
    curr = links[curr][0 if inst == 'L' else 1]
    i += 1

print(i)

# part 2
def findz(source):
    curr = source
    i = 0
    while not curr.endswith("Z"):
        inst = instructions[i % len(instructions)]
        curr = links[curr][0 if inst == 'L' else 1]
        i += 1
    # return (source, i, curr)
    return i

starts = [k for k in links.keys() if k.endswith("A")]
recurs = [findz(s) for s in starts]
print(recurs)

# from functools import reduce
# print(reduce(lambda x, y: x * y, recurs))

def lcm(nums):
    # nums = sorted(nums)
    tally = nums[::]
    while not len(set(tally)) == 1:
        i = tally.index(min(tally))
        tally[i] += nums[i]
        # print(tally)
    return tally[0]

print(lcm([3, 4, 6]))
print(lcm(recurs))










