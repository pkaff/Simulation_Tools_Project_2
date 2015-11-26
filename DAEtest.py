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
from squeezer import squeezer, init_squeezer



def run_example():

	def residual(t,y,yd):

		res_0 = yd[0]-y[2]
		res_1 = yd[1]-y[3]
		res_2 = yd[2]+y[4]*y[0]
		res_3 = yd[3]+y[4]*y[1]+9.82
		res_4 = y[2]**2+y[3]**2-y[4]*(y[0]**2+y[1]**2)-y[1]*9.82

		return np.array([res_0,res_1,res_2,res_3,res_4])
	
	#The initial conditons
	t0  = 0.0 #Initial time
	y0r  = [1.0, 0.0, 0.0, 0.0, 0.0] #Initial conditions
	yd0r = [0.0, 0.0, 0.0, -9.82, 0.0] #Initial conditions
	y0, yd0 = init_squeezer()

	model = Implicit_Problem(squeezer, y0, yd0, t0)             #Create an Assimulo problem
	model.name = '7-arm funky mechanic'        #Specifies the name of problem (optional)

	sim = IDA(model) #Create the IDA solver
	
	sim.algvar = 7*[True] + 7*[True] + 6*[False]
	atol = np.array(14*[1.0e-6,] + 6*[1.0e5])
	sim.atol = atol
	tfinal = 0.03        #Specify the final time
	#ncp = 500            #Number of communcation points (number of return points)

	t,y,yd = sim.simulate(tfinal) #Use the .simulate method to simulate and provide the final time and ncp (optional)
	
	sim.plot()

if __name__=='__main__':
	run_example()
