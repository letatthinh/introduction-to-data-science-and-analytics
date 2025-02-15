library(microbenchmark)

microbenchmark(sqrt(2), 2^0.5)

# Copy and paste the results of running the above command below this comment,
# marking each of the pasted line as a comment.

#    expr min  lq mean median  uq   max neval
# sqrt(2)   0   0  178    100 100 12200   100
#   2^0.5 100 100  257    100 100  5600   100


# Type your answer to part (a) below these lines, marking each additional line
# as a comment.

# Based on the output, I can get a sense of the scatter from these factors:
# + Min and Max:
#   - The wide range between the min and max really impressed me, especially
#     in the sqrt() function where the max value reaches 12,200 nanoseconds.
#     This is twice the number from 2 ^ 0.5, which is 5,600. I think it is
#     because my laptop is running multiple tasks when executing the benchmark.
# + Mean and Median:
#   - The mean being higher than the median in both expressions somehow tells me
#     about the scatter in the distribution of execution times."


# Type your answer to part (b) below these lines, marking each additional line
# as a comment.

# 1. Which expression is more efficient in your opinion and why?

# Based on the output, I would choose the sqrt(2) expression. The maximum time 
# for it is quite large, however, its minimum and mean times are lower than when 
# using the 2 ^ 0.5 expression. In particular, the mean time of using the sqrt() 
# function is 1.4 times faster than the 2 ^ 0.5 expression, and the min time is
# 0, which is super fast.

# 2. Estimate the number of times a script would need to calculate a square
# root for the difference in execution times to become noticeable

# I don't know how to define 'noticeable,' but in my opinion, more evaluations 
# would lead to a more accurate mean time. Therefore, I will increase the 
# evaluation count by 10 (to 1,000 times), 100 (to 10,000 times), and 1,000 
# (to 100,000 times) and check the mean result.

microbenchmark(sqrt(2), 2^0.5, times = 1000)

 #    expr min  lq  mean median  uq  max neval
 # sqrt(2)   0   0  59.4    100 100 1100  1000
 #   2^0.5   0 100 119.6    100 100 3300  1000

microbenchmark(sqrt(2), 2^0.5, times = 10000)

#    expr min  lq   mean median  uq  max neval
# sqrt(2)   0   0  68.34    100 100 5500 10000
#   2^0.5   0 100 129.10    100 100 3300 10000

microbenchmark(sqrt(2), 2^0.5, times = 100000)

 #    expr min  lq    mean median  uq   max  neval
 # sqrt(2)   0   0  60.549    100 100  9400 100000
 #   2^0.5   0 100 122.655    100 100 35900 100000

# Observation: The result shows that sqrt(2) is approximately 2 times faster 
# than 122.655 when I increase the number of evaluations. I hope this difference 
# is noticeable.
