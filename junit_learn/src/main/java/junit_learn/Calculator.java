package junit_learn;

public class Calculator {
  public int evaluate(String expression) {
    int sum = 0;
    for (String summand : expression.split("\\+"))
      sum += Integer.valueOf(summand);
    return sum;
  }

  public double add( double number1, double number2 )
  {
      return number1 + number2;
  }
}
