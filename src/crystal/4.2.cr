module AdventOfCode
  extend self

  def valid_password_two?(number)
    arr = number.to_s.split("")
    return false if arr.each_cons(2, true).any? { |pair| pair[0] > pair[1] }
    return true if arr.tally.key_for?(2)
    false
  end

  def run_4_2
    146810.upto(612564).count { |element| valid_password_two?(element) }
  end
end
