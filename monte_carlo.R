# Let x ~ Exp(3). Compute expectation E(X^2) using Monte-Carlo simulation

x1 <- rexp(10,3)
x1

y1 <- x1^2
y1

mean(y1)

x1 <- rexp(1000,3)
y1 <- x1^2
y1

mean(y1)
# Let x ~ N(0,1). Compute Fx(1.6) using Monte-Carlo simulation

x2 <- rnorm(1000)
y2 <- ifelse(x2 <= 1.6, TRUE, FALSE)
y2

mean(y2)

#  Let x ~ U(1,3). Compute the expectation of E(X^3) using Monte-Carlo simulation

# Define the number of samples
n <- 1000

# Generate n random values from U(1, 3)
x <- runif(n, min = 1, max = 3)

# Compute X^3
y <- x^3

# Calculate the mean of X^3
mean_y <- mean(y)

# Print the result
cat("E(X^3) =", mean_y, "\n")

##################
# Define the number of samples and the range
n <- 10000
x_min <- 1
x_max <- 3

# Generate n random values from U(1, 3)
x <- runif(n, min = x_min, max = x_max)

# Compute E(X^3) using Monte Carlo simulation
expected_x3 <- mean(x^3)
expected_x3


# Print the result
cat("E(X^3) =", expected_x3, "\n")

####################
# Define the number of Monte Carlo samples
n <- 100000

# Generate random samples from an exponential distribution
x_samples <- rexp(n, rate = 2)

# Evaluate the function x^3 * e^(-2x) for each sample
y_samples <- x_samples^3 * exp(-2 * x_samples)

# Estimate the integral by calculating the mean of the samples
estimated_integral <- mean(y_samples)

# Print the result
cat("Monte Carlo estimated integral from 0 to infinity of x^3 * e^(-2x) dx is:", estimated_integral, "\n")
