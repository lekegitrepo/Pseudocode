
def recursive_fibonacci_memoization(n, memo = {})
  return n if n <= 1

  memo[n] = recursive_fibonacci_memoization(n - 1, memo) + recursive_fibonacci_memoization(n - 2, memo)

  return memo[n]
end

recursive_fibonacci_memoization(5)
