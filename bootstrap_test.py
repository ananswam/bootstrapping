from bootstrapping import bootstrap
import numpy as np
import matplotlib.pyplot as plt


# generate 10,000 standard normal variables
sample = np.random.randn(10000)

# Run the bootstrap algorithm. Do 50,000 random resamplings and then calculate
# the standard deviation for each one.
bootstrap_values = bootstrap(sample, num_samples=50000, f=np.std)


# Plot the histogram of bootstrapped standard deviations.
# This should give an idea of the distribution of the sample standard deviation
# which should be around 1
plt.hist(bootstrap_values, bins=100)
plt.xlabel('Standard Deviation')
plt.ylabel('Number of bootstrap samples')
plt.show()
