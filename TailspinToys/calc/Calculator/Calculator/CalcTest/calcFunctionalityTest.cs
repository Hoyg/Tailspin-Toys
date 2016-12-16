using Calculator;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace CalcTest
{
    
    
    /// <summary>
    ///This is a test class for calcFunctionalityTest and is intended
    ///to contain all calcFunctionalityTest Unit Tests
    ///</summary>
    [TestClass()]
    public class calcFunctionalityTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for fnAdd
        ///</summary>
        [DataSource("Microsoft.VisualStudio.TestTools.DataSource.CSV", "|DataDirectory|\\data.csv", "data#csv", DataAccessMethod.Sequential), DeploymentItem("CalcTest\\data.csv"), TestMethod()]
        public void fnAddTest()
        {
            //calcFunctionality target = new calcFunctionality(); // TODO: Initialize to an appropriate value
            //double num1 = 0F; // TODO: Initialize to an appropriate value
            //double num2 = 0F; // TODO: Initialize to an appropriate value
            //double expected = 0F; // TODO: Initialize to an appropriate value
            //double actual;
            //actual = target.fnAdd(num1, num2);
            //Assert.AreEqual(expected, actual);
            //Assert.Inconclusive("Verify the correctness of this test method.");


            calcFunctionality target = new calcFunctionality(); // TODO: Initialize to an appropriate value
            double num1 = Convert.ToDouble(TestContext.DataRow["num1"].ToString()); // TODO: Initialize to an appropriate value
            double num2 = Convert.ToDouble(TestContext.DataRow["num2"].ToString()); // TODO: Initialize to an appropriate value
            double expected = Convert.ToDouble(TestContext.DataRow["Addres"].ToString()); // TODO: Initialize to an appropriate value
            double actual;
            actual = target.fnAdd(num1, num2);
            Assert.AreEqual(expected, actual);
            
        }

        /// <summary>
        ///A test for fnMul
        ///</summary>
        [TestMethod()]
        public void fnMulTest()
        {
            calcFunctionality target = new calcFunctionality(); // TODO: Initialize to an appropriate value
            double num1 = 0F; // TODO: Initialize to an appropriate value
            double num2 = 0F; // TODO: Initialize to an appropriate value
            double expected = 0F; // TODO: Initialize to an appropriate value
            double actual;
            actual = target.fnMul(num1, num2);
            Assert.AreEqual(expected, actual);
            
        }

        /// <summary>
        ///A test for fnDiv
        ///</summary>
        [TestMethod()]
        public void fnDivTest()
        {
            calcFunctionality target = new calcFunctionality(); // TODO: Initialize to an appropriate value
            int num1 = 2; // TODO: Initialize to an appropriate value
            int num2 = 2; // TODO: Initialize to an appropriate value
            int expected = 1; // TODO: Initialize to an appropriate value
            int actual;
            actual = target.fnDiv(num1, num2);
            Assert.AreEqual(expected, actual);
            
        }

        /// <summary>
        ///A test for fnSub
        ///</summary>
        [TestMethod()]
        public void fnSubTest()
        {
            calcFunctionality target = new calcFunctionality(); // TODO: Initialize to an appropriate value
            double num1 = 0F; // TODO: Initialize to an appropriate value
            double num2 = 0F; // TODO: Initialize to an appropriate value
            double expected = 0F; // TODO: Initialize to an appropriate value
            double actual;
            actual = target.fnSub(num1, num2);
            Assert.AreEqual(expected, actual);
            
        }
    }
}
