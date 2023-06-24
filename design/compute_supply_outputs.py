from argparse import ArgumentParser

import logging
import os
import sys

import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d.axes3d as axes3d
import numpy as np
import scipy.integrate
import scipy.optimize


CONST_C = 299792458
"""float: c (ms^1), universal physical constant for speed of light in a vacuum.

"""

CONST_K = 1.38064852e-23
"""float: k (J K^-1), Boltzmann constant.

"""

CONST_ROOM_TEMP = 298
"""int: T_25 (K), Room temperature in Kelvin.

"""

CONST_MU_0 = 1.2566370614e-6
"""float: \mu_0 (H m^{-1}), Permeability of free space 

"""

CONST_ETA = 0.90
"""float: eta (), Converter efficiency (assumed) 

"""

CONST_GAMMA = 0.01
"""float: gamma (),  ratio such that |v_ripple(t)| / V << gamma

"""

DEBUG_LOG = False
"""bool: DEBUG_LOG , switch on verbose logging."""



class LEDFixtureParams(object):

    P_nominal    =   65       #  (W) reference from HLG 65W product
    N            =  120       #  total number of LEDs 
    N_p          =    8       #  number of LEDs in parallel 
    N_s          =  N / N_p   #  implied number of LEDs in series
    MANUFACTURER = "Samsung Semiconductor, Inc."  #
    DESCRIPTION  = "LED LM301H"                   #
    PART_NUMBER  = "SPMWHD32AMH5XAP5SL"           #
    V_F          =    2.75    #  (V)  LED forward voltage drop
    I_test       =   65       #  (mA) LED test current
    I_nominal    =  P_nominal / N / V_F * 1e3
                              #  (mA) LED nominal current derived from HLG 65W product
    I_max        =  200       #  (mA) LED maximum rated current


class SupplyOutputs(object):

    V_O_max      =   54.0     #  (V)  Maximum output voltage chosen arbitrarily

    def __init__(self, ledFixtureParams):
        self.ledFixtureParams = ledFixtureParams


    def V_O_min(self):

        return self.ledFixtureParams.N_s * self.ledFixtureParams.V_F


    def V_O_nominal(self):

        return self.V_O_min() + 0.25    # arbitrary!


    def v_O_ripple_pk(self):

        return self.V_O_nominal() * CONST_GAMMA


    def I_O_nominal(self):

        return self.ledFixtureParams.N_p * self.ledFixtureParams.I_nominal


    def I_O_test(self):

        return self.ledFixtureParams.N_p * self.ledFixtureParams.I_test


    def I_O_max(self):

        return self.ledFixtureParams.N_p * self.ledFixtureParams.I_max


    def P_O_test(self):

        return self.I_O_test() * self.V_O_min() / 1e3


    def P_O_nominal(self):

        return self.I_O_nominal() * self.V_O_min() / 1e3


    def P_O_max(self):

        return self.I_O_max() * self.V_O_max / 1e3


def compute_supply_outputs():

    supplyOutputs = SupplyOutputs(LEDFixtureParams())

    print("V_O_min = {0} V  V_O_nominal = {1} V  V_O_max = {2} V  v_O_ripple_pk = {3} V"
          .format(supplyOutputs.V_O_min(), supplyOutputs.V_O_nominal(), supplyOutputs.V_O_max,
                  supplyOutputs.v_O_ripple_pk()))

    print("I_O_test = {0} mA  I_O_nominal = {1} mA  I_O_max = {2} mA"
          .format(supplyOutputs.I_O_test(), supplyOutputs.I_O_nominal(), supplyOutputs.I_O_max()))

    print("P_O_test = {0} W  P_O_nominal = {1} W  P_O_max = {2} W  "
          .format(supplyOutputs.P_O_test(), supplyOutputs.P_O_nominal(), supplyOutputs.P_O_max()))            

    return [supplyOutputs.V_O_min(), supplyOutputs.V_O_nominal(), supplyOutputs.V_O_max,
            supplyOutputs.I_O_test(), supplyOutputs.I_O_nominal(), supplyOutputs.I_O_max(),
            supplyOutputs.P_O_test(), supplyOutputs.P_O_nominal(), supplyOutputs.P_O_max()]


def main():
    compute_supply_outputs()

if __name__ == '__main__':
    status = main()
    sys.exit(status)
