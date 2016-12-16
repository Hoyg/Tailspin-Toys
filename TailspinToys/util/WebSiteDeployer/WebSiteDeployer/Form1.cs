using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.IO;
using System.Windows.Forms;
using System.Diagnostics;

namespace WebSiteDeployer
{
    public partial class Form1 : Form
    {
        private string buildNumber = "";

        public Form1()
        {
            InitializeComponent();
        }

        private void btnSelectBuild(object sender, EventArgs e)
        {
            DialogResult result = folderBrowserDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                if (Directory.Exists(folderBrowserDialog1.SelectedPath.ToString() + @"\_PublishedWebsites"))
                {
                    buildNumber = folderBrowserDialog1.SelectedPath;
                    txtSelectedBuild.Text = buildNumber;
                    btnDeployToTEST.Enabled = true;
                    btnDeployToDEV.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Invalid build directory. \\_PublishedWebsites subfolder not found.");
                    btnDeployToDEV.Enabled = false;
                    btnDeployToTEST.Enabled = false;
                }

            }

        }

        private void btnRestoreBaselineDB_Click(object sender, EventArgs e)
        {
            Process p = new Process();
            p.StartInfo.UseShellExecute = true;
            p.StartInfo.FileName = "C:\\Scripts\\RestoreDB.bat";
            //p.StartInfo.Arguments = " \""
            //    + folderBrowserDialog1.SelectedPath.ToString()
            //    + "\\Tailspin.Schema.dbschema\" "
            //    + " \""
            //    + folderBrowserDialog1.SelectedPath.ToString()
            //    + "\\Tailspin.Schema.deploymanifest\""; ;
            p.Start();
        }

        private void btnDeployToDEV_Click(object sender, EventArgs e)
        {
        //    Process p = new Process();
        //    p.StartInfo.UseShellExecute = true;
        //    p.StartInfo.FileName = "";
        //    p.StartInfo.Arguments = ""
        //        + folderBrowserDialog1.SelectedPath.ToString()
        //        + "\\_PublishedWebsites";
        //    p.Start();
        }

        private void btnDeployToTEST_Click(object sender, EventArgs e)
        {
            Process p = new Process();
            p.StartInfo.UseShellExecute = true;
            p.StartInfo.FileName = "C:\\Scripts\\DeployWebToTest.bat";
            p.StartInfo.Arguments = "\""
                + folderBrowserDialog1.SelectedPath.ToString()
                + "\\_PublishedWebsites\\Tailspin.Web_Package\\Tailspin.Web.zip\"";
            p.Start();
        }
    }
}
