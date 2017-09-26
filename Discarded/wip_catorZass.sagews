
print "F = Field of characteristic 3"
p = 3
F.<x> = PolynomialRing(GF(p))

def gcdCheck(U,GCD, pFactors):
    #global  GCD, pFactors
    if(GCD == 1):
        return "U(x) is a squarefree polynomial"
    else:
        U = U/GCD
        dU = diff(U,x)
        GCD = gcd(U,dU)
        gcdCheck(U, GCD, pFactors)

def DDF(U):
    i = 1
    F = U
    f = [1]
    for k in range(1,p):
        V = x^(p^i) - x
        f.append(gcd(F//f[k-1],V))
        i = i + 1
    return f

def random_between(j,k) :
    a = int(random()*(k-j+1))+j
    return a

def randomPoly(U,f,j):
    r = 0
    degree = f[j].degree()
    for i in range(0,degree):
        r = r + random_between(1,p) * x^i
    return r


def factorize(U,f,j):
    V = f[j]
    r = randomPoly(U,f,j)
    deg = V.degree()
    m = (p^j - 1) / 2
    R = r^m + 1
    factors = []
    max_factors = deg / j
    while(len(factors) < max_factors):
        d = gcd(V,R)
        while(d == 1):
            r = randomPoly(U,f,j)
            d = gcd(V,(r)^m + 1)
        if(d != 1):
            factors.append(d)
            V = V//d
    return factors

def Main():
    U = x^7 + (2*x^5) + x^3 + 2*x
    #U = x^2 + x + 1
    dU = diff(U,x)
    GCD = gcd(U,dU)
    pFactors = []
    gcdCheck(U, GCD, pFactors)
    f = DDF(U)
    i  = 0
    for z in range(1,len(f)):
        li = factorize(U,f,z)
        pFactors.append(li)
    return pFactors

Main()
