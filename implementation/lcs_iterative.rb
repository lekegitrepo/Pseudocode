
def lcs(str1, str2)
  dp = Array.new(str1.size+1) { Array.new(str2.size+1, 0) }

  (1..str1.size).each do |i|
    (1..str2.size).each do |j|
      if str1[i - 1] == str2[j - 1]
        dp[i][j] = dp[i - 1][j - 1] + 1
      else
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
      end
    end
  end
  
  dp[str1.size][str2.size]
end

str_two = 'ABCDAB'
str_one = 'ABCDAB'
puts lcs(str_one, str_two)
