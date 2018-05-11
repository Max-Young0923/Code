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

public partial class ModifyPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (this.Session["userID"] == null)
        //{
        //    Response.Redirect("Login.aspx");
        //}
    }
    
    //修改密码按钮事件
    protected void imgBtnConfirm_Click(object sender, ImageClickEventArgs e)
    {    
        //取参数
        string userName = Session["userName"].ToString();
        string oldPwd = txtOldPwd.Text.Trim();
        string newPwd = txtNewPwd.Text.Trim();
        string selectStr="";
        string updateStr="";
        switch (Session["userRole"].ToString())
        {
            case "0":                       //身份为教师时              
                selectStr = "Select * from Teacher where teaID = ='" + userName + "' and teaPwd='" + oldPwd + "'";
                updateStr="update  Teacher set teaPwd='" + newPwd + "' where teaID='" + userName + "'";
                break;
            case "1":                       //身份为学生时
                selectStr = "Select * from Student where stuID = ='" + userName + "' and stuPwd='" + oldPwd + "'";
                updateStr="update  Student set stuPwd='" + newPwd + "' where stuID='" + userName + "'";
                break;
            case "2":                       //身份为管理员时
                selectStr = "Select * from Users where adminName = ='" + userName + "' and adminPwd='" + oldPwd + "'";
                updateStr="update  Users set adminPwd='" + newPwd + "' where adminName='" + userName + "'";
                break;
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand selectCmd = new SqlCommand(selectStr, conn);
        try
        {
            conn.Open();
            SqlDataReader sdr = selectCmd.ExecuteReader();
            if (sdr.Read())                 //如果用户存在且输入密码正确，修改密码
            {
                sdr.Close();
                SqlCommand updateCmd = new SqlCommand(updateStr, conn);
                int i = updateCmd.ExecuteNonQuery();
                if (i > 0)                  //根据修改后返回的结果给出提示
                {
                    Response.Write("成功修改密码！");
                }
                else
                {
                    Response.Write("修改密码失败！");
                }
            }
            else
            {
                Response.Write("您输入的密码错误，检查后重新输入！");
            }
        }
        catch (System.Exception ee)         //系统出错，错误处理
        {
            Response.Write("系统出错，错误原因：" + ee.Message.ToString());
        }
        finally
        {
            conn.Close();
        }
    }
    protected void imgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        txtOldPwd.Text = "";
        txtNewPwd.Text = "";
        txtConfirmPwd.Text = "";
    }
}
