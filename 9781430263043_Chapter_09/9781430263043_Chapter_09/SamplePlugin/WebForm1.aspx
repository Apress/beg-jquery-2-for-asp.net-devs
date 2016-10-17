<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SamplePlugin.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="jquery.myplugin.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script src="Scripts/jquery.myplugin.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var options = { className: "myplugin2", country: "UK" };
            $(".firstname").myPlugin("set",options)
                           .css("text-decoration", "underline");

            $("#button1").click(function () {
                $(".firstname").myPlugin("reset");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- <input type="button" value="Reset" id="button1" />
        <br /><br /> -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Country] FROM [Employees]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                    <ItemTemplate>
                        <asp:Label ID="lblFirstName" runat="server" CssClass="firstname" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
