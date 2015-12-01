from numpy import cos, sin, array, zeros, arange
from numpy.linalg import norm
from scipy.optimize import fsolve
from squeezer import *


def gf(q):
    beta, gamma, phi, delta, omega, epsilon = q
    #beta = q[0]
    theta = 0
    #theta = q[1]
    #gamma = q[1]
    #phi = q[2]
    #delta = q[3]
    #omega = q[4]
    #epsilon = q[5]
    cobe = cos(beta)
    cobeth = cos(beta + theta)
    siga = sin(gamma)
    sibe = sin(beta)
    sibeth = sin(beta + theta)
    coga = cos(gamma)
    siphde = sin(phi + delta)
    cophde = cos(phi + delta)
    coomep = cos(omega + epsilon)
    siomep = sin(omega + epsilon)
    code = cos(delta)
    side = sin(delta)
    siep = sin(epsilon)
    coep = cos(epsilon)
    rr = 7.e-3
    d = 28.e-3
    ss = 35.e-3
    e = 2.e-2
    zf = 2.e-2
    zt = 4.e-2
    u = 4.e-2
    xb,yb=-0.03635,.03273
    xa,ya=-.06934,-.00227


    g=zeros((6,))
    g[0] = rr*cobe - d*cobeth - ss*siga - xb
    g[1] = rr*sibe - d*sibeth + ss*coga - yb
    g[2] = rr*cobe - d*cobeth - e*siphde - zt*code - xa
    g[3] = rr*sibe - d*sibeth + e*cophde - zt*side - ya
    g[4] = rr*cobe - d*cobeth - zf*coomep - u*siep - xa
    g[5] = rr*sibe - d*sibeth - zf*siomep + u*coep - ya
    return g

q0 = array([-0.36,  #  beta
0.1,   # gamma
0.12,   # phi
0.680,   # delta
-0.5,  # Omega
1.53])  
q0 = arange(6)
q0 = zeros([6, 1])
q = fsolve(gf, q0)
y, yp = init_squeezer()
y = y.tolist()
y = y[:7]
del y[1]
#y = np.array(y[0] + y[2:7])
print("y: ", y)
print("q: ", q)
print("y - q: ", y - q)
print(norm(y - q))
