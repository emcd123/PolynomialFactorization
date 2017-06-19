︠92f9d79b-abae-480b-bff4-d033dce8091e︠
p=2
%md F = field of characteristic 2
F.<x> = PolynomialRing(GF(p))

U = (x)^5 + (x)^4 + 1
#show(U)
dU = diff(U,x)
#show(dU)

GCD = gcd(U,dU)
#show(GCD)

def gcdCheck(GCD,U,u):
    if (GCD == 1):
        print("U(x) is squarefree")
    else:
        if(GCD != U):
            print("d(x) is a proper factor of U(x)")
        else:
            print("d(x) = U(x)")

    f = list(u)
    #checking if any of the exponents on the factors is greater than 1
    flag = 0
    for i in range(0,4):
        ord = f[i][1]
        if (ord >1 ):
            flag = flag + 1
    if (flag == 1 ):
        print("There are repeated roots in U(x)")
    else:
        print("All roots are prime,irreducible and distinct in U(x)")


L = []
def Remainder(dividend,divisor):
     return (dividend._maxima_().divide(divisor).sage())[1]

li = []
def findRemainders(li):
    for k in range(0,5):
       R = Remainder(x^(p*k), U)
       li.append(R)
       print(li)

findRemainders(li)

def zeroL(L):
    for j in range(0,5):
        l = []
        for k in range(0,5):
            l.append(0)
        L.append(l)
    print(L)

C =[]
def coefficientList(C):
    for i in li:
        f = i.coefficients()
        C.append(f)

def listFill(L,C):
    for i in range(0,len(C)):
        for j in range(0,len(C[i])):
            e = C[i][j][1]
            L[i][e] = sqrt((C[i][j][0])^2)

zeroL(L)
coefficientList(C)
listFill(L,C)
print(L)

M = matrix(F,5,5, L)
I = matrix.identity(5)

M_I = M - I
M_I.echelon_form()
h = M_I.kernel()

H = h.basis()
print(H)

P = [0,0]
solnList = [H[0], H[1]]
print("soln list: " ,solnList)

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

convertToPoly(solnList,P)
%md solution polynomial
print(P)

gcd(U,P[1]+1)
gcd(U,P[1])

#factorizing using the built in factor
%md Prime fatorisation of U(x):
u = factor(U)
show(u)
#gcdCheck(GCD,U,u)