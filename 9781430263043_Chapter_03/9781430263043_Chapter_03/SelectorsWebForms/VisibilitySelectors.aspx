<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VisibilitySelectors.aspx.cs" Inherits="SelectorsWebForms.VisibilitySelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("td").click(function (evt) {
                $(evt.target).parent().css("display", "none");
                var visibleCount = $("tr:visible").length;
                var hiddenCount = $("tr:hidden").length;
                $("#Label1").html( visibleCount + " rows are visible.<br/>" + hiddenCount + " rows are hidden.");
            });

            $("#Button1").click(function (evt) {
                $("tr").css("display", "block");
                var visibleCount = $("tr:visible").length;
                var hiddenCount = $("tr:hidden").length;
                $("#Label1").html(visibleCount + " rows are visible.<br/>" + hiddenCount + " rows are hidden.");
                evt.preventDefault();
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Show All" />
        <br />
        <br>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Country] FROM [Employees]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
