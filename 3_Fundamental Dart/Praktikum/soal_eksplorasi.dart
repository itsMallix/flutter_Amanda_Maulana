/* SOAL EKSPLORASI 
  1. Buatlah sebuah program untuk mengecek apakah sebuah kata merupakan sebuah palindrom atau bukan.
  Palindrom adalah sebuah kata yang jika dibalik dari kata aslinya memiliki cara baca atau susunan yang sama persis
  2. Buatlah sebuah program untuk mencari faktor dari sebuah bilangan yang dimasukkan.
*/

// Soal no 1
bool isPalindrome(String str) {
  String reversed = str.split('').reversed.join('');
  return str == reversed;
}

void main(List<String> args) {
  String kata = "kasur rusak";
  if (isPalindrome(kata)) {
    print("$kata adalah sebuah palindrom.");
  } else {
    print("$kata bukan sebuah palindrom.");
  }

  // Soal nomor 2
  print("=" * 25);
  int number = 24;

  print("Faktor dari $number adalah:");
  for (int i = 1; i <= number; i++) {
    if (number % i == 0) {
      print(i);
    }
  }
}
