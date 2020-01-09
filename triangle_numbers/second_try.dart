import 'dart:math';

/*
Implement quick and dirty solution, problem arise with factorization where it doesn't the number itself at the end... sort of.
*/

main() {
  int triangularNumber = 1;
  int nextRow = 2;
  int numberOfDivisors = 0;
  while (numberOfDivisors <= 500) {
    //Add next row and update next row size
    triangularNumber += nextRow++;

    //Compute number of divisors
    numberOfDivisors = getNumberOfDivisors(triangularNumber);
    print("Triangular number $triangularNumber has $numberOfDivisors divisors");
  }
}

int getNumberOfDivisors(int a) {
  int numberOfDivisors = 1;
  int newNumber = a;
  var factorCount = new Map();

  //Factorize newNumber while keeping count of number of factors
  print("Finding factors for $newNumber");
  while (!(newNumber == 1)) {
    for (int i = 2; i < sqrt(newNumber).toInt() + 1; i++) {
      if (isPrime(i)) {
        while (newNumber % i == 0) {
          if (factorCount[i] != null) {
            factorCount[i]++;
          } else {
            factorCount[i] = 1;
          }
          print("New factor count:");
          print(factorCount);
          newNumber = newNumber ~/ i;
          print("Found factor $i, newNumber is $newNumber");
        }
      }
    }
    if (isPrime(newNumber)) {
      if (factorCount[newNumber] != null) {
        factorCount[newNumber]++;
      } else {
        factorCount[newNumber] = 1;
      }
      print("New factor count:");
      print(factorCount);

      newNumber = 1;
    }
  }

  factorCount.forEach((number, value) => numberOfDivisors *= value);
  return numberOfDivisors;
}

bool isPrime(int a) {
  int max = sqrt(a).toInt() + 1;
  for (int i = 2; i < max; i++) {
    if (a % i == 0) {
      return false;
    }
  }
  return true;
}
