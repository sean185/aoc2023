from pprint import pprint

filename = 'd07eg.txt'
filename = 'd07.txt'
with open(filename) as f:
    txt = f.read().splitlines()

# part 1 
SCOREMAP = dict(zip('23456789TJQKA',range(13)))
TYPES = [[1]*5, [1,1,1,2], [1,2,2], [1,1,3], [2,3], [1,4], [5]]

def classify(hand):
    d = {}
    for c in hand:
        d[c] = d.get(c, 0) + 1
    counts = sorted(d.values())
    return TYPES.index(counts)

def part1(txt, fn):
    hands = []
    for l in txt:
        hand, bid = l.split()
        hands.append({
            'hand': [SCOREMAP[c] for c in hand],
            'bid': int(bid),
            'type': fn(hand)
        })
    return hands

# rank them
hands = part1(txt, classify)
hands.sort(key=lambda d: [d['type']] + d['hand'])
print(sum([(i+1)*d['bid'] for i, d in enumerate(hands)]))

# part 2
SCOREMAP = dict(zip('J23456789TQKA',range(13)))

def joker(hand):
    if hand == 'JJJJJ' or 'J' not in hand:
        return classify(hand)
    possible = []
    for c in hand:
        possible.append(classify(hand.replace('J',c)))
    return max(possible)

# rank them
hands = part1(txt, joker)
hands.sort(key=lambda d: [d['type']] + d['hand'])
print(sum([(i+1)*d['bid'] for i, d in enumerate(hands)]))
