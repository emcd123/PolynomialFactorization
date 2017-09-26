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

def findRemainders(Degree,U):
    li = []
    for k in range(0,Degree):
       R = Remainder(x^(p*k), U)
       li.append(R)
    return li

#Create a list of lists of zero's
def zeroFill(Degree):
    zeroList = []
    for j in range(0,Degree):
        l = []
        for k in range(0,Degree):
            l.append(0)
        zeroList.append(l)
    return zeroList

#Find the polynomial coefficients
def coefficientList(li):
    polyCoefficients =[]
    for i in li:
        f = i.coefficients()
        polyCoefficients.append(f)
    return polyCoefficients

#Modified the zero lists to contain the coefficients of polynomials
def listFill(L,C):
    for i in range(0,len(C)):
        for j in range(0,len(C[i])):
            e = C[i][j][1]
            L[i][e] = sqrt((C[i][j][0])^2)
    return L

def matrixSolns(Degree, L):
    #Feed our lists into a matrix and solve
    M = matrix(F,Degree,Degree, L)
    I = matrix.identity(Degree)

    M_I = M - I
    h = M_I.kernel()
    H = h.basis()
    return H

#Convert the coefficient matrix rows back to polynomial form
def convertToPoly(H):
    k = 0
    solnPolys = [0,0]
    solnList = [H[0], H[1]]
    for i in solnList:
        for j in range(0,len(solnList[k])):
            if(solnList[k][j] != 0):
                U = (solnList[k][j])*(x^(j))
                solnPolys[k] = solnPolys[k] + U
        k = k+1
    return solnPolys

def Main():
    #Define thepolynomial and check for squarefreeness
    U = (x)^5 + (x)^4 + 1
    dU = diff(U,x)
    GCD = gcd(U,dU)
    gcdCheck(GCD,U)
    deg = U.degree()

    filledList = listFill(zeroFill(deg),coefficientList(findRemainders(deg, U)))

    #Take matrix solutions and add to a list,then convert back to polynomial form
    polynomials = convertToPoly(matrixSolns(deg,filledList))

    %md Prime Factorization of U(x) using Berlekamp algorithm:
    pFactors = []
    pFactors.append(gcd(U,polynomials[1]+1))
    pFactors.append(gcd(U,polynomials[1]))

    return pFactors

Main()
