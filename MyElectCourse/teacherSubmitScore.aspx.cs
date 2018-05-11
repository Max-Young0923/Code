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

public partial class teacherSubmitScore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            imgBtnSubmitScore.Attributes.Add("OnClick", "javascript:return confirm('您只能提交一次成绩，确实要提交吗？')");        //成绩只能提交一次，给出提示
            BindDDL();      //初始化课程下拉列表框
            BindGridView(); //根据下拉列表框选择的课程显示选修该门课程的学生
        }
    }

    private void BindDDL()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;   //取出连接字符串
        string SqlStr = "SELECT distinct cource.courceID,cource.courceName from Elect,Cource where Elect.courceID=Cource.courceID and Elect.teaID='"+Session["userName"].ToString()+"'";
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

    protected void kcddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGridView();
    }

    //为GridView控件绑定数据
    private void BindGridView()
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        string ValidateStr = "select max(Score) as score from Elect where courceID='" + ddlCource.SelectedValue + "' and teaID='"+Session["userName"].ToString()+"'";
        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        if (conn.State.ToString() == "Closed")              //连接如果关闭，打开
            conn.Open();
        SqlCommand cmd = new SqlCommand(ValidateStr,conn);  //创建操作数据库对象
        SqlDataReader sdr = cmd.ExecuteReader();            //执行查询
        if (sdr.Read())
        {
            if ((int.Parse(sdr["score"].ToString())) > 0)   //判断成绩是否提交
            {
                GridView1.Visible = false;
                Response.Write("<script language=javascript>alert('该课程成绩已经提交，不能再次提交！')</script>");
            }
            else
            {
                sdr.Close();
                GridView1.Visible = true;
                string SqlStr = "SELECT student.*,Elect.* FROM Student ,Elect where Student.stuID=Elect.stuID and Elect.courceID='" + ddlCource.SelectedValue + "'order by Student.stuID, Student.stuGrade,Student.stuClass";
                DataSet ds = new DataSet();
                try
                {
                    if (conn.State.ToString() == "Closed")          //连接如果关闭，打开
                        conn.Open();
                    SqlDataAdapter da = new SqlDataAdapter(SqlStr, conn);
                    da.Fill(ds);                                    //向DataSet数据集填充数据

                    GridView1.DataSource = ds.Tables[0].DefaultView;//为GridView指名数据源
                    GridView1.DataBind();                           //绑定数据
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
        else
        {
            if (conn.State.ToString() == "Open")            //如果连接打开，关闭
                conn.Close();
        }
    }
    
    //提交成绩事件
    protected void imgBtnSubmitScore_Click(object sender, ImageClickEventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(connStr);    //创建连接对象
        string strUpdate = "";
        int score;
        string stuID = "";
        string courceID = ddlCource.SelectedValue;      //课程编号
        int flag = 0;                                     //标志
        string teaID = Session["userName"].ToString();
        if (conn.State.ToString() == "Closed")          //连接如果关闭，打开
            conn.Open();
        int i;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            score = int.Parse(((TextBox)GridView1.Rows[i].FindControl("txtScore")).Text.Trim());//取出学生成绩
            stuID = GridView1.Rows[i].Cells[0].Text;
            strUpdate = "update Elect set Score=" + score + " where stuID='" + stuID + "' and courceID='" + courceID + "' and teaID='" + teaID + "'";
            try
            {
                SqlCommand cmd = new SqlCommand(strUpdate, conn);//创建Command对象
                flag = cmd.ExecuteNonQuery();                   //执行添加成绩操作
            }
            catch (Exception ex)                                //异常处理
            {
                Response.Write("数据库错误，错误原因：" + ex.Message);
                Response.End();
            }
        }
        if (conn.State.ToString() == "Open")            //如果连接打开，关闭
            conn.Close();
        if ((flag == 1) && (i == GridView1.Rows.Count))
        {
            Response.Write("成功录入学生成绩！此后将不能再修改！");
        }
    }
}