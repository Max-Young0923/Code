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

public partial class adminTeacherDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridViewBind();
        }
    }
    //GridView绑定数据方法
    private void GridViewBind()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string SqlStr = "SELECT Teacher.*,Depart.* FROM Teacher ,Depart where Teacher.teaDepart=Depart.departID order by Teacher.teaDepart";
        DataSet ds = new DataSet();
        SqlConnection conn = new SqlConnection(connStr);
        try
        {
            if (conn.State.ToString() == "Closed")
                conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
            da.Fill(ds);

            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("数据库错误，错误原因：" + ex.Message);
            Response.End();
        }
        finally
        {
            if (conn.State.ToString() == "Open")
                conn.Close();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (((DropDownList)e.Row.FindControl("ddlDepart")) != null)
        {
            DropDownList ddldepart = (DropDownList)e.Row.FindControl("ddlDepart");

            //  生成 DropDownList 的值，绑定数据
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string SqlStr = "SELECT * from Depart";
            DataSet ds = new DataSet();

            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
            da.Fill(ds);
            if (conn.State.ToString() == "Open") conn.Close();

            ddldepart.DataSource = ds.Tables[0].DefaultView;
            ddldepart.DataTextField = "departName";
            ddldepart.DataValueField = "departID";
            ddldepart.DataBind();
            //

            //  选中 DropDownList
            ddldepart.SelectedValue = ((HiddenField)e.Row.FindControl("hdfDepart")).Value;
            ddldepart.SelectedItem.Text = ((HiddenField)e.Row.FindControl("hdfDepart")).Value;
            //
        }

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView编辑项索引等于单击行的索引
        GridViewBind();

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        GridViewBind();

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string teaid = GridView1.DataKeys[e.RowIndex].Values[0].ToString();   //取出编辑行的主键值
        string teaName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;   //取出修改后的值
        int teaDepart = int.Parse(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlDepart")).SelectedValue);
        

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string SqlStr = "update Teacher set teaName='" + teaName + "',teaDepart='" + teaDepart + "' where teaID=" + teaid;

        try
        {
            SqlConnection conn = new SqlConnection(connStr);  //创建连接对象
            if (conn.State.ToString() == "Closed")   //如果连接关闭,打开连接
                conn.Open();
            SqlCommand comm = new SqlCommand(SqlStr, conn);
            comm.ExecuteNonQuery();     //执行修改
            comm.Dispose();
            if (conn.State.ToString() == "Open")  //如果连接打开,关闭连接
                conn.Close();

            GridView1.EditIndex = -1;
            GridViewBind();
        }
        catch (Exception ex)  //异常处理
        {
            Response.Write("数据库错误，错误原因：" + ex.Message);
            Response.End();
        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出要删除记录的主键值
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //取出连接字符串
        string SqlStr = "delete from Teacher where teaID=" + id;

        try
        {
            SqlConnection conn = new SqlConnection(connStr);  //创建连接对象
            if (conn.State.ToString() == "Closed")
                conn.Open();
            SqlCommand comm = new SqlCommand(SqlStr, conn);
            comm.ExecuteNonQuery();          //执行删除
            comm.Dispose();
            if (conn.State.ToString() == "Open")
                conn.Close();

            GridView1.EditIndex = -1;
            GridViewBind();
        }
        catch (Exception ex)
        {
            Response.Write("数据库错误，错误原因：" + ex.Message);
            Response.End();
        }

    }
  
}
