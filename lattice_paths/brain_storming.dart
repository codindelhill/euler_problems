/*
  Goal is to count number of paths in lattice
  legal moves is right and down starting from
  upper left corner ending in lower right 
  corner.

  One way to efficiently get number of paths
  is to think of it in terms of each diagonal
  being one column. Starting from upper right
  corner first column is size 1, second 2 and
  so on.

  Let's start with naïve solution.
  Every element a(i,j) must be followed
  one of the elements a(i+1,j) or a(i, j+1)
  where 0<=i, j<=20. All paths start at
  a(0,0) and ends at a(20,20).

  Another solution is using recursion. Lets
  go with that instead. In each step go right
  and down. When the end is reached return one.
  In start add all returned ones.
  This implementation doesn't require the
  construction of a matrix which is nice.
  We simply keep track of i and j using 
  variables. When both i and j reach 20 we are
  done. If only one of i and j are 20 move in
  legal direction.

  Optimal solution involves counting number of
  paths from each node to the final node by
  starting at the final node and moving
  backwards. In each step the number of paths
  to each node is the sum of the paths from
  each following two nodes. Quite obvious 
  really... One interesting thing is we 
  get the binomial sequence. Each lattice
  size has number of paths equal to a
  corresponding even binomial sequence
  which contains odd number of terms.
*/

main() {
  // Number of paths is found using recursion
  int size = 17;
  int numberOfPaths = findPaths(size);
  print(numberOfPaths);
}

/* Finds the number of paths in latice with
dimension size*size using recursion.

Can only go right and down.
*/
int findPaths(int size) {
  int numberOfPaths = 0;
  numberOfPaths = recursionStep(0,0,size);
  return numberOfPaths;
}

int recursionStep(int i, int j, int goal) {
  int sum = 0;
  if (i<goal) {
    sum += recursionStep(i+1,j,goal);
  }
  if (j<goal) {
    sum += recursionStep(i,j+1,goal);
  }
  if (i==goal && j==goal) {
    return 1;
  }
  return sum;
}