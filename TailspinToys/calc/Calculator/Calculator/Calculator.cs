using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;


namespace Calculator
{

    public partial class Calculator : Form
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1051:DoNotDeclareVisibleInstanceFields")]
        public double result;
        public int res;
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        static void main()
        {
            Application.Run (new Calculator());
        }
        public Calculator()
        {
            InitializeComponent();
        }

        private void btnadd_Click(object sender, EventArgs e)
        {
            double num1 = Convert.ToDouble(txbox1.Text);
            double num2 = Convert.ToDouble(txbBox2.Text);

            calcFunctionality calAdd = new calcFunctionality();
            result = calAdd.fnAdd(num1, num2);
            ResultTextBox.Text = result.ToString();
        }

        private void btnSub_Click(object sender, EventArgs e)
        {
            double num1 = Convert.ToDouble(txbox1.Text);
            double num2 = Convert.ToDouble(txbBox2.Text);
            calcFunctionality calSub = new calcFunctionality();
            result = calSub.fnSub(num1, num2);
            ResultTextBox.Text = result.ToString();
        }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1305:SpecifyIFormatProvider", MessageId = "System.Double.ToString"), System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1305:SpecifyIFormatProvider", MessageId = "System.Convert.ToDouble(System.String)")]
        private void btnMul_Click(object sender, EventArgs e)
        {
            double num1 = Convert.ToDouble(txbox1.Text);
            double num2 = Convert.ToDouble(txbBox2.Text);
            calcFunctionality calMul = new calcFunctionality();
            result = calMul.fnMul(num1, num2);
            ResultTextBox.Text = result.ToString();
            
        }

        private void btndivide_Click(object sender, EventArgs e)
        {
            int num1 = Convert.ToInt32(txbox1.Text);
            int num2 = Convert.ToInt32(txbBox2.Text);
            calcFunctionality calDiv = new calcFunctionality();
            res = calDiv.fnDiv(num1, num2);
            ResultTextBox.Text = res.ToString();                       
        }

        private void btnsqrt_Click(object sender, EventArgs e)
        {
            double num1 = Convert.ToDouble(txbox1.Text);
            double num2 = Convert.ToDouble(txbBox2.Text);
            calcFunctionality calSqrt = new calcFunctionality();
            result = calSqrt.fnSqrt(num1, num2);
            ResultTextBox.Text = result.ToString(); 
        }

        private void button1_Click(object sender, EventArgs e)
        {
            calcFunctionality calMsgBox = new calcFunctionality();
            
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        
        
    }
}