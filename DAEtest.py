#!/usr/bin/env python 
# -*- coding: utf-8 -*-
"""
Tutorial example showing how to use the implicit solver IDA. To run the example
simply type,

	run tutorialIDA.py (in IPython)
	
or,

	python tutorialIDA.py (in a command prompt)
"""
import numpy as np
from assimulo.problem import Implicit_Problem #Imports the problem formulation from Assimulo
from assimulo.solvers import IDA              #Imports the solver IDA from Assimulo
from squeezer import squeezer, squeezer2, init_squeezer
import matplotlib.pyplot as P


def run_example():
    def residual(t,y,yd):
        #return squeezer(t, y, yd)
        return squeezer2(t, y, yd)
        #return squeezer1(t, y, yd)
    
    #The initial conditons
    t0 = 0
    y0, yd0 = init_squeezer()

    model = Implicit_Problem(residual, y0, yd0, t0)             #Create an Assimulo problem
    model.name = 'Pendulum'        #Specifies the name of problem (optional)

    sim = IDA(model) #Create the IDA solver
    #sim.algvar = 7*[True] + 7*[False] + 6*[False]
    #sim.suppress_alg = True
    #sim.atol = 7*[1e-6] + 7*[1e5] + 6*[1e5]
    sim.algvar = 7*[True] + 7*[True] + 6*[False]
    sim.suppress_alg = True
    sim.atol = 7*[1e-6] + 7*[1e-6] + 6*[1e5]
        
    tfinal = 0.03        #Specify the final time
    ncp = 500            #Number of communcation points (number of return points)

    t,y,yd = sim.simulate(tfinal, ncp) #Use the .simulate method to simulate and provide the final time and ncp (optional)
    #for i in range(7):
        #y[:, i] = [(j % 123123123123*np.pi) - 0*np.pi for j in y[:, i]]
    #sim.plot()
    fig, ax = P.subplots()
    P.title('IDA, index 3 Andrew\'s squeezer, Lagrange multipliers')
    P.xlabel('Time')
    P.ylabel('Lambda')
    #P.axis([0, tfinal + 0.01, -0.7, 0.7])
    '''
    P.plot(t, y[:, 0], label='beta')
    P.plot(t, y[:, 1], label='theta')
    P.plot(t, y[:, 2], label='gamma')
    P.plot(t, y[:, 3], label='phi')
    P.plot(t, y[:, 4], label='delta')
    P.plot(t, y[:, 5], label='omega')
    #P.plot(t, y[:, 6], label='epsilon')
    '''
    legend = ax.legend(shadow=True)

    #plt.plot(t, y[:, 0])
    #plt.plot(t, y[:, 1])
    #plt.plot(t, y[:, 2])
    #plt.plot(t, y[:, 3])
    #plt.plot(t, y[:, 4])
    #plt.plot(t, y[:, 5])
    #plt.plot(t, y[:, 6])
    P.plot(t, y[:, 14])
    P.plot(t, y[:, 15])
    P.plot(t, y[:, 16])
    P.plot(t, y[:, 17])
    P.plot(t, y[:, 18])
    P.plot(t, y[:, 19])
    #plt.axis([0, tfinal, -0.7, 0.7])
    P.axis([0, tfinal, -100, 200])
    P.grid()
    P.show()

if __name__=='__main__':
	run_example()
