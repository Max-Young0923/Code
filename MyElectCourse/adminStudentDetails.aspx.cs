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

public partial class adminStudentDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userName"] == null)//如果没有登录，转向登录界面
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            if (!IsPostBack)            
                GridViewBind();   //绑定GridView         
        }
    }

    private void GridViewBind()
    {
        string SqlStr = "";
        if (txtstuID.Text.Trim() == "")     //根据是否查询来定义sql语句
        {
            SqlStr = "SELECT student.*,Depart.* FROM Student ,Depart where Student.stuDepart=Depart.departID order by Student.stuDepart";
        }
        else
        {
            SqlStr = "SELECT student.*,Depart.* FROM Student ,Depart where Student.stuDepart=Depart.departID and Student.stuID like '%"+txtstuID.Text.Trim()+"%' order by Student.stuDepart";
        }
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;       //取出连接字符串
        DataSet ds = new DataSet();                             //创建DataSet数据集
        SqlConnection conn = new SqlConnection(connStr);        //创建连接对象
        try
        {            
            if (conn.State.ToString() == "Closed")              //如果连接没有打开，打开连接
                conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
            da.Fill(ds);                                        //为DataSet数据集填充数据

            GridView1.DataSource = ds.Tables[0].DefaultView;    //为GridView指名数据源
            GridView1.DataBind();                               //绑定数据
        }
        catch (Exception ex)
        {
            Response.Write("数据库错误，错误原因：" + ex.Message);
            Response.End();
        }
        finally
        {
            if (conn.State.ToString() == "Open")                //操作完，如果连接处于打开，则关闭连接
                conn.Close();
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (((DropDownList)e.Row.FindControl("ddlDepart")) != null)
        {
            //生成DropDownList的值，绑定数据
            DropDownList ddldepart = (DropDownList)e.Row.FindControl("ddlDepart");            
            string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string SqlStr = "SELECT * from Depart";
            DataSet ds = new DataSet();

            SqlConnection conn = new SqlConnection(connStr);//创建连接对象
            if (conn.State.ToString() == "Closed")//如果连接状态处于关闭状态，打开连接
                conn.Open();
            SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
            da.Fill(ds);//将数据填充到数据集中
            if (conn.State.ToString() == "Open")//如果连接状态处于打开状态，关闭连接
                conn.Close();

            ddldepart.DataSource = ds.Tables[0].DefaultView;//为DropDownList设置数据源
            ddldepart.DataTextField = "departName";//设置显示字段
            ddldepart.DataValueField = "departID";//设置值字段
            ddldepart.DataBind();//绑定数据
            
            //设置DropDownList中选择的项
            ddldepart.SelectedValue = ((HiddenField)e.Row.FindControl("hdfDepart")).Value;
            ddldepart.SelectedItem.Text = ((HiddenField)e.Row.FindControl("hdfDepart")).Value;            
        }

    }
    //GridView控件RowEditing事件
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;  //GridView编辑项索引等于单击行的索引
        GridViewBind();//重新为GridView绑定数据

    }
    //GridView控件RowCancelingEdit事件
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;//GridView编辑项索引为-1，即任何一行都不处于编辑状态
        GridViewBind();//重新为GridView绑定数据

    }
    //GridView控件RowUpdating事件
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //取出编辑行的主键值和修改后的各字段值
        string stuid = GridView1.DataKeys[e.RowIndex].Values[0].ToString();
        string stuName = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName")).Text;
        int stuDepart = int.Parse(((DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlDepart")).SelectedValue);
        int stuGrade = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtGrade")).Text);
        int stuClass = int.Parse(((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtClass")).Text);

        //根据主键和更新后的值，更新到数据库中
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;  
        string SqlStr = "update Student set stuName='" + stuName + "',stuDepart='" + stuDepart + "',stuGrade='" + stuGrade + "',stuClass='" + stuClass + "' where stuID=" + stuid;
        try
        {
            SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
            if (conn.State.ToString() == "Closed")              //如果连接关闭,打开连接
                conn.Open();
            SqlCommand comm = new SqlCommand(SqlStr, conn);
            comm.ExecuteNonQuery();                             //执行修改
            comm.Dispose();
            if (conn.State.ToString() == "Open")                //如果连接打开,关闭连接
                conn.Close();
            GridView1.EditIndex = -1;  
            GridViewBind(); 
        }
        catch (Exception ex)                                    //异常处理
        {
            Response.Write("数据库错误，错误原因：" + ex.Message);
            Response.End();
        }
    }
    //GridView控件RowDeleting事件
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Values[0].ToString(); //取出要删除记录的主键值
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; //取出连接字符串
        string SqlStr = "delete from Student where stuID=" + id;
        try
        {
            SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
            if (conn.State.ToString() == "Closed") 
                conn.Open();
            SqlCommand comm = new SqlCommand(SqlStr, conn);
            comm.ExecuteNonQuery();                             //执行删除
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
   
    protected void imgBtnQuery_Click(object sender, ImageClickEventArgs e)
    {
        GridViewBind();         //根据查询条件，重新对GridView绑定数据
    }
 
}
