import 'dart:math';
/*
Find the n:th prime where n=10001

Firstly we will solve using naive solution, i.e. iterate through every number and
check if it's prime until the 10001th prime number is found.

Secondly we could improve our iteration using the sieves method.

Thirdly we could use the prime number-theorem which bounds the intervall
in which the n:th prime exists. This should be the optimal solution for
big n's
*/
main () {
  int primesFound = 0;
  int currentNumber = 1;
  int n = 10001;
  while(primesFound<=n) {
    currentNumber++;
    if(isPrime(currentNumber)) {
      primesFound++;
      print("The $primesFound:th prime number is $currentNumber,");
      print("$primesFound primes found.\n");
    }
  }
}

/*
Check if number is prime
*/
bool isPrime(int a) {
  if (a==1) {
    return false;
  } else if (a==2 || a==3) {
    return true;
  }
  // If not prime a factor will be found which is not greater than sqrt(a)
  // max will always be less than a
  int max = sqrt(a).toInt();
  for (int i=2; i<=max; i++) {
    if(a%i==0) {
      return false;
    }
  }
  return true;
}