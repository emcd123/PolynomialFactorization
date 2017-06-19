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
       print(li)

def zeroFill(L, Degree):
    for j in range(0,Degree):
        l = []
        for k in range(0,Degree):
            l.append(0)
        L.append(l)
    print(L)

def coefficientList(C):
    for i in li:
        f = i.coefficients()
        C.append(f)

def listFill(L,C):
    for i in range(0,len(C)):
        for j in range(0,len(C[i])):
            e = C[i][j][1]
            L[i][e] = sqrt((C[i][j][0])^2)

def convertToPoly(solnList,P):
    k = 0
    for i in solnList:
        for j in range(0,len(solnList[k])):
            #print(solnList[k][j])
            if(solnList[k][j] != 0):
                U = (solnList[k][j])*(x^(j))
                print(U)
                P[k] = P[k] + U
        print(P[k])
        k = k+1

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
coefficientList(polyCoefficients)
listFill(zeroList,polyCoefficients)
print(zeroList)

M = matrix(F,deg,deg, zeroList)
I = matrix.identity(deg)

M_I = M - I
M_I.echelon_form()
h = M_I.kernel()

H = h.basis()
print(H)

solnPolys = [0,0]
solnList = [H[0], H[1]]
print("soln list: " ,solnList)

convertToPoly(solnList,solnPolys)
%md Solution polynomial
print(solnPolys)

%md Prime Factorization of U(x) using Berlekamp algorithm
gcd(U,solnPolys[1]+1)
gcd(U,solnPolys[1])

%md Factorizing using the built in factor
%md Prime fatorisation of U(x):
u = factor(U)
show(u)