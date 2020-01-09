/* The best solution uses combinatorics
to find answer in O(n) time using O(1) space.
*/

main() {
  int latticeSize = 15;
  print(bin(2*latticeSize, latticeSize));
}

/*
  bin(n,k) = n!/(k!(n-k)!)
  This can be solved recursively with
  basecase bin(n,0) = 1.
*/
double bin(int n, int k) {
  if (k == 0 || k==n) {
    return 1.0;
  } else {
    return bin(n-1, k-1) + bin(n-1, k);
  }
}