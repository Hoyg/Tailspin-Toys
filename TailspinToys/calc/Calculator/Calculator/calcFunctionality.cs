using System;
using System.Collections.Generic;
using System.Text;

namespace Calculator
{
    class calcFunctionality
    {
        public calcFunctionality()
        {
        }

      //function for addition
        public double fnAdd(double num1,double num2)
        {
            double result = num1 + num2;
            return result; 
            //samples
        }
        
        //function for multiplication
        public double fnMul(double num1, double num2)
        {
            double result = num1 * num2;
            return result;
        }

        //function for division
        //public double fnDiv(double num1, double num2)
        //{
        //    double result = num1 / num2;
        //    return result;
        //}

        public int fnDiv(int num1, int num2)
        {
            int result = num1 / num2;
            return result;
        }

        //function for subtraction
        public double fnSub(double num1, double num2)
        {
            double result = num1 - num2;
            return result;
        }

        //function for square root
        public double fnSqrt(double num1, double num2)
        {
            double result = num1 + num2;
            return Math.Sqrt(result);
        }
      
     }
}
