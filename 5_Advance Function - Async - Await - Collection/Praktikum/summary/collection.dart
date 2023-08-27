// LIST
void main() async {
  var list = [];
  list.add("a");
  list.add("b");
  list.add("c");
  list.add(1);
  list.add(2);
  list.add(3.3);
  list.add(true);
  list.add(false);
  print(list);

  print(list[0]);

  for (var i in list) {
    print(i);
  }
  // MAP / Dictionary
  var map = {};
  map["name"] = "amanda";
  map["umur"] = 20;
  print(map);

  print(map["name"]);
  print(map["umur"]);

  for (var i in map.keys) {
    print(map[i]);
  }
}
