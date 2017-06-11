#!/usr/bin/env sage

import sage.all

sum = 0
for i in range(0,10):
	sum += i^2
print(sum)

f = sage.all.factor(sum)
print(f)