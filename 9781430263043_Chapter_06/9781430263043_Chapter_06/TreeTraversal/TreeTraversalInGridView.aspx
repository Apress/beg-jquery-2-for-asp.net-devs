<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeTraversalInGridView.aspx.cs" Inherits="TreeTraversal.TreeTraversalInGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#GridView1 td").hover(function () {
                $(this).parent().addClass("Highlight");
            }, function () {
                $(this).parent().removeClass("Highlight");
            });

            if ($("#GridView1 input:submit[value='Update']").length > 0) {
                var cell = $("#GridView1 input:submit[value='Update']").parent();
                var siblings = $(cell).siblings();
                $(siblings).each(function () {
                    $(this).addClass("EditCell");
                });

                var row = $(cell).parent();
                $(row).nextAll("tr").addClass("NonEditableRow");
                $(row).prevAll("tr").addClass("NonEditableRow");
            }

            $("#GridView1 input:submit[value='Update']").click(function (evt) {
                var row = $(evt.target).parent().parent();
                var children = $(row).children();
                $(children).each(function () {
                    if ($("input:text", this).val() == "") {
                        $("input:text", this).addClass("Error");
                        $(this).closest("td").removeClass("EditCell");
                        $(this).closest("td").addClass("ErrorCell");
                        evt.preventDefault();
                    }
                    else {
                        $("input:text", this).removeClass("Error");
                        $(this).closest("td").removeClass("ErrorCell");
                    }
                });
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Country]) VALUES (@LastName, @FirstName, @Country)" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Country] FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Country] = @Country WHERE [EmployeeID] = @EmployeeID">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            </Columns>
        </asp:GridView>



    </form>
</body>
</html>
