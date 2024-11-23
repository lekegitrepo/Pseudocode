
def calculate_gcd(a, b)
  return a if b == 0
  
  calculate_gcd(b, a % b)
end

p calculate_gcd(24, 18)
