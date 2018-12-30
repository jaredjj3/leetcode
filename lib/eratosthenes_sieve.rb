require "minitest/autorun"
require "byebug"

# PROMPT
=begin
Generate n primes
=end

require "prime"

def eratosthenes_sieve(n)
  return [] if n < 2

  primes = [*0..n]
  primes[0] = nil
  primes[1] = nil
  sqrt_n = Math.sqrt(n)
  prime = 2
  while prime <= sqrt_n
    jj = prime**2
    while jj <= n
      primes[jj] = nil
      jj += prime
    end
    prime += 1
  end

  primes.reject(&:nil?)
end

describe "#eratosthenes_sieve" do
  it "returns empty arrays for n < 2" do
    assert_equal([], eratosthenes_sieve(1))
    assert_equal([], eratosthenes_sieve(0))
    assert_equal([], eratosthenes_sieve(-1))
  end

  it "correctly generates the first n primes" do
    200.times do
      n = rand(2..100)
      assert_equal(Prime.take_while { |prime| prime <= n }, eratosthenes_sieve(n))
    end
  end
end
