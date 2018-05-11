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

public partial class StudentElect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //GridView1控件的RowCommand事件
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "select")                          //如果单击的是“选修”按钮
        {
            int index = Convert.ToInt32(e.CommandArgument);     //取出选修课程所在的行索引       
            DataKey key = GridView1.DataKeys[index];            //创建DataKey集合接收该行的主键
            string courceID = GridView1.DataKeys[index].Values[0].ToString().Trim();//取出课程编号主键值
            string teaID = GridView1.DataKeys[index].Values[1].ToString().Trim();   //取出教师编号主键值
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string SqlStr = "insert into Elect(stuID,courceID,teaID) values('" + Session["userName"].ToString() + "','" + courceID + "','" + teaID + "')";
            try
            {
                SqlConnection conn = new SqlConnection(connStr);//创建连接对象
                if (conn.State.ToString() == "Closed")          //如果连接关闭,打开连接
                    conn.Open();
                SqlCommand comm = new SqlCommand(SqlStr, conn);
                comm.ExecuteNonQuery();                         //执行插入选修课程
                comm.Dispose();
                if (conn.State.ToString() == "Open")            //如果连接打开,关闭连接
                    conn.Close();
            }
            catch (Exception ex)                                //异常处理
            {
                Response.Write("数据库错误，错误原因：" + ex.Message);
                Response.End();
            }
        }
    }

    //GridView2控件的RowCommand事件
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "shanchu")                         //如果单击的是“退选”按钮
        {
            int index = Convert.ToInt32(e.CommandArgument);     //取出选修课程所在的行索引       
            DataKey key = GridView1.DataKeys[index];            //创建DataKey集合接收该行的主键
            string stuID = GridView2.DataKeys[index].Values[0].ToString().Trim();   //取出学号主键值
            string courceID = GridView1.DataKeys[index].Values[0].ToString().Trim();//取出课程编号主键值
            string teaID = GridView1.DataKeys[index].Values[1].ToString().Trim();   //取出教师编号主键值
            string userName = Session["userName"].ToString();
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string SqlStr = "delete from Elect where stuID='" + userName + "' and courceID='" + courceID + "' and teaID='" + teaID + "'";
            try
            {
                SqlConnection conn = new SqlConnection(connStr);//创建连接对象
                if (conn.State.ToString() == "Closed")          //如果连接关闭,打开连接
                    conn.Open();
                SqlCommand comm = new SqlCommand(SqlStr, conn);
                comm.ExecuteNonQuery();                         //执行插入选修课程
                comm.Dispose();
                if (conn.State.ToString() == "Open")            //如果连接打开,关闭连接
                    conn.Close();
            }
            catch (Exception ex)                                //异常处理
            {
                Response.Write("数据库错误，错误原因：" + ex.Message);
                Response.End();
            }
        }
    }
}
