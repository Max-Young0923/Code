﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class adminStudentAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    //添加按钮Click事件
    protected void imgBtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);//创建连接对象
        SqlCommand insertCmd = new SqlCommand("insert into Student(stuID,stuPwd,stuName,stuDepart,stuGrade,stuClass) values(@stuID,@stuPwd,@stuName,@stuDepart,@stuGrade,@stuClass)", conn);
        insertCmd.Parameters.Add("@stuID", SqlDbType.VarChar, 15);//设置参数
        insertCmd.Parameters.Add("@stuPwd", SqlDbType.VarChar, 20);
        insertCmd.Parameters.Add("@stuName", SqlDbType.VarChar, 10);
        insertCmd.Parameters.Add("@stuDepart", SqlDbType.Int, 4);
        insertCmd.Parameters.Add("@stuGrade", SqlDbType.Int, 4);
        insertCmd.Parameters.Add("@stuClass", SqlDbType.Int, 4);
        insertCmd.Parameters["@stuID"].Value = txtID.Text; //为每个参数赋值
        insertCmd.Parameters["@stuPwd"].Value = txtID.Text;
        insertCmd.Parameters["@stuName"].Value = txtName.Text;
        insertCmd.Parameters["@stuDepart"].Value = int.Parse(ddlDepart.SelectedValue);
        insertCmd.Parameters["@stuGrade"].Value = int.Parse(ddlGrade.SelectedValue);
        insertCmd.Parameters["@stuClass"].Value = int.Parse(ddlClass.SelectedValue);
        try
        {
            conn.Open();
            int flag = insertCmd.ExecuteNonQuery(); //执行添加
            if (flag > 0) //如果添加成功
            {
                lblMessage.Text = "成功添加学生信息！";
            }
            else //如果添加失败
            {
                lblMessage.Text = "添加学生信息失败，查看输入是否正确！";
            }
        }
        catch (System.Exception ee)
        {
            Response.Write("<script language=javascript>alert('" + ee.Message.ToString() + "')</script>");
        }
        finally
        {
            conn.Close();
        }
    }
    protected void imgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        txtID.Text = "";
        txtName.Text = "";
    }
  
}
