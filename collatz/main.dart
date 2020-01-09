main() {
  int max = 1000000;
  int longestChain = 0;
  int longestChainTrigger = 0;
  for (int i=1; i<=max; i++) {
    var sequence = collatzSequence(i);
    if (sequence.length>longestChain) {
      longestChain=sequence.length;
      longestChainTrigger = i;
    }
  }
  print("$longestChainTrigger produces sequence with $longestChain steps");
}

List<int> collatzSequence(int a) {
  List<int> sequence = new List();
  sequence.add(a);
  int nextValue = a;
  while(nextValue!=1) {
    if (nextValue%2==0) {
      nextValue ~/= 2;
    } else {
      nextValue = nextValue*3+1;
    }
    sequence.add(nextValue);
  }

  return sequence;
}