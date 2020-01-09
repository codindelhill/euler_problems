/*
Goal is to find the only pythagorean tripple where the product of all sides equals 1000.
Will use method where a complex number consisting of some combination of two distinct natural
numbers u and v squared generates a pythagorean tripple with sides a = u² - v², b = 2uv, c = u² + v².

Upper bound is for the sought after number. This could be optimized further but since the number
is quite small the difference in performance is minimal.
*/
main() {
    int number = 1000;
    outerLoop: for (int u=1; u<number; u++) {
      for (int v=u+1; v<number; v++) {
        int a = v*v - u*u;
        int b = 2*u*v;
        int c = u*u + v*v;
        print("Found tripple w/ sides: a=$a, b=$b, c=$c");
        if (a+b+c==number) {
          print(a*b*c);
          break outerLoop;
        }
      }
    }
}