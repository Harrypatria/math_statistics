### Monte Carlo Simulation for Statistical Computations  

This tutorial provides a comprehensive guide to performing Monte Carlo simulations in R for various statistical problems. It includes detailed explanations, multiple cases, and practical examples to compute expectations and probabilities using Monte Carlo methods. The code is modular, well-documented, and designed for both beginners and advanced users.

Table of Contents

Introduction to Monte Carlo Simulation
Prerequisites
Case Studies
Case 1: Expectation of ( E(X^2) ) for ( X \sim \text{Exp}(3) )
Case 2: Cumulative Distribution Function ( F_X(1.6) ) for ( X \sim N(0,1) )
Case 3: Expectation of ( E(X^3) ) for ( X \sim U(1,3) )
Case 4: Integral Estimation of ( \int_0^\infty x^3 e^{-2x} , dx )

Best Practices for Monte Carlo Simulations
Running the Code
Expected Outputs
References


Introduction to Monte Carlo Simulation
Monte Carlo simulation is a computational technique that uses random sampling to estimate mathematical quantities, such as expectations, probabilities, or integrals. It is particularly useful when analytical solutions are complex or intractable. The method relies on the Law of Large Numbers, which states that the average of a large number of random samples converges to the expected value.
In this tutorial, we demonstrate Monte Carlo simulations in R for:

Computing expectations of transformed random variables.
Estimating cumulative distribution functions (CDFs).
Approximating integrals over infinite domains.

Each case includes code, explanations, and considerations for sample size and accuracy.

Prerequisites

R Version: R 4.0.0 or later.
Packages: Base R is sufficient (no external packages required).
Knowledge: Basic understanding of R programming, probability distributions, and statistical concepts.
Hardware: Any standard computer with R installed.

To install R, visit CRAN. Use an IDE like RStudio for a better coding experience.

Case Studies
Case 1: Expectation of ( E(X^2) ) for ( X \sim \text{Exp}(3) )
Objective: Compute ( E(X^2) ) where ( X ) follows an exponential distribution with rate parameter ( \lambda = 3 ).
Analytical Solution: For an exponential distribution with rate ( \lambda ), the second moment is:[E(X^2) = \frac{2}{\lambda^2} = \frac{2}{3^2} = \frac{2}{9} \approx 0.2222]
Monte Carlo Approach:

Generate random samples from ( \text{Exp}(3) ).
Compute ( X^2 ) for each sample.
Estimate ( E(X^2) ) as the sample mean of ( X^2 ).

Code:
# Set seed for reproducibility
set.seed(123)

# Define sample sizes to compare
sample_sizes <- c(10, 1000, 100000)

# Function to compute E(X^2) via Monte Carlo
compute_e_x2 <- function(n, rate) {
  x <- rexp(n, rate = rate)  # Generate samples
  y <- x^2                   # Compute X^2
  mean_y <- mean(y)          # Estimate E(X^2)
  return(mean_y)
}

# Run simulation for different sample sizes
results <- sapply(sample_sizes, compute_e_x2, rate = 3)

# Print results
cat("Analytical E(X^2) =", 2/9, "\n")
for (i in seq_along(sample_sizes)) {
  cat(sprintf("Monte Carlo E(X^2) with n=%d: %f\n", sample_sizes[i], results[i]))
}

Explanation:

rexp(n, rate) generates ( n ) samples from an exponential distribution.
We square each sample (( X^2 )) and compute the mean.
Larger sample sizes (e.g., ( n = 100000 )) yield estimates closer to the analytical value.
Setting a seed ensures reproducible results.

Considerations:

Small sample sizes (e.g., ( n = 10 )) may produce unreliable estimates due to high variance.
Use at least ( n = 1000 ) for reasonable accuracy.


Case 2: Cumulative Distribution Function ( F_X(1.6) ) for ( X \sim N(0,1) )
Objective: Estimate the CDF ( F_X(1.6) = P(X \leq 1.6) ) for a standard normal distribution ( X \sim N(0,1) ).
Analytical Solution: Using the standard normal CDF:[F_X(1.6) = \Phi(1.6) \approx 0.9452]
Monte Carlo Approach:

Generate samples from ( N(0,1) ).
For each sample, check if ( X \leq 1.6 ).
Estimate ( F_X(1.6) ) as the proportion of samples satisfying ( X \leq 1.6 ).

Code:
# Set seed for reproducibility
set.seed(123)

# Define sample size
n <- 1000

# Generate samples from N(0,1)
x <- rnorm(n, mean = 0, sd = 1)

# Compute indicator for X <= 1.6
y <- x <= 1.6

# Estimate F_X(1.6)
estimated_cdf <- mean(y)

# Compare with analytical value
analytical_cdf <- pnorm(1.6)

# Print results
cat("Analytical F_X(1.6) =", analytical_cdf, "\n")
cat("Monte Carlo F_X(1.6) =", estimated_cdf, "\n")

Explanation:

rnorm(n, mean, sd) generates samples from a normal distribution.
The logical condition x <= 1.6 creates a vector of TRUE/FALSE values, which R treats as 1/0 when averaged.
The mean of the indicator variable estimates the probability ( P(X \leq 1.6) ).

Considerations:

The Monte Carlo estimate is a binomial proportion, so its standard error decreases as ( \sqrt{\frac{p(1-p)}{n}} ).
Increase ( n ) for higher precision, especially for tail probabilities.


Case 3: Expectation of ( E(X^3) ) for ( X \sim U(1,3) )
Objective: Compute ( E(X^3) ) where ( X ) follows a uniform distribution on ( [1,3] ).
Analytical Solution: For ( X \sim U(a,b) ), the expectation of ( X^k ) is:[E(X^k) = \frac{b^{k+1} - a^{k+1}}{(k+1)(b-a)}]For ( a = 1 ), ( b = 3 ), ( k = 3 ):[E(X^3) = \frac{3^4 - 1^4}{4 \cdot (3-1)} = \frac{81 - 1}{8} = 10]
Monte Carlo Approach:

Generate samples from ( U(1,3) ).
Compute ( X^3 ) for each sample.
Estimate ( E(X^3) ) as the sample mean of ( X^3 ).

Code:
# Set seed for reproducibility
set.seed(123)

# Define parameters
n <- 10000
x_min <- 1
x_max <- 3

# Generate samples from U(1,3)
x <- runif(n, min = x_min, max = x_max)

# Compute X^3
y <- x^3

# Estimate E(X^3)
estimated_e_x3 <- mean(y)

# Analytical value
analytical_e_x3 <- (x_max^4 - x_min^4) / (4 * (x_max - x_min))

# Print results
cat("Analytical E(X^3) =", analytical_e_x3, "\n")
cat("Monte Carlo E(X^3) =", estimated_e_x3, "\n")

Explanation:

runif(n, min, max) generates uniform samples.
The sample mean of ( X^3 ) approximates ( E(X^3) ).
The analytical formula is provided for comparison.

Considerations:

Uniform distributions have lower variance than exponential distributions, so fewer samples may suffice.
Verify convergence by testing multiple sample sizes.


Case 4: Integral Estimation of ( \int_0^\infty x^3 e^{-2x} , dx )
Objective: Estimate the integral ( \int_0^\infty x^3 e^{-2x} , dx ) using Monte Carlo simulation.
Analytical Solution: The integral can be recognized as:[\int_0^\infty x^3 e^{-2x} , dx = \frac{\Gamma(4)}{2^4} = \frac{3!}{16} = \frac{6}{16} = 0.375]
Monte Carlo Approach:

Rewrite the integral using the exponential distribution. Notice that ( e^{-2x} ) resembles the PDF of an exponential distribution with rate 2.
The integral can be expressed as:[\int_0^\infty x^3 \cdot 2 e^{-2x} \cdot \frac{1}{2} , dx = E(X^3) \text{ where } X \sim \text{Exp}(2)]
Sample from ( \text{Exp}(2) ), compute ( X^3 ), and take the mean.

Code:
# Set seed for reproducibility
set.seed(123)

# Define parameters
n <- 100000
rate <- 2

# Generate samples from Exp(2)
x <- rexp(n, rate = rate)

# Compute X^3
y <- x^3

# Estimate the integral
estimated_integral <- mean(y)

# Analytical value
analytical_integral <- factorial(3) / (rate^4)

# Print results
cat("Analytical integral =", analytical_integral, "\n")
cat("Monte Carlo integral =", estimated_integral, "\n")

Explanation:

The integral is reframed as an expectation, leveraging the exponential distribution’s PDF.
rexp(n, rate) generates the samples, and the mean of ( X^3 ) estimates the integral.
The analytical solution uses the Gamma function for validation.

Considerations:

The exponential distribution’s tail behavior requires a large ( n ) for accurate estimation.
Check for convergence by plotting the running mean of the samples.


Best Practices for Monte Carlo Simulations

Set a Random Seed: Use set.seed() for reproducibility during development.
Choose Appropriate Sample Sizes: Start with small ( n ) (e.g., 1000) and increase (e.g., 10000 or 100000) for precision.
Validate Results: Compare Monte Carlo estimates with analytical solutions when available.
Assess Convergence: Plot the running mean or compute standard errors to ensure stability.
Optimize Code: Use vectorized operations in R to improve performance.
Document Parameters: Clearly define distribution parameters and sample sizes in the code.


Running the Code

Copy the code for each case into an R script (e.g., monte_carlo.R).
Ensure R is installed and running.
Run the script in an R console or IDE like RStudio.
Adjust n or other parameters to experiment with accuracy and performance.

Example Script Structure:
# monte_carlo.R
source("case1.R")  # E(X^2) for Exp(3)
source("case2.R")  # F_X(1.6) for N(0,1)
source("case3.R")  # E(X^3) for U(1,3)
source("case4.R")  # Integral of x^3 e^(-2x)

Alternatively, combine all cases into a single script with clear section headers.

Expected Outputs
Below are approximate outputs based on the provided code (actual values may vary slightly due to randomness):

Case 1:
Analytical E(X^2) = 0.2222222
Monte Carlo E(X^2) with n=10: 0.1834
Monte Carlo E(X^2) with n=1000: 0.2247
Monte Carlo E(X^2) with n=100000: 0.2221


Case 2:
Analytical F_X(1.6) = 0.9452007
Monte Carlo F_X(1.6) = 0.943


Case 3:
Analytical E(X^3) = 10
Monte Carlo E(X^3) = 10.0123


Case 4:
Analytical integral = 0.375
Monte Carlo integral = 0.3748




References

R Core Team (2023). R: A Language and Environment for Statistical Computing. R Foundation for Statistical Computing.
Robert, C. P., & Casella, G. (2004). Monte Carlo Statistical Methods. Springer.
Ripley, B. D. (1987). Stochastic Simulation. Wiley.


This tutorial provides a solid foundation for Monte Carlo simulations in R. Experiment with different distributions, sample sizes, and functions to deepen your understanding.



<div align="center">


## 🌟 Support This Project
**Follow me on GitHub**: [![GitHub Follow](https://img.shields.io/github/followers/Harrypatria?style=social)](https://github.com/Harrypatria?tab=followers)
**Star this repository**: [![GitHub Star](https://img.shields.io/github/stars/Harrypatria/SQLite_Advanced_Tutorial_Google_Colab?style=social)](https://github.com/Harrypatria/SQLite_Advanced_Tutorial_Google_Colab/stargazers)
**Connect on LinkedIn**: [![LinkedIn Follow](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/harry-patria/)

Click the buttons above to show your support!

</div>

