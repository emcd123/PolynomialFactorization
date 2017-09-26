pFactor(U) that returns a list of factors

pFactor(U):
	if(degree(U)  1):
		return 
	d = gcd(U,dU)
	if(dgree(d) >= 1)
		return facotr(U) + factor(U/gcd(U,dU))

	return squareFreeFactorization(U)
