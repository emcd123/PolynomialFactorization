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
 
def DDF(U,f):
    i = 1
    F = U
    for k in range(1,p):
        V = x^(p^i) - x
        f.append(gcd(F//f[k-1],V))
        i = i + 1

def random_between(j,k) :
   a=int(random()*(k-j+1))+j
   return a

def randomPoly(U,f,j):
    r = 0
    degree = f[j].degree()
    for i in range(0,degree):
        r = r + (random_between(1,p) * x^i)
    return r

i = 0
def factorize(U,f,j):
    r = randomPoly(U,f,j)
    m = ((f[j].degree())-1)/(len(f) - 1)
    F = f[j]
    print(F)
    GCD = gcd(F,(r)^m + 1)
    factors = []
    global i
    if(i < 3):
        if (GCD == 1):
            return factorize(U,f,j)
        else:
            factors.append(GCD)
            F = F//GCD
            i = i + 1
            return factorize(U,f,j)
    else:
        print(factors)
        return factors

#SquareFree Preparation
U = x^7 + (2*x^5) + x^3 + 2*x
#U = x^2 + x + 1
dU = diff(U,x)
GCD = gcd(U,dU)
pFactors = [GCD]
gcdCheck()
if(len(pFactors) > 1):
    print "Prime factors of polynomial: ", pFactors

f  = [1]
r = [ 0 for k in range(0,p)]

DDF(U,f)
print(f)
for z in range(1,len(f)):
    factorize(U,f,z)
print(r)
