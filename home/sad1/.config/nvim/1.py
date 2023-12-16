summator = 0
for i in range(3, 3*13, 3):
    if (summator > 1e8):
        ans = i
        break
    summator += 2**(i-1)

print(ans)
otvet = summator
sumi = 0  # я хочу посчитать сколько в прошлый раз было
for i in range(summator, int(1e8)-400):
    ans += 1
print(otvet)
# print(2**ans)
# print(2**(ans-1))
# print(new_ans := 2**ans)  # первое подходящее число
# for i in range(summator, int(1e8)-400):
#     new_ans += 1
# print(new_ans, "<- ans")
