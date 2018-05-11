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

public partial class adminCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            ddlBind();
            CourceDetailsShow();
        }
    }

    private void ddlBind()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "SELECT teaID,teaName from Teacher";
        DataSet ds = new DataSet();

        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        if (conn.State.ToString() == "Closed")              //如果连接关闭,打开
            conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
        da.Fill(ds);                                        //从数据库中取数据放到DataSet数据集中
        if (conn.State.ToString() == "Open")
            conn.Close();

        ddlTeacherName.DataSource = ds.Tables[0].DefaultView;
        ddlTeacherName.DataTextField = "teaName";             //下拉列表框每项显示教师姓名
        ddlTeacherName.DataValueField = "teaID";              //下拉列表框每项的值为教师编号
        ddlTeacherName.DataBind();        
    }
    private void CourceDetailsShow()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "SELECT Cource.*,Teacher.teaName from Cource,Teacher where Cource.teaID=Teacher.teaID and Cource.courceID='" + Request["courceID"].ToString() + "' and Cource.teaID='" + Request["teaID"].ToString() + "'";
        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        try
        {
            if (conn.State.ToString() == "Closed")          //连接如果关闭，打开
                conn.Open();
            SqlCommand cmd = new SqlCommand(SqlStr, conn);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                courceName.Text = sdr["courceName"].ToString();
                txtName.Text = sdr["courceName"].ToString();
                ddlTeacherName.SelectedItem.Text = sdr["teaName"].ToString();
                txtTime.Text = sdr["courceTime"].ToString();
                txtAddress.Text = sdr["courceAddress"].ToString();
                txtDetails.Text = sdr["courceInfo"].ToString();
            }
            else
            {
                Response.Write("数据库错误，没查询到该门课程！");
                Response.End();
            }
        }
        catch (Exception ex)                                //异常处理
        {
            Response.Write("数据库错误，错误原因：" + ex.Message);
            Response.End();
        }
        finally
        {
            if (conn.State.ToString() == "Open")            //如果连接打开，关闭
                conn.Close();
        }
    }
    //修改课程事件
    protected void imgBtnConfirm_Click(object sender, ImageClickEventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "update Cource set courceName='"+txtName.Text+"',teaID='"+ddlTeacherName.SelectedValue+"',courceTime='"+txtTime.Text+"',courceAddress='"+txtAddress.Text+"',courceInfo='"+txtDetails.Text+"' where courceID='" + Request["courceID"].ToString() + "' and teaID='" + Request["teaID"].ToString() + "'";
        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        try
        {
            if (conn.State.ToString() == "Closed")          //连接如果关闭，打开
                conn.Open();
            SqlCommand cmd = new SqlCommand(SqlStr, conn);
            int flag = cmd.ExecuteNonQuery();
            if (flag>0)
            {
                lblMessage.Text = "成功修改课程信息！";
            }
            else
            {
                Response.Write("数据库错误，没查询到该门课程！");
                Response.End();
            }
        }
        catch (Exception ex)                                //异常处理
        {
            Response.Write("数据库错误，错误原因：" + ex.Message);
            Response.End();
        }
        finally
        {
            if (conn.State.ToString() == "Open")            //如果连接打开，关闭
                conn.Close();
        }
    }
 
}
