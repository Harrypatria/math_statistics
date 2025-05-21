# Monte Carlo Simulation in R

## Overview
This repository contains R code and a detailed tutorial for performing Monte Carlo simulations to estimate expectations, probabilities, and integrals. The tutorial covers four case studies, each demonstrating a different application of Monte Carlo methods with clear explanations and analytical validations.

## Repository Structure
- `monte_carlo_tutorial.md`: Comprehensive tutorial with code, explanations, and best practices.
- `case1.R`: Code for computing $E(X^2)$ for $X \sim \text{Exp}(3)$.
- `case2.R`: Code for estimating $F_X(1.6)$ for $X \sim N(0,1)$.
- `case3.R`: Code for computing $E(X^3)$ for $X \sim U(1,3)$.
- `case4.R`: Code for estimating the integral $\int_0^\infty x^3 e^{-2x} \, dx$.
- `README.md`: This file.

## Prerequisites
- **R**: Version 4.0.0 or later ([CRAN](https://cran.r-project.org/)).
- **IDE**: RStudio recommended ([RStudio](https://www.rstudio.com/)).
- **Dependencies**: Base R (no external packages required).

## Installation
1. Install R from [CRAN](https://cran.r-project.org/).
2. Optionally, install RStudio from [RStudio](https://www.rstudio.com/).
3. Clone or download this repository:
   ```bash
   git clone https://github.com/your-repo/monte-carlo-r.git
   ```
   Alternatively, download the ZIP file and extract it.

## Usage
1. Open R or RStudio.
2. Set the working directory to the repository folder:
   ```R
   setwd("path/to/monte-carlo-r")
   ```
3. Run individual case scripts:
   ```R
   source("case1.R")  # E(X^2) for Exp(3)
   source("case2.R")  # F_X(1.6) for N(0,1)
   source("case3.R")  # E(X^3) for U(1,3)
   source("case4.R")  # Integral of x^3 e^(-2x)
   ```
4. Refer to `monte_carlo_tutorial.md` for detailed explanations and expected outputs.

**Note on Equations**: Mathematical equations in this README and the tutorial use LaTeX syntax (e.g., `$E(X^2)$` or `$$\int_0^\infty x^3 e^{-2x} \, dx$$`). These render correctly on platforms like GitHub or Markdown viewers with LaTeX support (e.g., VS Code with Markdown+Math extension). If equations do not display properly, ensure your viewer supports LaTeX.

## Case Studies
1. **Case 1**: Compute $E(X^2)$ for an exponential distribution ($X \sim \text{Exp}(3)$).
2. **Case 2**: Estimate the CDF $F_X(1.6)$ for a standard normal distribution ($X \sim N(0,1)$).
3. **Case 3**: Compute $E(X^3)$ for a uniform distribution ($X \sim U(1,3)$).
4. **Case 4**: Estimate the integral:
   \[
   \int_0^\infty x^3 e^{-2x} \, dx
   \]

## Expected Outputs
Refer to `monte_carlo_tutorial.md` for detailed expected outputs. Results may vary slightly due to randomness but should converge to analytical values with large sample sizes. Example outputs include:
- Case 1: $E(X^2) \approx 0.2222$ (analytical: $\frac{2}{9}$).
- Case 2: $F_X(1.6) \approx 0.9452$.
- Case 3: $E(X^3) \approx 10$.
- Case 4: Integral $\approx 0.375$.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue for suggestions, bug reports, or additional case studies.

---

<div align="center">
*Remember: Every expert was once a beginner. Your programming journey is unique, and we're here to support you every step of the way.*

## 🌟 Support This Project
**Follow me on GitHub**: [![GitHub Follow](https://img.shields.io/github/followers/Harrypatria?style=social)](https://github.com/Harrypatria?tab=followers)
**Star this repository**: [![GitHub Star](https://img.shields.io/github/stars/Harrypatria/Basic-to-Advanced-Tutorial-of-Network-Analytics-with-NetworkX?style=social)](https://github.com/Harrypatria/Basic-to-Advanced-Tutorial-of-Network-Analytics-with-NetworkX/stargazers)
**Connect on LinkedIn**: [![LinkedIn Follow](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/harry-patria/)

Click the buttons above to show your support!

</div>
