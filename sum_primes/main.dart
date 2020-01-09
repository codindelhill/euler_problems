/*
Goal is to find the sum of all primes below 2000000. For this we use sieves method to
create a list with only prime numbers.

How to construct this list? The index of each element can represent the number.
starting at index 2 which is prime (set it to 1?) and iterate through each index which is a multiple of
2 and set those elements to -1 up to element 2000000 + 1 which has index 2000000 + 2.
Move to the next element in list which doesn't contain the value -1, (set it to 1?) perform the same
process up to the element with index sqrt(2000000 + 2).
*/

main() {
  final sw = Stopwatch()..start();
  var primes = new List<int>.filled(2000001, 0);
  primes[0] = -1;
  primes[1] = -1;
  int sum = 2;
  for (int i=3; i<primes.length; i+=2) {
    if (primes[i]==0) {
      sum += i;
      for (int j=i*i; j<(primes.length); j+=i) {
        primes[j] = -1;
      }
    }
  }
  print("Sum of primes less than ${primes.length-1} is $sum\nExecution time ${sw.elapsed}");
}