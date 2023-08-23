bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }
  if (n <= 3) {
    return true;
  }
  if (n % 2 == 0 || n % 3 == 0) {
    return false;
  }
  int i = 5;
  while (i * i <= n) {
    if (n % i == 0 || n % (i + 2) == 0) {
      return false;
    }
    i += 6;
  }
  return true;
}

List<int> findPrimes(int limit) {
  List<int> primes = [];
  for (int num = 2; num <= limit; num++) {
    if (isPrime(num)) {
      primes.add(num);
    }
  }
  return primes;
}

void main() {
  int limit = 50; // Ganti dengan batas atas yang diinginkan
  List<int> primeNumbers = findPrimes(limit);
  print("Bilangan prima antara 2 dan $limit adalah: $primeNumbers");
}
