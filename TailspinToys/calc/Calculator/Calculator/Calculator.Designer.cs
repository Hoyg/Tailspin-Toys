namespace Calculator
{
    partial class Calculator
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId = "System.Windows.Forms.Control.set_Text(System.String)"), System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Globalization", "CA1303:DoNotPassLiteralsAsLocalizedParameters", MessageId = "System.Windows.Forms.ToolStripItem.set_Text(System.String)")]
        private void InitializeComponent()
        {
          this.txbox1 = new System.Windows.Forms.TextBox();
          this.AddButton = new System.Windows.Forms.Button();
          this.SubtractButton = new System.Windows.Forms.Button();
          this.btndivide = new System.Windows.Forms.Button();
          this.txbBox2 = new System.Windows.Forms.TextBox();
          this.Num1Label = new System.Windows.Forms.Label();
          this.Num2Label = new System.Windows.Forms.Label();
          this.ResultLabel = new System.Windows.Forms.Label();
          this.ResultTextBox = new System.Windows.Forms.TextBox();
          this.MultiplyButton = new System.Windows.Forms.Button();
          this.menuStrip1 = new System.Windows.Forms.MenuStrip();
          this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
          this.openToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.saveToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.savToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.newToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.closeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.copyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.pateToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.cutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
          this.menuStrip1.SuspendLayout();
          this.SuspendLayout();
          // 
          // txbox1
          // 
          this.txbox1.Location = new System.Drawing.Point(77, 28);
          this.txbox1.Name = "txbox1";
          this.txbox1.Size = new System.Drawing.Size(189, 20);
          this.txbox1.TabIndex = 0;
          // 
          // AddButton
          // 
          this.AddButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
          this.AddButton.Location = new System.Drawing.Point(19, 92);
          this.AddButton.Name = "AddButton";
          this.AddButton.Size = new System.Drawing.Size(65, 25);
          this.AddButton.TabIndex = 1;
          this.AddButton.Text = "Add";
          this.AddButton.UseVisualStyleBackColor = true;
          this.AddButton.Click += new System.EventHandler(this.btnadd_Click);
          // 
          // SubtractButton
          // 
          this.SubtractButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
          this.SubtractButton.Location = new System.Drawing.Point(85, 92);
          this.SubtractButton.Name = "SubtractButton";
          this.SubtractButton.Size = new System.Drawing.Size(65, 25);
          this.SubtractButton.TabIndex = 2;
          this.SubtractButton.Text = "Subtract";
          this.SubtractButton.UseVisualStyleBackColor = true;
          this.SubtractButton.Click += new System.EventHandler(this.btnSub_Click);
          // 
          // btndivide
          // 
          this.btndivide.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
          this.btndivide.Location = new System.Drawing.Point(217, 92);
          this.btndivide.Name = "btndivide";
          this.btndivide.Size = new System.Drawing.Size(65, 25);
          this.btndivide.TabIndex = 3;
          this.btndivide.Text = "Divide";
          this.btndivide.UseVisualStyleBackColor = true;
          this.btndivide.Click += new System.EventHandler(this.btndivide_Click);
          // 
          // txbBox2
          // 
          this.txbBox2.Location = new System.Drawing.Point(77, 54);
          this.txbBox2.Name = "txbBox2";
          this.txbBox2.Size = new System.Drawing.Size(189, 20);
          this.txbBox2.TabIndex = 5;
          // 
          // Num1Label
          // 
          this.Num1Label.AutoSize = true;
          this.Num1Label.Location = new System.Drawing.Point(27, 28);
          this.Num1Label.Name = "Num1Label";
          this.Num1Label.Size = new System.Drawing.Size(35, 13);
          this.Num1Label.TabIndex = 6;
          this.Num1Label.Text = "Num1";
          // 
          // Num2Label
          // 
          this.Num2Label.AutoSize = true;
          this.Num2Label.Location = new System.Drawing.Point(27, 57);
          this.Num2Label.Name = "Num2Label";
          this.Num2Label.Size = new System.Drawing.Size(35, 13);
          this.Num2Label.TabIndex = 7;
          this.Num2Label.Text = "Num2";
          // 
          // ResultLabel
          // 
          this.ResultLabel.AutoSize = true;
          this.ResultLabel.Location = new System.Drawing.Point(27, 136);
          this.ResultLabel.Name = "ResultLabel";
          this.ResultLabel.Size = new System.Drawing.Size(37, 13);
          this.ResultLabel.TabIndex = 8;
          this.ResultLabel.Text = "Result";
          // 
          // ResultTextBox
          // 
          this.ResultTextBox.Location = new System.Drawing.Point(77, 133);
          this.ResultTextBox.Name = "ResultTextBox";
          this.ResultTextBox.ReadOnly = true;
          this.ResultTextBox.Size = new System.Drawing.Size(189, 20);
          this.ResultTextBox.TabIndex = 9;
          // 
          // MultiplyButton
          // 
          this.MultiplyButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
          this.MultiplyButton.Location = new System.Drawing.Point(151, 92);
          this.MultiplyButton.Name = "MultiplyButton";
          this.MultiplyButton.Size = new System.Drawing.Size(65, 25);
          this.MultiplyButton.TabIndex = 10;
          this.MultiplyButton.Text = "Multiply";
          this.MultiplyButton.UseVisualStyleBackColor = true;
          this.MultiplyButton.Click += new System.EventHandler(this.btnMul_Click);
          // 
          // menuStrip1
          // 
          this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.editToolStripMenuItem});
          this.menuStrip1.Location = new System.Drawing.Point(0, 0);
          this.menuStrip1.Name = "menuStrip1";
          this.menuStrip1.Size = new System.Drawing.Size(301, 24);
          this.menuStrip1.TabIndex = 12;
          this.menuStrip1.Text = "menuStrip1";
          // 
          // toolStripMenuItem1
          // 
          this.toolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.openToolStripMenuItem,
            this.saveToolStripMenuItem,
            this.savToolStripMenuItem,
            this.newToolStripMenuItem,
            this.closeToolStripMenuItem});
          this.toolStripMenuItem1.Name = "toolStripMenuItem1";
          this.toolStripMenuItem1.Size = new System.Drawing.Size(35, 20);
          this.toolStripMenuItem1.Text = "File";
          // 
          // openToolStripMenuItem
          // 
          this.openToolStripMenuItem.Name = "openToolStripMenuItem";
          this.openToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
          this.openToolStripMenuItem.Text = "Open";
          // 
          // saveToolStripMenuItem
          // 
          this.saveToolStripMenuItem.Name = "saveToolStripMenuItem";
          this.saveToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
          this.saveToolStripMenuItem.Text = "Save";
          // 
          // savToolStripMenuItem
          // 
          this.savToolStripMenuItem.Name = "savToolStripMenuItem";
          this.savToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
          this.savToolStripMenuItem.Text = "SaveAs";
          // 
          // newToolStripMenuItem
          // 
          this.newToolStripMenuItem.Name = "newToolStripMenuItem";
          this.newToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
          this.newToolStripMenuItem.Text = "New";
          // 
          // closeToolStripMenuItem
          // 
          this.closeToolStripMenuItem.Name = "closeToolStripMenuItem";
          this.closeToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
          this.closeToolStripMenuItem.Text = "Close";
          // 
          // editToolStripMenuItem
          // 
          this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.copyToolStripMenuItem,
            this.pateToolStripMenuItem,
            this.cutToolStripMenuItem});
          this.editToolStripMenuItem.Name = "editToolStripMenuItem";
          this.editToolStripMenuItem.Size = new System.Drawing.Size(37, 20);
          this.editToolStripMenuItem.Text = "Edit";
          // 
          // copyToolStripMenuItem
          // 
          this.copyToolStripMenuItem.Name = "copyToolStripMenuItem";
          this.copyToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
          this.copyToolStripMenuItem.Text = "Copy";
          // 
          // pateToolStripMenuItem
          // 
          this.pateToolStripMenuItem.Name = "pateToolStripMenuItem";
          this.pateToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
          this.pateToolStripMenuItem.Text = "Pate";
          // 
          // cutToolStripMenuItem
          // 
          this.cutToolStripMenuItem.Name = "cutToolStripMenuItem";
          this.cutToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
          this.cutToolStripMenuItem.Text = "Cut";
          // 
          // Calculator
          // 
          this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
          this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
          this.ClientSize = new System.Drawing.Size(301, 189);
          this.Controls.Add(this.MultiplyButton);
          this.Controls.Add(this.ResultTextBox);
          this.Controls.Add(this.ResultLabel);
          this.Controls.Add(this.Num2Label);
          this.Controls.Add(this.Num1Label);
          this.Controls.Add(this.txbBox2);
          this.Controls.Add(this.btndivide);
          this.Controls.Add(this.SubtractButton);
          this.Controls.Add(this.AddButton);
          this.Controls.Add(this.txbox1);
          this.Controls.Add(this.menuStrip1);
          this.MainMenuStrip = this.menuStrip1;
          this.Name = "Calculator";
          this.Text = "Calculator";
          this.Load += new System.EventHandler(this.Form1_Load);
          this.menuStrip1.ResumeLayout(false);
          this.menuStrip1.PerformLayout();
          this.ResumeLayout(false);
          this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txbox1;
        private System.Windows.Forms.Button AddButton;
        private System.Windows.Forms.Button SubtractButton;
        private System.Windows.Forms.Button btndivide;
        private System.Windows.Forms.TextBox txbBox2;
        private System.Windows.Forms.Label Num1Label;
        private System.Windows.Forms.Label Num2Label;
        private System.Windows.Forms.Label ResultLabel;
        private System.Windows.Forms.TextBox ResultTextBox;
        private System.Windows.Forms.Button MultiplyButton;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem openToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem copyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem pateToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem savToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem newToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem closeToolStripMenuItem;
    }
}

