using System;
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

public partial class Login : System.Web.UI.Page
{
   
    protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        //接收用户输入的参数
        string userName = txtUserName.Text.ToString().Trim();
        string userPwd = txtPwd.Text.ToString().Trim();
        string userRole = rblClass.SelectedValue.Trim();
        string selectStr = "";
        switch (userRole)
        {
            case "0":                       //身份为教师时              
                selectStr = "Select * from Teacher where teaID = '" + userName + "'";    
                break;
            case "1":                       //身份为学生时
                selectStr = "Select * from Student where stuID = '" + userName + "'";
                break;
            case "2":                       //身份为管理员时
                selectStr = "Select * from Users where adminName = '" + userName + "'";
                break;
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmd = new SqlCommand(selectStr,conn);
        try
        {
            conn.Open();                    //打开连接
            SqlDataReader sdr = cmd.ExecuteReader(); //执行查询
            if (sdr.Read())                 //如果该用户存在
            {
                if (sdr.GetString(1) == userPwd) //密码正确
                {
                    Session["userName"] = userName;
                    Session["userRole"] = userRole;
                    conn.Close();
                    switch (userRole)
                    {
                        case "0":           //身份为教师时              
                            Response.Redirect("TeacherQueryElect.aspx");
                            break;
                        case "1":           //身份为学生时
                            Response.Redirect("StudentElect.aspx");
                            break;
                        case "2":           //身份为管理员时
                            Response.Redirect("Main.aspx");
                            break;
                    }                    
                }
                else                        //密码错误，给出提示信息！
                {
                    lblMessage.Text = "您输入的密码错误，请检查后重新输入！";
                }
            }
            else                            //用户不存在或用户名输入错误
            {
                lblMessage.Text = "该用户不存在或用户名输入错误，请检查后重新输入！";
            }
        }
        catch (Exception ee)
        {
            Response.Write("<script language=javascript>alert('" + ee.Message.ToString() + "')</script>");
        }
        finally
        {
            conn.Close();
        }        
    }

}
