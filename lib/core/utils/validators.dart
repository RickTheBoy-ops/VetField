bool isValidCpf(String input) {
  final digits = input.replaceAll(RegExp(r'\D'), '');
  if (digits.length != 11) return false;
  if (RegExp(r'^(\d)\1{10}').hasMatch(digits)) return false;
  List<int> nums = digits.split('').map(int.parse).toList();
  int sum1 = 0;
  for (int i = 0; i < 9; i++) {
    sum1 += nums[i] * (10 - i);
  }
  int d1 = (sum1 * 10) % 11;
  if (d1 == 10) d1 = 0;
  if (d1 != nums[9]) return false;
  int sum2 = 0;
  for (int i = 0; i < 10; i++) {
    sum2 += nums[i] * (11 - i);
  }
  int d2 = (sum2 * 10) % 11;
  if (d2 == 10) d2 = 0;
  return d2 == nums[10];
}

bool isValidCrmv(String input) {
  final regex = RegExp(r'^[0-9]{3,6}-[A-Za-z]{2}$');
  return regex.hasMatch(input.trim());
}
