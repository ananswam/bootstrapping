# cython: boundscheck=False
# cython: cdivision=True
# cython: wraparound=False

import numpy as np
cimport numpy as np

cimport random as cyrandom

def bootstrap(np.ndarray input_data, int num_samples=10000, f=np.mean):
    """

    :param data: (np.ndarray) An array with 2 dimensions where the first dimension indexes each data point
                 to resample. 
    :param num_samples: (unsigned int) The number of bootstrap trials you want to do. Default is 10,000
    :param f: (func: np.ndarray -> double) A function that computes the quantity you want uncertainty for. Will do
              the mean by default if nothing is specified. Should take in an array like the data array as input.
    :return: (np.ndarray) An array of floating point numnbers, 1 for each boostrapped sample.
    """

    cdef np.ndarray[np.double_t,ndim=2]  data
    if input_data.ndim == 1:
        data = input_data.reshape((input_data.shape[0],1))
    else:
        data = input_data

    cdef int num_data_points = data.shape[0]
    cdef int num_dim = data.shape[1]
    cdef np.ndarray[np.double_t, ndim=1] values = np.zeros(num_samples)
    cdef int trial = 0
    cdef int point_number = 0
    cdef int dim = 0
    cdef int sample_index = 0
    cdef np.ndarray[np.double_t,ndim=2] simulated_data = np.empty((num_data_points,num_dim))


    for trial in range(num_samples):
        for point_number in range(num_data_points):
            sample_index = cyrandom.choose(num_data_points)
            for dim in range(num_dim):
                simulated_data[point_number,dim] = data[sample_index, dim]
            
        values[trial] = f(simulated_data)

    return values

