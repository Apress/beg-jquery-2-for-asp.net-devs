<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewToCSV.aspx.cs" Inherits="GridViewRecipes.GridViewToCSV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#TextBox1").hide();

            $("#Button1").click(function (evt) {
                var rows = [];
                var str = '';

                $("#GridView1").find("tr").each(function () {
                    //header row
                    if ($(this).find("th").length) {
                        var headerArray = [];
                        $(this).find("th").each(function () {
                            str = $(this).text().replace(/"/g, '""');
                            headerArray.push('"' + str + '"');
                        });
                        rows.push(headerArray.join(','));
                    } else {
                        //data rows
                        var dataArray = [];
                        $(this).find("td").each(function () {
                            str = $(this).text().replace(/"/g, '""');
                            dataArray.push('"' + str + '"');
                        });
                        rows.push(dataArray.join(','));
                    }
                });
                var csv = rows.join('\n');
                $("#TextBox1").val(csv);
                $("#TextBox1").slideDown("slow");
                evt.preventDefault();
            });
        });
    </script>
</head>
<body style="padding:10px">
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Text="Export to CSV" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title], [Country] FROM [Employees]"></asp:SqlDataSource>
        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Columns="50" Rows="10" Width="99%"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
