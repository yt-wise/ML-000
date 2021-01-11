# distutils: language=c++
import numpy as np
cimport numpy as cnp
import cython

@cython.boundscheck(False)
@cython.wraparound(False)
cpdef cnp.ndarray[double] target_mean_v4_c(cnp.ndarray[long, ndim=2, mode="c"] data):
    cdef long index_num = data.shape[0]
    cdef cnp.ndarray[double] sum_dict = np.zeros(index_num)
    cdef cnp.ndarray[double] count_dict = np.zeros(index_num)
    cdef cnp.ndarray[double] result = np.zeros(index_num)
    for i in range(index_num):
        sum_dict[data[i, 1]] += data[i, 0]
        count_dict[data[i, 1]] += 1
    for i in range(index_num):
        result[i] = (sum_dict[data[i, 1]]-data[i, 0])/(count_dict[data[i, 1]]-1)
    return result