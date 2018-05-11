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

public partial class teacherQueryElect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {            
            BindDDL();
        }
    }

    //为课程名称下拉列表框绑定数据
    private void BindDDL()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "SELECT distinct cource.courceID,cource.courceName from Elect,Cource where Elect.courceID=Cource.courceID and Elect.teaID='" + Session["userName"].ToString() + "'";
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
}
