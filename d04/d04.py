filename = 'd04eg.txt'
filename = 'd04.txt'
with open(filename) as f:
    txt = f.read().splitlines()

def parse(line):
    card, numbers = line.split(':')
    card = int(card[4:])
    winning, mynums = numbers.split(' |')
    winning = {int(winning[i+1:i+3]) for i in range(0, len(winning), 3)}
    mynums = {int(mynums[i+1:i+3]) for i in range(0, len(mynums), 3)}
    return (card, winning, mynums)

scratchcards = [parse(line) for line in txt]

# part 1
total = 0
for card, winning, mynums in scratchcards:
    c = len(winning.intersection(mynums))
    if c == 0:
        continue
    total += 2**(c-1)

print(total)

# part 2
tally = {card:1 for card, _, _ in scratchcards}
for card, winning, mynums in scratchcards:
    c = len(winning.intersection(mynums))
    if c == 0:
        continue
    for i in range(c):
        tally[card+i+1] += tally[card]

print(sum(tally.values()))
