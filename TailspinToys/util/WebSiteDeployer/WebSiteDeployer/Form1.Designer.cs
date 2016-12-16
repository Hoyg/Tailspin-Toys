namespace WebSiteDeployer
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.button1 = new System.Windows.Forms.Button();
            this.txtSelectedBuild = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnDeployToDEV = new System.Windows.Forms.Button();
            this.btnDeployToTEST = new System.Windows.Forms.Button();
            this.btnRestoreBaselineDB = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // folderBrowserDialog1
            // 
            this.folderBrowserDialog1.RootFolder = System.Environment.SpecialFolder.MyComputer;
            this.folderBrowserDialog1.SelectedPath = "C:\\drops\\Tailspin Toys - Iteration 2";
            this.folderBrowserDialog1.ShowNewFolderButton = false;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(542, 15);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(28, 23);
            this.button1.TabIndex = 0;
            this.button1.Text = "...";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.btnSelectBuild);
            // 
            // txtSelectedBuild
            // 
            this.txtSelectedBuild.Enabled = false;
            this.txtSelectedBuild.Location = new System.Drawing.Point(97, 17);
            this.txtSelectedBuild.Name = "txtSelectedBuild";
            this.txtSelectedBuild.ReadOnly = true;
            this.txtSelectedBuild.Size = new System.Drawing.Size(438, 20);
            this.txtSelectedBuild.TabIndex = 1;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Build to deploy:";
            // 
            // btnDeployToDEV
            // 
            this.btnDeployToDEV.Enabled = false;
            this.btnDeployToDEV.Location = new System.Drawing.Point(15, 59);
            this.btnDeployToDEV.Name = "btnDeployToDEV";
            this.btnDeployToDEV.Size = new System.Drawing.Size(161, 23);
            this.btnDeployToDEV.TabIndex = 3;
            this.btnDeployToDEV.Text = "Deploy to DEV";
            this.btnDeployToDEV.UseVisualStyleBackColor = true;
            this.btnDeployToDEV.Visible = false;
            this.btnDeployToDEV.Click += new System.EventHandler(this.btnDeployToDEV_Click);
            // 
            // btnDeployToTEST
            // 
            this.btnDeployToTEST.Enabled = false;
            this.btnDeployToTEST.Location = new System.Drawing.Point(201, 59);
            this.btnDeployToTEST.Name = "btnDeployToTEST";
            this.btnDeployToTEST.Size = new System.Drawing.Size(164, 23);
            this.btnDeployToTEST.TabIndex = 4;
            this.btnDeployToTEST.Text = "Deploy to TEST";
            this.btnDeployToTEST.UseVisualStyleBackColor = true;
            this.btnDeployToTEST.Click += new System.EventHandler(this.btnDeployToTEST_Click);
            // 
            // btnRestoreBaselineDB
            // 
            this.btnRestoreBaselineDB.Location = new System.Drawing.Point(391, 59);
            this.btnRestoreBaselineDB.Name = "btnRestoreBaselineDB";
            this.btnRestoreBaselineDB.Size = new System.Drawing.Size(178, 23);
            this.btnRestoreBaselineDB.TabIndex = 5;
            this.btnRestoreBaselineDB.Text = "Restore Baseline Database";
            this.btnRestoreBaselineDB.UseVisualStyleBackColor = true;
            this.btnRestoreBaselineDB.Click += new System.EventHandler(this.btnRestoreBaselineDB_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(582, 93);
            this.Controls.Add(this.btnRestoreBaselineDB);
            this.Controls.Add(this.btnDeployToTEST);
            this.Controls.Add(this.btnDeployToDEV);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtSelectedBuild);
            this.Controls.Add(this.button1);
            this.Name = "Form1";
            this.Text = "IBuySpy Web Site Deployer";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FolderBrowserDialog folderBrowserDialog1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox txtSelectedBuild;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnDeployToDEV;
        private System.Windows.Forms.Button btnDeployToTEST;
        private System.Windows.Forms.Button btnRestoreBaselineDB;
    }
}

