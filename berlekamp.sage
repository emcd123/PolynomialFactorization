p = 2
%md F = field of characteristic 2
F.<x> = PolynomialRing(GF(p))

def gcdCheck(GCD,U):
    if (GCD == 1):
        print("U(x) is squarefree")
    else:
        if(GCD != U):
            print("d(x) is a proper factor of U(x)")
        else:
            print("d(x) = U(x)")

def Remainder(dividend,divisor):
     return (dividend._maxima_().divide(divisor).sage())[1]

def findRemainders(li, Degree):
    for k in range(0,Degree):
       R = Remainder(x^(p*k), U)
       li.append(R)

#Create a list of lists of zero's
def zeroFill(L, Degree):
    for j in range(0,Degree):
        l = []
        for k in range(0,Degree):
            l.append(0)
        L.append(l)

#Find the polynomial coefficients
def coefficientList(C,li):
    for i in li:
        f = i.coefficients()
        C.append(f)

#Modified the zero lists to contain the coefficients of polynomials
def listFill(L,C):
    for i in range(0,len(C)):
        for j in range(0,len(C[i])):
            e = C[i][j][1]
            L[i][e] = sqrt((C[i][j][0])^2)

#Convert the coefficient matrix rows back to polynomial form
def convertToPoly(solnList,P):
    k = 0
    for i in solnList:
        for j in range(0,len(solnList[k])):
            if(solnList[k][j] != 0):
                U = (solnList[k][j])*(x^(j))
                P[k] = P[k] + U
        k = k+1

#Define thepolynomial and check for squarefreeness
U = (x)^5 + (x)^4 + 1
dU = diff(U,x)
GCD = gcd(U,dU)
gcdCheck(GCD,U)
deg = U.degree()

zeroList = []
remainderList = []
polyCoefficients =[]

findRemainders(remainderList, deg)
zeroFill(zeroList, deg)
coefficientList(polyCoefficients,remainderList)
listFill(zeroList,polyCoefficients)

#Feed our lists into a matrix and solve
M = matrix(F,deg,deg, zeroList)
I = matrix.identity(deg)

M_I = M - I
h = M_I.kernel()
H = h.basis()

#Take matrix solutions and add to a list,then convert back to polynomial form
solnPolys = [0,0]
solnList = [H[0], H[1]]
convertToPoly(solnList,solnPolys)

%md Prime Factorization of U(x) using Berlekamp algorithm:
gcd(U,solnPolys[1]+1)
gcd(U,solnPolys[1])

%md Prime fatorisation of U(x) using the built in factor method:
factor(U)
