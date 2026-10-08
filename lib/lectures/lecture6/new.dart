
void main() {
  var s = {'key': 'value'};
  for (var key in s.entries) {
    print("${key.key} ${key.value}");
  }
}
