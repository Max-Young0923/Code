<%@ Control Language="C#" AutoEventWireup="true" CodeFile="left.ascx.cs" Inherits="left" %>
<TABLE id="Table1"  cellSpacing="0" cellPadding="0" width="80" border="0">
	<TR>
		<TD vAlign="top" align=center >
            <asp:Label ID="Label1" runat="server" Font-Names="隶书" Font-Size="12pt"></asp:Label><br /><br />
            <asp:TreeView ID="TreeView1" runat="server" Font-Size="10pt"  Width="120px" 
                onselectednodechanged="TreeView1_SelectedNodeChanged">
                <Nodes>
                    <asp:TreeNode Text="学生管理" Value="学生管理">
                        <asp:TreeNode NavigateUrl="~/adminStudentAdd.aspx" Target="frameMain" Text="添加学生" Value="添加学生">
                        </asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/adminStudentDetails.aspx" Target="frameMain" Text="学生维护"
                            Value="学生维护"></asp:TreeNode>
                        <asp:TreeNode Target="frameMain" Text="成绩管理" Value="成绩管理" NavigateUrl="~/adminStudentScore.aspx"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="教师管理" Value="教师管理">
                        <asp:TreeNode NavigateUrl="~/adminTeacherAdd.aspx" Target="frameMain" Text="添加教师" Value="添加教师">
                        </asp:TreeNode>
                        <asp:TreeNode NavigateUrl="~/adminTeacherDetails.aspx" Target="frameMain" Text="教师维护"
                            Value="教师维护"></asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode Text="课程管理" Value="课程管理">
                        <asp:TreeNode NavigateUrl="~/adminCourseDetails.aspx" Target="frameMain" Text="课程维护" Value="课程维护">
                        </asp:TreeNode>
                    </asp:TreeNode>
                    <asp:TreeNode NavigateUrl="~/ModifyPwd.aspx" Target="frameMain" Text="修改密码" Value="修改密码">
                    </asp:TreeNode>
                    <asp:TreeNode Text="退出系统" NavigateUrl="~/Login.aspx"  Value="退出系统"></asp:TreeNode>
                </Nodes>
            </asp:TreeView>
</TD>
	</TR>
</TABLE>

