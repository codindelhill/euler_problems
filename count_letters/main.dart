/*
  Goal is to count all letters if writing out
  all numbers from 1 to 1000. Need list of words
  to construct numbers from.
*/
var numberWords = new Map();
String and = "And";
String hundred = "Hundred";
String thousand = "Thousand";
main() {
  // All words needed for counting from 1 to 1000

  numberWords[1] = "One";
  numberWords[2] = "Two";
  numberWords[3] = "Three";
  numberWords[4] = "Four";
  numberWords[5] = "Five";
  numberWords[6] = "Six";
  numberWords[7] = "Seven";
  numberWords[8] = "Eight";
  numberWords[9] = "Nine";
  numberWords[10] = "Ten";
  numberWords[11] = "Eleven";
  numberWords[12] = "Twelve";
  numberWords[13] = "Thirteen";
  numberWords[14] = "Fourteen";
  numberWords[15] = "Fifteen";
  numberWords[16] = "Sixteen";
  numberWords[17] = "Seventeen";
  numberWords[18] = "Eighteen";
  numberWords[19] = "Nineteen";
  numberWords[20] = "Twenty";
  numberWords[30] = "Thirty";
  numberWords[40] = "Forty";
  numberWords[50] = "Fifty";
  numberWords[60] = "Sixty";
  numberWords[70] = "Seventy";
  numberWords[80] = "Eighty";
  numberWords[90] = "Ninety";

  int sum = 0;
  for (int i = 1; i <= 1000; i++) {
    String numberString = "";
    numberString = numberToWords(i);
    print(numberString);
    String newString = numberString.replaceAll(" ", "");
    print(newString);
    sum += newString.length;
  }
  print(sum);
}

String numberToWords(int a) {
  String numberString = "";

  if (a < 20) {
    numberString = numberWords[a];
  } else if (a % 100 == 0 && a<1000) {
    numberString += numberWords[a / 100] + " " + hundred;
  } else if (a % 10 == 0 && a<100) {
    numberString += numberWords[a];
  } else if (a < 100) {
    numberString += numberWords[a - (a % 10)] + " " + numberWords[a % 10];
  } else if (a < 1000) {
    numberString += numberWords[(a-a%100)~/100] +
        " " +
        hundred +
        " " +
        and +
        " " +
        numberToWords(a % 100);
  } else {
    numberString = numberWords[1] + " " + thousand;
  }
  return numberString;
}
