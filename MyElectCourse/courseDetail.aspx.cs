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

public partial class courseDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            CourceDetailsShow();
        }
    }

    //显示课程信息
    private void CourceDetailsShow()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "SELECT Cource.*,Teacher.teaName from Cource,Teacher where Cource.teaID=Teacher.teaID and Cource.courceID='" + Request["courceID"].ToString() + "' and Cource.teaID='" + Request["teaID"].ToString() + "'";
        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        try
        {
            if (conn.State.ToString() == "Closed")          //连接如果关闭，打开
                conn.Open();
            SqlCommand cmd=new SqlCommand(SqlStr, conn);    //创建操作数据库对象
            SqlDataReader sdr = cmd.ExecuteReader();        //执行查询，将结果放到DataReader对象
            if (sdr.Read())                                 //如果查询到课程信息，显示
            {
                courceNameF.Text = sdr["courceName"].ToString();
                courceName.Text = sdr["courceName"].ToString();
                teaName.Text = sdr["teaName"].ToString();
                courceTime.Text = sdr["courceTime"].ToString();
                courceAddress.Text = sdr["courceAddress"].ToString();
                courceDetails.Text = sdr["courceInfo"].ToString();
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
