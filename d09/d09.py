filename = 'd09eg.txt'
filename = 'd09.txt'
with open(filename) as f:
    txt = f.read().splitlines()

seqs = [[int(y) for y in x.split()] for x in txt]

def findnext(seq):
    subseqs = [seq]
    tmp = subseqs[-1]
    while not set(tmp) == {0}:
        subseqs.append([tmp[i+1]-tmp[i] for i in range(len(tmp)-1)])
        tmp = subseqs[-1]
    # print(subseqs)
    return sum([seq[-1] for seq in subseqs])

print(sum([findnext(seq) for seq in seqs]))
print(sum([findnext(list(reversed(seq))) for seq in seqs]))