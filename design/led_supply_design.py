#!/usr/bin/env python

"""
led_supply_design.py: 

	Copyright (c) 2020 Jeremy Reeve <jreeve.nl@gmail.com>


"""



from argparse import ArgumentParser

import logging
import os
import sys

import matplotlib.pyplot as plt
import mpl_toolkits.mplot3d.axes3d as axes3d
import numpy as np
import scipy.integrate
import scipy.optimize

__author__ = "Jeremy Reeve"
__copyright__ = "Copyright 2020, Jeremy Reeve"
__credits__ = ["Jeremy Reeve"]
__license__ = "Murky"
__version__ = "1.0.1"
__maintainer__ = "Jeremy Reeve"
__email__ = "jreeve.nl@gmail.com"
__status__ = "Prototype"

# constants

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


# globals


# exception classes

# interface functions

# classes


# internal functions & classes


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





def main():
    compute_approx_snr_earth_surface()


if __name__ == '__main__':
    status = main()
    sys.exit(status)
