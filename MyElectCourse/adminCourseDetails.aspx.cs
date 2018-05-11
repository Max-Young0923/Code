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

public partial class adminCourseDetails : System.Web.UI.Page
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
        string SqlStr = "SELECT Cource.*,Teacher.* FROM Cource,Teacher where Cource.teaID=Teacher.teaID order by Teacher.teaID";
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
        if (((DropDownList)e.Row.FindControl("ddlTeacher")) != null)
        {
            DropDownList ddlteacher = (DropDownList)e.Row.FindControl("ddlTeacher");

            //  生成 DropDownList 的值，绑定数据
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string SqlStr = "SELECT * from Teacher";
            DataSet ds = new DataSet();

            SqlConnection conn = new SqlConnection(connStr);
            if (conn.State.ToString() == "Closed") conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
            da.Fill(ds);
            if (conn.State.ToString() == "Open") conn.Close();

            ddlteacher.DataSource = ds.Tables[0].DefaultView;
            ddlteacher.DataTextField = "teaName";
            ddlteacher.DataValueField = "teaID";
            ddlteacher.DataBind();
            //

            //  选中 DropDownList
            ddlteacher.SelectedValue = ((HiddenField)e.Row.FindControl("hdfTeacher")).Value;
            ddlteacher.SelectedItem.Text = ((HiddenField)e.Row.FindControl("hdfTeacher")).Value;
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
        string courceID = GridView1.DataKeys[e.RowIndex].Values[0].ToString();   //取出编辑行的主键值
        string oldTeaID = GridView1.DataKeys[e.RowIndex].Values[1].ToString();
        string teaID = ((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlTeacher")).SelectedValue;   //取出修改后的值
        string courceName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
        string courceTime = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtTime")).Text;
        string courceAddress = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtAddress")).Text;        
        
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string SqlStr = "update Cource set CourceName='" + courceName + "',teaID='" + teaID + "',courceTime='" + courceTime + "',courceAddress='" + courceAddress + "' where courceID='" + courceID + "' and teaID='" + oldTeaID + "'";

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
        string teaID = GridView1.DataKeys[e.RowIndex].Values[1].ToString();
        string connStr = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString; //取出连接字符串
        string SqlStr = "delete from Cource where courceID=" + id+" and teaID="+teaID;

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
   
    //添加课程事件
    protected void imgBtnAdd_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);//创建连接对象
        SqlCommand insertCmd = new SqlCommand("insert into Cource(courceID,teaID,courceName,courceTime,courceAddress,courceInfo) values(@courceID,@teaID,@courceName,@courceTime,@courceAddress,@courceInfo)", conn);
        insertCmd.Parameters.Add("@courceID", SqlDbType.VarChar, 20);//设置参数
        insertCmd.Parameters.Add("@teaID", SqlDbType.VarChar, 20);
        insertCmd.Parameters.Add("@courceName", SqlDbType.VarChar, 100);
        insertCmd.Parameters.Add("@courceTime", SqlDbType.VarChar, 20);
        insertCmd.Parameters.Add("@courceAddress", SqlDbType.VarChar, 50);
        insertCmd.Parameters.Add("@courceInfo", SqlDbType.Text);
        insertCmd.Parameters["@courceID"].Value = txtCourceID.Text; //为参数赋值
        insertCmd.Parameters["@teaID"].Value = ddlTeacherName.SelectedValue;
        insertCmd.Parameters["@courceName"].Value = txtCourceName.Text;
        insertCmd.Parameters["@courceTime"].Value = txtTime.Text;
        insertCmd.Parameters["@courceAddress"].Value = txtAddress.Text;
        insertCmd.Parameters["@courceInfo"].Value = txtCourceInformation.Text;
        try
        {
            conn.Open();
            int flag = insertCmd.ExecuteNonQuery(); //执行添加
            if (flag > 0) //如果添加成功
            {
                lblMessage.Text = "成功添加课程信息！";
            }
            else //如果添加失败
            {
                lblMessage.Text = "添加课程信息失败，查看输入是否正确！";
            }
        }
        catch (System.Exception ee)
        {
            Response.Write("<script language=javascript>alert('" + ee.Message.ToString() + "')</script>");
        }
        finally
        {
            conn.Close();
            GridViewBind();
        }
    }
    protected void imgBtnReset_Click(object sender, ImageClickEventArgs e)
    {
        txtCourceID.Text = "";
        txtCourceName.Text = "";
        txtTime.Text = "";
        txtAddress.Text = "";
        txtCourceInformation.Text = "";
    }
 
}
