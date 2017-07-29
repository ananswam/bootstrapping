# cython: boundscheck=False
# cython: cdivision=True
# cython: wraparound=False

import numpy as np
cimport numpy as np

cimport random as cyrandom

def bootstrap(np.ndarray data, unsigned num_samples=10000, f=np.mean):
    """

    :param data: (np.ndarray) An array with n dimensions where the first dimension indexes each data point
                 to resample. The rest of the array can be shaped however you want.
    :param num_samples: (unsigned int) The number of bootstrap trials you want to do. Default is 10,000
    :param f: (func: np.ndarray -> double) A function that computes the quantity you want uncertainty for. Will do
              the mean by default if nothing is specified. Should take in an array like the data array as input.
    :return: (np.ndarray) An array of floating point numnbers, 1 for each boostrapped sample.
    """
    cdef unsigned data_points = data.shape[0]
    cdef np.ndarray[np.double_t, ndim=1] values = np.zeros(num_samples)
    cdef unsigned trial = 0
    cdef unsigned point_number = 0
    cdef np.ndarray simulated_data = data_points.copy()


    for trial in range(num_samples):
        for point_number in range(data_points):
            simulated_data[point_number,:] = data[cyrandom.genrand64()%data_points, :]
        values[trial] = f(simulated_data)

    return values

