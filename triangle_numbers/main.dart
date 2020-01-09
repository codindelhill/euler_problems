import 'dart:math';
/*
Goal is to find first triangular number with more than
500 divisors.

First find triangular number whichi is trivial

Second find number of divisors of that number

Third check if it exceeds 500 in which case
exit.
*/

List<int> primes;

main() {
  int numberOfDivisors = 0;
  int triangularNumber = 1;
  int nextRow = 2;
  int primesLimit = 65500;
  primes = getPrimes(primesLimit); //fetch list of prime numbers

  //Loop executes while number of divisors doesn't exceed 500
  while (!(numberOfDivisors > 500)) {
    //Fetch next triangular number
    triangularNumber += nextRow++;

    //If largest prime is smaller than sqrt(triangularNumber) rebuild list with bigger primes
    if (primes.last < sqrt(triangularNumber).toInt() + 1) {
      primes = getPrimes(10 * triangularNumber);
    }

    //Find number of divisors
    numberOfDivisors = getNumberOfDivisors(triangularNumber);
  }
  //Print out final triangular number
  print("Triangular number $triangularNumber has $numberOfDivisors divisors");
}

/*
Number of divisors is found by iterating over all prime numbers starting with
2 up to sqrt(a). When factor is found divide a with that factor and start again.
If no factor is found then a must be prime in which case it is the final factor.
*/
int getNumberOfDivisors(int a) {
  int _a = a;
  var factorCount = new Map();

  //When _a=1 factorization is complete
  while (_a > 1) {
    //If _a is a prime number then factorization
    //is complete and _a is itself a divisor
    if (primes.contains(_a)) {
      if (factorCount[_a] == null) {
        factorCount[_a] = 1;
      } else {
        factorCount[_a]++;
      }
      _a = 1;
    } else {
      //Iterate through list of primes to identify factors
      primes.forEach((prime) {
        if (_a % prime == 0) {
          // Divide _a with found factor prime
          _a = _a ~/ prime;
          if (factorCount[prime] == null) {
            factorCount[prime] = 1;
          } else {
            factorCount[prime]++;
          }
        }
      });
    }
  }

  //Compute number of divisors based on number of factors
  int numberOfDivisors = 1;
  factorCount.forEach((k, v) => numberOfDivisors *= v + 1);

  return numberOfDivisors;
}

/*
See if a is prime number using brute force.
Only used for numbers larger than 5000000.
*/
bool isPrime(int a) {
  if (a == 1 || a == 0) {
    return false;
  } else if (a == 2) {
    return true;
  }

  //Skips all even numbers
  for (int i = 3; i < sqrt(a).toInt() + 1; i += 2) {
    if (a % i == 0) {
      return false;
    }
  }
  return true;
}

/*
Get list of primes from 2 to max using sieve method
*/
List<int> getPrimes(int max) {
  List<int> primes = new List();
  List<bool> primeStatus = new List<bool>.filled(max, true);
  for (int i = 2; i < max; i++) {
    if (primeStatus[i]) {
      primes.add(i);
      for (int j = i + i; j < max; j += i) {
        primeStatus[j] = false;
      }
    }
  }
  return primes;
}
