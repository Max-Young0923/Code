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

public partial class adminTeacherAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
       
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        
    }
    //添加按钮事件
    protected void imgBtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);//创建连接对象
        SqlCommand insertCmd = new SqlCommand("insert into Teacher(teaID,teaPwd,teaName,teaDepart) values(@teaID,@teaPwd,@teaName,@teaDepart)", conn);
        insertCmd.Parameters.Add("@teaID", SqlDbType.VarChar, 15);//设置参数
        insertCmd.Parameters.Add("@teaPwd", SqlDbType.VarChar, 20);
        insertCmd.Parameters.Add("@teaName", SqlDbType.VarChar, 10);
        insertCmd.Parameters.Add("@teaDepart", SqlDbType.Int, 4);
        insertCmd.Parameters["@teaID"].Value = txtID.Text; //为参数赋值
        insertCmd.Parameters["@teaPwd"].Value = txtID.Text;
        insertCmd.Parameters["@teaName"].Value = txtName.Text;
        insertCmd.Parameters["@teaDepart"].Value = int.Parse(ddlDepart.SelectedValue);
        try
        {
            conn.Open();
            int flag = insertCmd.ExecuteNonQuery(); //执行添加
            if (flag > 0) //如果添加成功
            {
                lblMessage.Text = "成功添加教师信息！";
            }
            else //如果添加失败
            {
                lblMessage.Text = "添加教师信息失败，查看输入是否正确！";
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
