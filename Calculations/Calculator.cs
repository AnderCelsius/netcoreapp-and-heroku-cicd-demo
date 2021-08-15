using System.Collections.Generic;


namespace Calculations
{
    public class Calculator
    {
        public List<int> FiboNumbers = new() { 1, 1, 2, 3, 5, 8, 13 };
        public static int Add(int a, int b)
        {
            return a + b;
        }

        public static double AddDouble(double a, double b)
        {
            return a + b;
        }

        
    }
}
