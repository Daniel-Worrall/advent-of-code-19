module AdventOfCode
  extend self

  def valid_password?(number)
    arr = number.to_s.split("")
    return false if arr.each_cons(2, true).any? { |pair| pair[0] > pair[1] }
    return true if arr.each_cons(2, true).any? { |pair| pair[0] == pair[1] }
    false
  end

  def skip_invalid_password(number)
    arr = number.to_s.split("").map(&.to_i)
    arr.each_cons(2, true).with_index do |pair, index|
      return ((pair[0] - pair[1]) * 10**(number.to_s.size - 2 - index)) if pair[0] > pair[1]
    end
    return (11 - arr[-1] + arr[-2]) unless arr.each_cons(2, true).any? { |pair| pair[0] == pair[1] }
    0
  end

  def number_of_valid_passwords(from, to)
    times = 0
    iterator = from.upto(to)
    until (element = iterator.next) == Iterator::Stop::INSTANCE
      skips = skip_invalid_password(element)
      (skips - 1).times { iterator.next }
      times += 1 unless skips > 0
    end
    times
  end

  def run_4_1a
    146810.upto(612564).count { |element| valid_password?(element) }
  end

  def run_4_1b
    number_of_valid_passwords(146810, 612564)
  end
end
