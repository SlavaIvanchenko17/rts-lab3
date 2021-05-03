import 'dart:math';

List<List<int>> generatePopulation(int y, int len, int maxPop){
  List<List<int>> population = List.generate(maxPop, (index) => List.generate(len, (index) => Random().nextInt((y).ceil())));
  return population;
}

int fitness(List<int> gen, List<int> data){
  int y = data.last;
  int sum = 0;
  for(int i = 0; i < gen.length; i++){
    sum += ((gen[i] * data[i]));
  }
  return (sum - y).abs();
}

List<int> createFitness(List<List<int>> population, List<int> data){
  int len = population.length;
  return List.generate(len, (index) => fitness(population[index], data));
}

List<double> generateLikelihoods(List<int> fitnesses){
  int len = fitnesses.length;
  dynamic last = 0;
  double mul = fitnesses.map((e) => 1/e).toList().reduce((value, element) => value + element);
  List<double> res = List.filled(len, 0);
  for(int i = 0; i < len; i++){
    res[i] = (last + (1/fitnesses[i])/mul);
    last = res[i];
  }
  return res;
}

int getIndex(double val, List<List<int>> population, List<double>likelihood) {
  double last = 0;
  int len = population.length;
  for(int i = 0; i < len; i++) {
    if (last <= val && val <= likelihood[i]) return i;
    else last = likelihood[i];
  }
  return len - 1;
}

List<List<int>> createNewPopulation(List<List<int>> population, List<double>likelihood, int y, double chance){
  int len = population.length;
  for(int i = 0; i < len; i++) {
    int parent1 = 0, parent2 = 0, iterations = 0;
    while(parent1 == parent2 || population[parent1] == population[parent2]){
      parent1 = getIndex((Random().nextDouble()), population, likelihood);
      parent2 = getIndex((Random().nextDouble()), population, likelihood);
      if (++iterations > (pow(len, 2))) break;
    }
    population[i] = crossover(population[parent1], population[parent2], y, chance);
  }
  return population;
}

List<int> crossover(List<int> p1, List<int> p2, int y, double chance) {
  int len = p1.length;
  int flag = Random().nextInt(len);
  List<int> child = List.filled(len, 0);
  for(int i = 0; i < len; i++) {
    if(flag < i){
      child[i] = p1[i];
    }
    child[i] = p2[i];
    if (Random().nextDouble() < chance) child[i] = Random().nextInt(y);
  }
  return child;
}

dynamic solve(List<int> data, int maxItr, int maxPop, double chance){
  int len = data.length - 1;
  int y = data.last;
  int numberPop = 0;
  List<List<int>> population = generatePopulation(y, len, maxPop);
  while(maxItr > 0){
    List<int> fitnesses = createFitness(population, data);
    int i = fitnesses.indexOf(0);
    if(i != -1){
      return [population[i], numberPop];
    }
    List<double> likelihood = generateLikelihoods(fitnesses);
    List<List<int>> child = createNewPopulation(population, likelihood, y, chance);
    numberPop++;
    population = child;
    maxItr--;
  }
  return ["Max iterations", numberPop];
}

