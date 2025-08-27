using DotNetLibrary.Library;
using NUnit.Framework;

namespace DotNetLibrary.Test
{
    [TestFixture]
    public class CalculatorTests
    {
        [Test]
        public void Add_ReturnsSum_WhenGivenTwoIntegers()
        {
            // Arrange
            var calculator = new Calculator();

            // Act
            int result = calculator.Add(2, 3);

            // Assert
            Assert.That(result, Is.EqualTo(5));
        }
    }
}
