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
    F = U
    f = [1]
    for k in range(1,p):
        V = x^(p^i) - x
        f.append(gcd(F//f[k-1],V))
        i = i + 1
    return f

def random_between(j,k) :
   a=int(random()*(k-j+1))+j
   return a

def randomPoly(U,f,j):
    r = 0
    degree = f[j].degree()
    for i in range(0,degree):
        r = r + (random_between(1,p) * x^i)
    return r


def factorize(U,f,j):
    V = f[j]
    r = randomPoly(U,f,j)
    deg = V.degree()
    m = ((deg - 1)/(len(f) - 1)
    d = gcd(V,(r)^m + 1)
    factors = []
    if(i < 3):
        if (d == 1):
            return factorize(U,f,j)
        else:
            factors.append(d)
            V = V//d
            i = i + 1
            return factorize(U,f,j)
    else:
      return factors

def Main():
    #SquareFree Preparation
    U = x^7 + (2*x^5) + x^3 + 2*x
    #U = x^2 + x + 1
    dU = diff(U,x)
    GCD = gcd(U,dU)
    gcdCheck()

    f = DDF(U)
    print(f)
    pFactors = []
    i  = 0
    #for z in range(0,len(f)):
        #li = factorize(U,f,z)
        #p.factors.append(li)
    #return pFactors

print("echo")
Main()