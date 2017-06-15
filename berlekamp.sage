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
    for i in range(0,len(list(u))):
        ord = f[i][1]
        if (ord >1 ):
            flag = flag + 1
    if (flag == 1 ):
        print("There are repeated roots in U(x)")
    else:
        print("All roots are prime,irreducible and distinct in U(x)")

gcdCheck(GCD,U,u)

M = MatrixSpace(F,5,4)

def Remainder(dividend,divisor):
     return (dividend._maxima_().divide(divisor).sage())[1]

def matrixFill(M):
    list = []
    for k in range(0,5):
       R = Remainder(x^(p*k), U)
       list.append(R)
       print(list)
    return list

matrixFill(M)


#factorizing using the built in factor
%md Prime fatorisation of U(x):
u = factor(U)
show(u)
