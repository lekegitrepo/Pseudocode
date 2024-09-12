
def calculate_gcd(a, b)
  return a if b == 0

  return calculate_gcd(b, a % b)
end
