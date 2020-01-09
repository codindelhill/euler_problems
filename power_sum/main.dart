/* Well at least it works*/
main() {
  //Store all powers of 2 in lists where each element is digit.
  List<List<int>> powers = new List();
  List<int> firstPower = new List<int>.filled(1000, 0);
  firstPower[firstPower.length - 1] = 1;
  powers.add(firstPower); // 2^0 = 1

  //Construct all powers from 0 to limit
  for (int i = 0; i < 1000; i++) {
    List<int> power = new List<int>.filled(1000, 0);
    for (int j = powers[i].length - 1; j >= 0; j--) {
      //Multiply previous digit with 2
      int newDigit = powers[i][j] * 2;

      //Add mod10 remainder to current digit
      power[j] += newDigit % 10;

      //If greater than 9 carry 1 to next digit
      if (newDigit > 9) {
        power[j - 1]++;
      }
    }
    powers.add(power);
  }

  int sum = 0;
  for (int i = 0; i < powers.last.length; i++) {
    sum += powers.last[i];
  }
  print(sum);
}
