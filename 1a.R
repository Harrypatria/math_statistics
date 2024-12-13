# Given probabilities and information
P_L = 0.40  # Prob. of choosing London: P(L)
P_P = 0.30  # Prob. of choosing Paris: P(P)
P_B = 0.30  # Prob. of choosing Brussels: P(B)

P_LS_given_P = 0.35  # Prob. of leisure given Paris: P(LS|P)
P_LS_given_L = 0.45  # Prob. of leisure given London: P(LS|L)
P_BS_given_B = 0.75  # Prob. of business given Brussels: P(BS|B)

# Solution (a)
# Probability of leisure: P(LS)
# Using Law of Total Probability
P_LS = P_LS_given_P * P_P + P_LS_given_L * P_L + (1 - P_BS_given_B) * P_B
cat("Solution (a): P(Leisure) =", round(P_LS, 4), "\n")

# Solution (b)
# Probability of business: P(BS)
P_BS = 1 - P_LS

# Probability of Paris given business: P(P|BS)
# Using Bayes' Theorem
P_BS_given_P = 1 - P_LS_given_P  # P(BS|P)
P_P_given_BS = (P_BS_given_P * P_P) / P_BS

# Probability of London given business: P(L|BS)
# Using Bayes' Theorem
P_BS_given_L = 1 - P_LS_given_L  # P(BS|L)
P_L_given_BS = (P_BS_given_L * P_L) / P_BS

cat("Solution (b): P(Paris|Business) =", round(P_P_given_BS, 4), "\n")
cat("             P(London|Business) =", round(P_L_given_BS, 4), "\n")
