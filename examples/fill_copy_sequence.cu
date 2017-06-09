#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/copy.h>
#include <thrust/fill.h>
#include <thrust/sequence.h>

#include <iostream>

int main(void)
{
    // initialize all ten integers of a device_vector to 1
    std::cout << "1" << std::endl;
    thrust::device_vector<int> D(10, 1);

    // set the first seven elements of a vector to 9
    std::cout << "2" << std::endl;
    thrust::fill(D.begin(), D.begin() + 7, 9);

    // initialize a host_vector with the first five elements of D
    std::cout << "3" << std::endl;
    thrust::host_vector<int> H(D.begin(), D.begin() + 5);

    // set the elements of H to 0, 1, 2, 3, ...
    std::cout << "4" << std::endl;
    thrust::sequence(H.begin(), H.end());

    // copy all of H back to the beginning of D
    std::cout << "5" << std::endl;
    thrust::copy(H.begin(), H.end(), D.begin());

    // print D
    std::cout << "6" << std::endl;
    for(size_t i = 0; i < D.size(); i++)
        std::cout << "D[" << i << "] = " << D[i] << std::endl;
    std::cout << "7" << std::endl;

    return 0;
}
