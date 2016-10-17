<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilterMethodsInDataControl.aspx.cs" Inherits="TreeTraversal.FilterMethodsInDataControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            var infoHtml = "";

            var totalRows = $("#GridView1 tr");
            var dataRows=$(totalRows).slice(1);
            infoHtml += "Total Rows : " + $(dataRows).length + "<br/>";

            var usa = $(totalRows).has(".HighlightCountry");
            infoHtml += "Employees from USA : " + $(usa).length;
            infoHtml += " (";

            var usaEmp = $(usa).map(function () {
                var children = $(this).children();
                return $(children).eq(1).text();
            });
            infoHtml += $(usaEmp).get().join(",");
            infoHtml += ") <br/>";


            var others = $(totalRows).has(".OtherCountry");

            infoHtml += "Employees from other countries : " + $(others).length;
            infoHtml += " (";
            var otherEmp = $(others).map(function () {
                var children = $(this).children();
                return $(children).eq(1).text();
            });
            infoHtml += $(otherEmp).get().join(",");
            infoHtml += ") <br/>";

            if ($("#GridView1 td").is(".HighlightCountry")) {
                infoHtml += "<em>(At least one USA employee record present.)</em>";
            }

            $(totalRows).first().addClass("HeaderRow");

            $(".InfoPanel").html(infoHtml);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Country], [Notes] FROM [Employees]"></asp:SqlDataSource>
        <div class="InfoPanel"></div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" OnDataBound="GridView1_DataBound" OnRowDataBound="GridView1_RowDataBound" Width="100%">
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
