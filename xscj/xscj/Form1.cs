using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.IO;

namespace xscj
{
    public partial class Form1 : Form
    {
        private string myConnStr = @"server=localhost;User Id=root;password=admin;database=pxscj;Character Set=utf8";
        private string mySqlStr;
        private MySqlConnection myConn;
        private MySqlDataAdapter myMda;
        private DataSet myDs = new DataSet();
        private MySqlCommand myCmd;
        private static string path = "";//照片文件的路径
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                myConn = new MySqlConnection(myConnStr);
                myConn.Open();
                //初始加载所有课程名
                mySqlStr = "select KCM from KC";
                myMda = new MySqlDataAdapter(mySqlStr, myConn);
                myMda.Fill(myDs, "KCM");
                comboBox_kcm.Items.Add("请选择");
                for (int i = 0; i < myDs.Tables["KCM"].Rows.Count; i++)
                {
                    comboBox_kcm.Items.Add(myDs.Tables["KCM"].Rows[i][0].ToString());
                }
                comboBox_kcm.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show("连接数据库失败！错误信息：\r\n" + ex.ToString(), "错误", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }


          /**------------------------------学生管理功能------------------------------*/

          private void button_addStu_Click(object sender, EventArgs e)
          {
              try
              {
                  //录入学生
                  string xm = textBox_xm.Text;
                  int xb = 1;
                  if (!radioButton_male.Checked) xb = 0;
                  string cssj = textBox_cssj.Text;
                  if (path != "") mySqlStr = "insert into XS values('" + xm + "'," + xb + ",'" + cssj + "',0,NULL,@Photo)"; //设置SQL语句（带照片插入）
                  else mySqlStr = "insert into XS values('" + xm + "'," + xb + ",'" + cssj + "',0,NULL,NULL)";              //设置SQL语句（不带照片插入）
                  myCmd = new MySqlCommand(mySqlStr, myConn);
                  if (path != "")
                  {
                      pictureBox_photo.Image.Dispose();
                      pictureBox_photo.Image = null;
                      FileStream fs = new FileStream(path, FileMode.Open);                //创建文件流对象
                      byte[] fileBytes = new byte[fs.Length];                             //创建字节数组
                      fs.Read(fileBytes, 0, (int)fs.Length);                              //打开Read方法
                      MySqlParameter mpar = new MySqlParameter("@Photo", SqlDbType.Image);//为命令创建参数
                      mpar.MySqlDbType = MySqlDbType.VarBinary;
                      mpar.Value = fileBytes;                                             //为参数赋值
                      myCmd.Parameters.Add(mpar);                                         //添加参数
                  }
                  myCmd.ExecuteNonQuery();
                  button_queStu_Click(null, null);                                        //录入后回显该生信息
                  path = "";
                  MessageBox.Show("添加成功！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
              }
              catch
              {
                  MessageBox.Show("添加失败，请检查输入信息！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  return;
              }
          }

          private void button_delStu_Click(object sender, EventArgs e)
          {
              try
              {
                  //删除学生
                  mySqlStr = "delete from XS where XM='" + textBox_xm.Text + "'";
                  myCmd = new MySqlCommand(mySqlStr, myConn);
                  myCmd.ExecuteNonQuery();
                  button_queStu_Click(null, null);
                  MessageBox.Show("删除成功！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
              }
              catch
              {
                  MessageBox.Show("删除失败，请检查操作权限！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  return;
              }
          }

          private void button_updStu_Click(object sender, EventArgs e)
          {
              try
              {
                  //更新学生
                  string xm = textBox_xm.Text;
                  int xb = 1;
                  if (!radioButton_male.Checked) xb = 0;
                  string cssj = textBox_cssj.Text;
                  if (path != "") mySqlStr = "update XS set XM='" + xm + "',XB=" + xb + ",CSSJ='" + cssj + "',ZP=@Photo where XM='" + xm + "'";//设置SQL语句（带照片更新）
                  else mySqlStr = "update XS set XM='" + xm + "',XB=" + xb + ",CSSJ='" + cssj + "' where XM='" + xm + "'";//设置SQL语句（不带照片更新）
                  myCmd = new MySqlCommand(mySqlStr, myConn);
                  if (path != "")
                  {
                      pictureBox_photo.Image.Dispose();
                      pictureBox_photo.Image = null;
                      FileStream fs = new FileStream(path, FileMode.Open);                //创建文件流对象
                      byte[] fileBytes = new byte[fs.Length];                             //创建字节数组
                      fs.Read(fileBytes, 0, (int)fs.Length);                              //打开Read方法
                      MySqlParameter mpar = new MySqlParameter("@Photo", SqlDbType.Image);//为命令创建参数
                      mpar.MySqlDbType = MySqlDbType.VarBinary;
                      mpar.Value = fileBytes;                                             //为参数赋值
                      myCmd.Parameters.Add(mpar);                                         //添加参数
                  }
                  myCmd.ExecuteNonQuery();
                  button_queStu_Click(null, null);                                        //更新后回显该生新的信息
                  path = "";
                  MessageBox.Show("更新成功！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
              }
              catch
              {
                  MessageBox.Show("更新失败，请检查输入信息！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  return;
              }
          }

          private void button_queStu_Click(object sender, EventArgs e)
          {
              try
              {
                  //查询学生
                  myDs.Clear();
                  mySqlStr = "select XM,XB,CSSJ,KCS from XS where XM='" + textBox_xm.Text + "'";
                  myMda = new MySqlDataAdapter(mySqlStr, myConn);
                  myMda.Fill(myDs, "XS");
                  if (myDs.Tables["XS"].Rows.Count == 1)
                  {
                      textBox_xm.Text = myDs.Tables["XS"].Rows[0]["XM"].ToString();
                      radioButton_male.Checked = bool.Parse(myDs.Tables["XS"].Rows[0]["XB"].ToString());
                      radioButton_female.Checked = !radioButton_male.Checked;
                      textBox_cssj.Text = DateTime.Parse(myDs.Tables["XS"].Rows[0]["CSSJ"].ToString()).ToString("yyyy-MM-dd");
                      textBox_kcs.Text = myDs.Tables["XS"].Rows[0]["KCS"].ToString();
                      //显示该生的各科成绩                
                      mySqlStr = "call CJ_PROC('" + textBox_xm.Text + "')";
                      myCmd = new MySqlCommand(mySqlStr, myConn);
                      myCmd.ExecuteNonQuery();                            //执行存储过程
                      mySqlStr = "select KCM As 课程名,CJ As 成绩 from XMCJ_VIEW";
                      myMda = new MySqlDataAdapter(mySqlStr, myConn);
                      myMda.Fill(myDs, "XMCJ");
                      dataGridView_xmcj.DataSource = myDs.Tables["XMCJ"].DefaultView;
                      //读取显示照片
                      if (pictureBox_photo.Image != null)
                      {
                          //如果图片框中原先就有照片，要先销毁
                          pictureBox_photo.Image.Dispose();
                          pictureBox_photo.Image = null;
                      }
                      byte[] picData = null;                              //以字节数组的方式存储获取的图片数据
                      mySqlStr = "select ZP from XS where XM='" + textBox_xm.Text + "'";
                      myCmd = new MySqlCommand(mySqlStr, myConn);
                      object data = myCmd.ExecuteScalar();                //根据参数获取数据                
                      if (!Convert.IsDBNull(data) && data != null)        //如果照片数据不为空
                      {
                          picData = (byte[])data;
                          MemoryStream ms = new MemoryStream(picData);    //字节流转换为内存流
                          pictureBox_photo.Image = Image.FromStream(ms);  //内存流转换为照片
                          ms.Close();                                     //关闭内存流
                      }
                  }
                  else
                  {
                      textBox_xm.Text = "";
                      radioButton_male.Checked = true;
                      radioButton_female.Checked = false;
                      textBox_cssj.Text = "";
                      pictureBox_photo.Image.Dispose();
                      pictureBox_photo.Image = null;
                      textBox_kcs.Text = "";
                      return;
                  }
              }
              catch
              {
                  return;
              }
          }

          private void button_selectphoto_Click(object sender, EventArgs e)
          {
              //选择照片上传
              OpenFileDialog openDialog = new OpenFileDialog();
              openDialog.InitialDirectory = @"C:\Users\Public\Pictures\Sample Pictures";               //设置文件对话框显示的初始目录
              openDialog.Filter = "bmp 文件(*.bmp)|*.bmp|gif 文件(*.gif)|*.gif|jpeg 文件(*.jpg)|*.jpg";//设置当前选定筛选器字符串以决定对话框中"文档类型"选项
              openDialog.FilterIndex = 3;                                                              //设置对话框中当前选定筛选器的索引
              openDialog.RestoreDirectory = true;                                                      //设置对话框在关闭前还原当前目录
              openDialog.Title = "选择照片";                                                           //设置对话框的标题
              if (openDialog.ShowDialog() == DialogResult.OK) path = openDialog.FileName;              //获取文件路径
              pictureBox_photo.Image = Image.FromFile(path);                                           //加载照片预览            
          }

          /**------------------------------成绩管理功能------------------------------*/

          private void button_queSco_Click(object sender, EventArgs e)
          {
              try
              {
                  //查询某课程成绩
                  myDs.Clear();
                  mySqlStr = "select XM As 姓名,CJ As 成绩 from CJ where KCM='" + comboBox_kcm.Text + "'";
                  myMda = new MySqlDataAdapter(mySqlStr, myConn);
                  myMda.Fill(myDs, "KCCJ");
                  dataGridView_kccj.DataSource = myDs.Tables["KCCJ"].DefaultView;
              }
              catch
              {
                  MessageBox.Show("查找数据出错！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  return;
              }
          }

          private void button_addSco_Click(object sender, EventArgs e)
          {
              try
              {
                  //录入成绩
                  mySqlStr = "insert into CJ(XM,KCM,CJ) values('" + textBox_name.Text + "','" + comboBox_kcm.Text + "'," + textBox_cj.Text + ")";
                  myCmd = new MySqlCommand(mySqlStr, myConn);
                  myCmd.ExecuteNonQuery();
                  button_queSco_Click(null, null);//录入后回显成绩表信息
                  MessageBox.Show("添加成功！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
              }
              catch
              {
                  MessageBox.Show("添加失败，请确保有此学生！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  return;
              }
          }

          private void button_delSco_Click(object sender, EventArgs e)
          {
              try
              {
                  //删除成绩
                  mySqlStr = "delete from CJ where XM='" + textBox_name.Text + "' and KCM='" + comboBox_kcm.Text + "'";
                  myCmd = new MySqlCommand(mySqlStr, myConn);
                  myCmd.ExecuteNonQuery();
                  button_queSco_Click(null, null);//删除后回显成绩表信息
                  MessageBox.Show("删除成功！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
              }
              catch
              {
                  MessageBox.Show("删除失败，请检查操作权限！", "提示", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                  return;
              }
          }
    }
}
