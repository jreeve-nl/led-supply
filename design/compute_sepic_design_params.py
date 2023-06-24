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



class SupplyInputs():

    V_line_min     = 100      #  (V rms) Minimum line input voltage
    V_line_nominal = 230      #  (V rms) Nominal line input voltage
    V_line_max     = 250      #  (V rms) Maximum line input voltage


    def __init__(self, supplyOutputs):
        self.supplyOutputs = supplyOutputs


    def P_I_test(self):

        return self.supplyOutputs.P_O_test() / CONST_ETA


    def P_I_nominal(self):

        return self.supplyOutputs.P_O_nominal() / CONST_ETA 


    def P_I_max(self):

        return self.supplyOutputs.P_O_max() / CONST_ETA


    def I_I_min(self):

        return self.supplyOutputs.P_O_test() / (self.V_line_max * np.sqrt(2))


    def I_I_nominal(self):

        return self.supplyOutputs.P_O_nominal() / (self.V_line_nominal * np.sqrt(2))


    def I_I_max(self):

        return self.supplyOutputs.P_O_max() / (self.V_line_min * np.sqrt(2))



def compute_supply_inputs():

    supplyInputs = SupplyInputs(SupplyOutputs(LEDFixtureParams()))

    print("P_I_test = {0} W  P_I_nominal = {1} W  P_I_max = {2} W"
          .format(supplyInputs.P_I_test(), supplyInputs.P_I_nominal(), supplyInputs.P_I_max()))
    print("I_I_min = {0} A rms  I_I_nominal = {1} A rms  I_I_max = {2} A rms"
          .format(supplyInputs.I_I_min(), supplyInputs.I_I_nominal(), supplyInputs.I_I_max()))

    # Assuming PF=1 !
    print("I_I_min_peak = {0} A  I_I_nominal_peak = {1} A  I_I_max_peak = {2} A"
          .format(supplyInputs.I_I_min() * np.sqrt(2),
                  supplyInputs.I_I_nominal() * np.sqrt(2),
                  supplyInputs.I_I_max() * np.sqrt(2)))


    return supplyInputs



class DiodeBridgeParams():

    f_line         =  50      #  (Hz)    Nominal line frequency
    V_F            =   0.7    #  (V)     Diode forward voltage drop


    def __init__(self, supplyOutputs, supplyInputs):
        self.supplyOutputs = supplyOutputs
        self.supplyInputs = supplyInputs


    def V_O_max(self):
        # This is actually V_O_nominal !!
        return self.supplyInputs.V_line_nominal * np.sqrt(2.0) - 2.0 * self.V_F


    def V_O_min(self):

        return self.supplyInputs.V_line_min * np.sqrt(2.0) - 2.0 * self.V_F


    def V_O_ripple(self):

        return self.V_O_max() * CONST_GAMMA 


    def R_L(self):

        return self.V_O_max() ** 2 / self.supplyInputs.P_I_max()


    def C(self):

        T = 1 / (2 * self.f_line)
        I = self.V_O_max() / self.R_L()

        return I * T / self.V_O_ripple() * 1e6  #uF



def compute_diode_bridge_params():

    supplyOutputs = SupplyOutputs(LEDFixtureParams())
    diodeBridgeParams = DiodeBridgeParams(supplyOutputs,
                                          SupplyInputs(supplyOutputs))

    print("V_O_max = {0} V  V_O_ripple = {1} V"
          .format(diodeBridgeParams.V_O_max(), diodeBridgeParams.V_O_ripple()))
    print("R_L = {0} Ohm  C = {1} uF"
          .format(diodeBridgeParams.R_L(), diodeBridgeParams.C()))

    return diodeBridgeParams



class SepicDesignParams():

    f_s             = 132e3    #  (Hz)  Nominal switching frequency
                               #        (commercial transformers available)
    T_s             = 1/f_s    #  (s)   Nominal switching period
    RATIO_Delta_i_L =   0.1    #  ()    Ratio of inductor/output ripple current
                               #        to nominal current
    RATIO_Delta_v_C =   0.01   #  ()    Ratio of capacitor/output ripple
                               #        voltage to nominal output voltage
                               #        (ripple current contributes to this)

    def __init__(self, diodeBridgeParams, supplyOutputs):
        self.diodeBridgeParams = diodeBridgeParams
        self.supplyOutputs = supplyOutputs


    def D_min(self):

        return self.supplyOutputs.V_O_nominal()                               \
            / (self.diodeBridgeParams.V_O_max()                               \
               + self.supplyOutputs.V_O_nominal())


    def D_max(self):

        return self.supplyOutputs.V_O_nominal()                               \
            / (self.diodeBridgeParams.V_O_min()                               \
               + self.supplyOutputs.V_O_nominal())


    def Delta_i_L_1(self):

        return (1 - self.D_min()) * self.supplyOutputs.V_O_nominal()          \
            / (self.L_1_min() * self.f_s) * 2.0 * 1e6


    def Delta_i_L_2(self):

        return (1 - self.D_min()) * self.supplyOutputs.V_O_nominal()          \
            / (self.L_2_min() * self.f_s) * 2.0 * 1e6


    def Delta_v_C_1(self):

        return self.supplyOutputs.V_O_nominal() * self.RATIO_Delta_v_C


    def Delta_v_C_2(self):

        return self.supplyOutputs.V_O_nominal() * self.RATIO_Delta_v_C


    def L_1_min(self):
        L_1_min = (1 - self.D_min()) ** 2 * self.supplyOutputs.V_O_nominal()  \
            / (self.D_min() * 2.0 * self.supplyOutputs.I_O_nominal()          \
               * self.f_s) * 1e3 * 1e6
        return L_1_min


    def L_2_min(self):
        L_2_min = (1 - self.D_min()) * self.supplyOutputs.V_O_nominal()       \
            / (2.0 * self.supplyOutputs.I_O_nominal()                         \
               * self.f_s) * 1e3 * 1e6
        return L_2_min


    def C_1_min(self):
        C_1_min = self.supplyOutputs.I_O_nominal() * self.D_max() * self.T_s  \
            / self.Delta_v_C_1() * 1e6 * 1e-3   #  uF
        return C_1_min


    def C_2_min(self):
        C_2_min = self.supplyOutputs.I_O_nominal() * self.D_max() * self.T_s  \
            / self.Delta_v_C_2() * 1e6 * 1e-3   #  uF
        return C_2_min


def compute_sepic_design_params():

    supplyOutputs = SupplyOutputs(LEDFixtureParams())
    diodeBridgeParams = DiodeBridgeParams(supplyOutputs,
                                          SupplyInputs(supplyOutputs))

    sepicDesignParams = SepicDesignParams(diodeBridgeParams,
                                          supplyOutputs)

    print("D_min = {0}  D_max = {1}".format(sepicDesignParams.D_min(),
                                            sepicDesignParams.D_max()))
    print("L_1_min = {0} uH  L_2_min = {1} uH"
          .format(sepicDesignParams.L_1_min(), sepicDesignParams.L_2_min()))
    print("Delta_i_L_1 = {0} A  Delta_i_L_2 = {1} A"
          .format(sepicDesignParams.Delta_i_L_1(),                        \
                  sepicDesignParams.Delta_i_L_2()))
    print("Delta_v_C_1 = {0} V  C_1_min = {1} uF"
          .format(sepicDesignParams.Delta_v_C_1(), sepicDesignParams.C_1_min()))
    print("Delta_v_C_2 = {0} V  C_2_min = {1} uF"
          .format(sepicDesignParams.Delta_v_C_2(), sepicDesignParams.C_2_min()))

    return sepicDesignParams


def main():
    compute_sepic_design_params()

if __name__ == '__main__':
    status = main()
    sys.exit(status)
