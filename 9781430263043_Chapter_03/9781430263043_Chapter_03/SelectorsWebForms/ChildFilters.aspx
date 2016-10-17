<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChildFilters.aspx.cs" Inherits="SelectorsWebForms.ChildFilters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        var counter = 1;

        $(document).ready(function () {
            $("#Button1").click(function (event) {
                counter = 1;
                $("#GridView1 tr").removeClass("HighlightedRow");
                $("#GridView1 tr:first-child").addClass("HighlightedRow");
                event.preventDefault();
            });
            
            $("#Button2").click(function (event) {
                if (counter > 1) {
                    counter--;
                }
                $("#GridView1 tr").removeClass("HighlightedRow");
                $("#GridView1 tr:nth-child(" + counter + ")").addClass("HighlightedRow");
                event.preventDefault();
            });
            
            $("#Button3").click(function (event) {
                if (counter < $("#GridView1 tr").length) {
                    counter++;
                }
                $("#GridView1 tr").removeClass("HighlightedRow");
                $("#GridView1 tr:nth-child(" + counter + ")").addClass("HighlightedRow");
                event.preventDefault();
            });
            
            $("#Button4").click(function (event) {
                counter = $("#GridView1 tbody tr").length;
                $("#GridView1 tr").removeClass("HighlightedRow");
                $("#GridView1 tr:last-child").addClass("HighlightedRow");
                event.preventDefault();
            });

        })


    </script>
    
    <style type="text/css">
        .HighlightedRow
        {
            background-color:navy;
            color:White;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName] FROM [Employees]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" CellPadding="5">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" BackColor="#CCCCCC" Font-Bold="True" 
            ForeColor="#666666" Text="&lt;&lt;" Width="30px" />
        <asp:Button ID="Button2" runat="server" BackColor="#CCCCCC" Font-Bold="True" 
            ForeColor="#666666" Text="&lt;" Width="30px" />
        <asp:Button ID="Button3" runat="server" BackColor="#CCCCCC" Font-Bold="True" 
            ForeColor="#666666" Text="&gt;" Width="30px" />
        <asp:Button ID="Button4" runat="server" BackColor="#CCCCCC" Font-Bold="True" 
            ForeColor="#666666" Text="&gt;&gt;" Width="30px" />

    </form>
</body>
</html>
