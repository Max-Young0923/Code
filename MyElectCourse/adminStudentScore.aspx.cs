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

public partial class adminStudentScore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindDDL();      //初始化课程下拉列表框
            //GridViewBind();
        }
    }

    private void BindDDL()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "SELECT distinct courceID,courceName from Cource";
        DataSet ds = new DataSet();

        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        if (conn.State.ToString() == "Closed")              //如果连接关闭,打开
            conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
        da.Fill(ds);                                        //从数据库中取数据放到DataSet数据集中
        if (conn.State.ToString() == "Open")
            conn.Close();

        ddlCource.DataSource = ds.Tables[0].DefaultView;
        ddlCource.DataTextField = "courceName";             //下拉列表框每项显示课程名称
        ddlCource.DataValueField = "courceID";              //下拉列表框每项的值为课程编号
        ddlCource.DataBind();
    }

    private void GridViewBind()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string SqlStr = "SELECT student.*,Elect.* FROM Student ,Elect where Student.stuID=Elect.stuID and Elect.courceID='"+ddlCource.SelectedValue+"' and teaID='"+ddlTeacher.SelectedValue+"' order by Student.stuGrade";
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
        string stuid = GridView1.DataKeys[e.RowIndex].Values[0].ToString();   //取出编辑行的主键值
        string courceID = ddlCource.SelectedValue;
        string teaID = ddlTeacher.SelectedValue;        
        int Score = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtScore")).Text);

        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string SqlStr = "update Elect set Score='" + Score + "' where stuID='" + stuid+"'  and courceID='"+courceID+"' and teaID='"+teaID+"'";

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
        string stuid = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出要删除记录的主键值
        string courceID = ddlCource.SelectedValue;
        string teaID = ddlTeacher.SelectedValue;  
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //取出连接字符串
        string SqlStr = "delete from Elect where stuID='" + stuid + "'  and courceID='" + courceID + "' and teaID='" + teaID + "'";

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
    protected void ddlTeacher_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewBind();
    }
    protected void ddlCource_SelectedIndexChanged(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "SELECT distinct Teacher.teaID,Teacher.teaName from Cource,Teacher where Cource.teaID=Teacher.teaID and courceID='"+ddlCource.SelectedValue+"'";
        DataSet ds = new DataSet();

        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        if (conn.State.ToString() == "Closed")              //如果连接关闭,打开
            conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
        da.Fill(ds);                                        //从数据库中取数据放到DataSet数据集中
        if (conn.State.ToString() == "Open")
            conn.Close();

        ddlTeacher.DataSource = ds.Tables[0].DefaultView;
        ddlTeacher.DataTextField = "teaName";             //下拉列表框每项显示课程名称
        ddlTeacher.DataValueField = "teaID";              //下拉列表框每项的值为课程编号
        ddlTeacher.DataBind();
        GridViewBind();
    }
}
