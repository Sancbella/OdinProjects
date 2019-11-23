def fibs (n)
  return [0] if n == 0
  return [1] if n == 1
  result = [1, 1]
  n -= 2
  until n == 0
    result << result[-1] + result[-2]
    n -= 1
  end
  result
end

def fibs_req (n, result = [1, 1])
  return [0] if n == 0
  return [1] if n == 1
  if n > 2
    result << result[-1] + result[-2]
    result = fibs_req(n-1, result)
  end
  result
end

puts fibs(30)
puts fibs_req(30)