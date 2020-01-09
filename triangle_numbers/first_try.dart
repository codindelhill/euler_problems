/*
Goal is to find the first triangle number with over 500 divisors.

The n:th triangle number is found using formula n(n+1)/2,
or using a loop with variable i adding i to sum each increment.

Number of divisors can be found through factorization.
if n can be factored into 2^x*3^y then the number of divisors
is given by (x+1)(y+1). Similar pattern occurs if more than 
two primes occur in factorization. Thusly given a list of
primes test which primes divide the triangle number n starting
with the smallest and then increase counting the number of
times each prime divide the number.

Is there a specific upper bound? Not that I can think of
we therefore use a loop.
*/

main() {
  //Start with first triangle number 1
  int triNum = 1;
  int nextRow = 2;
  List<bool> primes = [
    false,
    false,
    true,
    true,
    false,
    true,
    false,
    true,
    false,
    false,
    false
  ]; //List contains primeNumber status for numbers 0, 1, 2.

  mainLoop:
  while (true) {
    //Add next row to triNum and update length of nextRow
    triNum += nextRow++;

    //Find all primes<sqrt(triNum)
    primes = getPrimes(triNum);

    //Factorize triNum
    int factoredNum = triNum;

    List<int> factorCount = new List<int>.filled(triNum, 0); //Keep track of number of factors
    int primeNum = 2; //Start factorization with prime 2

    //If factoredNum is prime or 1 factorization is complete.
    print("Factorizing number $triNum");
    while (!(factoredNum == 1 || primes[factoredNum])) {
      if (factoredNum % primeNum == 0) {
        print("Found factor $primeNum in $factoredNum");
        factoredNum ~/= primeNum;
        print("New factoredNum is $factoredNum");
        factorCount[primeNum]++;
      } else {
        for (int i = primeNum + 1; i < primes.length; i++) {
          if (primes[i]) {
            primeNum = i;
            break;
          }
        }
      }
    }

    //Count number of factors in factorization
    List<int> factors = new List();
    for (int i=0; i<factorCount.length; i++) {
      if (factorCount[i]>0) {
        factors.add(factorCount[i]);
      }
    }

    //Perform calculation for number of divisors
    int divisorsAmount = 1;
    for (int i=0; i<factors.length; i++) {
      if (factors[i]>0) {
        divisorsAmount*=factors[i]+1;
      }
    }

    //If number of divisors exceeds 500 finished.
    if (divisorsAmount>500) {
      print(triNum);
      break mainLoop;
    } else {
      print("Found $divisorsAmount divisors for triangular number $triNum");
    }
  }
}

/* 
Returns a list of primes from 0 to max reusing values from
previous list. Uses sieves method for finding primes.
*/
List<bool> getPrimes(int max) {
  List<bool> primes = new List<bool>.filled(max+1, true);
  primes[0] = false;
  primes[1] = false;
  for (int i = 0; i <= max; i++) {
    if (primes[i] == true) {
      for (int j = i + i; j < max; j += i) {
        primes[j] = false;
      }
    }
  }
  return primes;
}
