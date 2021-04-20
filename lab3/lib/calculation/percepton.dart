dynamic perceptron(List<List<int>> points, int p) => (int maxItr, double maxTime, double sigma){
  double w1 = 0;
  double w2 = 0;
  double time = 0;
  int itr = 0;
  var timer = Stopwatch();
  timer..start();
  while(maxItr > itr && maxTime > time){
    for(var point in points){
      var y =  w1 * point[0] + w2 * point[1];
      var delta = p - y;
      var getDelta = delta  > 0 ? delta : 0;
      w1 = w1 + point[0] * getDelta * sigma;
      w2 = w2 + point[1] * getDelta * sigma;
    }
    print("$itr Iterations == << w1 = $w1, w2 = $w2 >>");
    time = (timer.elapsedMilliseconds)/1000;
    itr++;
  }
  return [w1, w2, itr, time];
};