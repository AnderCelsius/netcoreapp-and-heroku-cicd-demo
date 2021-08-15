using System;
using System.Collections.Generic;
using Xunit;

namespace Calculations.Tests
{
    public class CalculationsTest
    {
        [Fact]
        public void Add_GivenTwoIntegerNumbers_ReturnSum()
        {
            var calc = new Calculator();
            int result = Calculator.Add(1, 2);
            Assert.Equal(3, result);
        }

        [Fact]
        public void AddDouble_GivenTwoDoubleValues_ReturnSum()
        {
            var calc = new Calculator();
            double result = Calculator.AddDouble(1.53, 1.45);
            Assert.Equal(2.9, result, 0);
        }

        [Fact]
        [Trait("Category", "Fibonacci")]
        public void CheckFiboIsNotZero()
        {
            var calc = new Calculator();
            //Assert.All(calc.FiboNumbers, num => Assert.NotEqual(0, num));
            Assert.DoesNotContain(0, calc.FiboNumbers);
        }

        [Fact]
        [Trait("Category", "Fibonacci")]
        public void Check13Exists()
        {
            var calc = new Calculator();
            Assert.Contains(13, calc.FiboNumbers);
        }

        [Fact]
        [Trait("Category", "Fibonacci")]
        public void CheckFiboNumbers()
        {
            var allFiboNumbers = new List<int> { 1, 1, 2, 3, 5, 8, 13 };
            var calc = new Calculator();
            Assert.Equal(allFiboNumbers, calc.FiboNumbers);
        }
    }
}
