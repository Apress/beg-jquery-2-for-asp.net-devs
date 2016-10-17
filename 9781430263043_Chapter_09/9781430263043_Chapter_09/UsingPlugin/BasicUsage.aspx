<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicUsage.aspx.cs" Inherits="UsingPlugin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script src="Scripts/jquery.powertip.js"></script>

    <link href="jquery.powertip.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("a").powerTip();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [Country] FROM [Employees] ORDER BY [EmployeeID]"></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:TemplateField HeaderText="FirstName">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("FirstName", "#") %>' Text='<%# Eval("FirstName") %>' data-powertip='<%# Eval("Title") + " (" + Eval("Country") + ")" %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("LastName", "#") %>' Text='<%# Eval("LastName") %>' data-powertip='<%# Eval("Title") + " (" + Eval("Country") + ")" %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
