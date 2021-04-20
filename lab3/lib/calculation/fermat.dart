import 'dart:math';

List<int> fermat(int n){
  int x = sqrt(n).ceil();
  int y2 = x * x - n;
  int y = sqrt(y2).toInt();
  while(y2 != y * y){
    x++;
    y2 = x * x - n;
    y = sqrt(y2).toInt();
  }
  return [x - y, x + y];
}