# frozen_string_literal: true

# Integer class to count values of given number
class Integer
  def num_digits
    Math.log10(self).to_i + 1
  end
end
