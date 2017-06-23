%md F = Field of characteristic 3
p = 3
F.<x> = PolynomialRing(GF(p))

def gcdCheck():
    global U, GCD, pFactors
    if(GCD == 1):
        return "U(x) is a squarefree polynomial"
    else:
        U = U/GCD
        dU = diff(U,x)
        GCD = gcd(U,dU)
        pFactors.append(GCD)
        gcdCheck()

def DDF(U):
    i = 1
    f  = [1]
    F = U
    for k in range(1,p):
        V = x^(p^i) - x
        f.append(gcd(F/f[k-1],V))
        i = i + 1

#SquareFree Preparation
U = x^7 + (2*x^5) + x^3 + 2*x
#U = x^2 + x + 1
dU = diff(U,x)
GCD = gcd(U,dU)
pFactors = [GCD]
gcdCheck()
if(len(pFactors) > 1):
    print "Prime factors of polynomial: ", pFactors

DDF(U)