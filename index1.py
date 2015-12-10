#!/usr/bin/env python 
# -*- coding: utf-8 -*-

# Copyright (C) 2010 Modelon AB
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

import numpy as N
import pylab as P
import nose
from assimulo.solvers import Dopri5
from assimulo.problem import Explicit_Problem
from squeezer import *

def run_example(with_plots=True):
    r"""
    Example to demonstrate the use of the Runge-Kutta solver DOPRI5
    for the linear test equation :math:`\dot y = - y`
    
    on return:
    
       - :dfn:`exp_mod`    problem instance
    
       - :dfn:`exp_sim`    solver instance
    
    """    
    #Defines the rhs
    def f(t,y):
        ydot = -y[0]
        return N.array([ydot])

    lambs = []
    def f2(t, y):
        v, w, lamb = squeezer1(t, y)
        lambs.append(lamb)
        return N.bmat( [ [v.T], w.T    ]).T


    #Define an Assimulo problem
    y, yp = init_squeezer()
    y = y[:14]
    exp_mod = Explicit_Problem(f2, y,
              name = 'DOPRI5, index 1 Andrew\'s squeezer')
    
    exp_sim = Dopri5(exp_mod) #Create a Dopri5 solver

    #Simulate
    tfinal = 0.03
    exp_sim.inith = 1e-10
    exp_sim.atol = 1e-10
    exp_sim.rtol = 1e-10
    t, y = exp_sim.simulate(tfinal) #Simulate 5 seconds
    
    #Basic test
    #nose.tools.assert_almost_equal(float(y[-1]),0.02695199,5)
    
    #Plot
    if with_plots:
        #P.plot(t,y)
        fig, ax = P.subplots()
        P.title(exp_mod.name)
        P.xlabel('Time')
        P.ylabel('Angle')
        P.axis([0, tfinal + 0.01, -0.7, 0.7])
        P.plot(t, y[:, 0], label='beta')
        P.plot(t, y[:, 1], label='theta')
        P.plot(t, y[:, 2], label='gamma')
        P.plot(t, y[:, 3], label='phi')
        P.plot(t, y[:, 4], label='delta')
        P.plot(t, y[:, 5], label='omega')
        P.plot(t, y[:, 6], label='epsilon')
        legend = ax.legend(shadow=True)
        P.grid()
     
        P.show()
        
    return exp_mod, exp_sim

if __name__=='__main__':
    mod,sim = run_example()
