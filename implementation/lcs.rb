
def lcs(str1, str2)
  dp = Array.new(str1.size+1) { Array.new(str2.size+1, 0) }
  i, j = 0, 0

  compute_lcs(str1, str2, i, j, dp)
end

def compute_lcs(str1, str2, i, j, dp)
  return 0 if i >= str1.size || j >= str2.size

  return dp[i][j] if dp[i][j] > 0

  if str1[i] == str2[j]
    dp[i][j] = 1 + compute_lcs(str1, str2, i+1, j+1, dp)
  else
    dp[i][j] = [compute_lcs(str1, str2, i+1, j, dp), compute_lcs(str1, str2, i, j+1, dp)].max
  end

  dp[i][j]
end

str_two = 'ABCDAB'
str_one = 'ABCDAB'
puts lcs(str_one, str_two) # Output: 4
