<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewMouseEvents.aspx.cs" Inherits="MouseEvents.GridViewEditUpdateCancel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>


    <script type="text/javascript">
        var currentRow=null;

        $(document).ready(function () {
            $(".menu").css("display", "none");
            $("#GridView1").contextmenu(function () { return false; });

            $("#GridView1 tr:gt(0)").hover(function () {
                $(this).addClass("highlightedRow");
            }, function () {
                $(this).removeClass("highlightedRow");

            });

            $(".menuItem").mouseenter(function (evt) {
                $(evt.target).addClass("highlightedMenuItem");
            });

            $(".menuItem").mousemove(function (evt) {
                $(evt.target).addClass("highlightedMenuItem");
            });

            $(".menuItem").mouseleave(function (evt) {
                $(evt.target).removeClass("highlightedMenuItem");
            });


            $("#GridView1").mousedown(function (evt) {
                if (evt.which == 3) {
                    $(".menu").css("left", evt.pageX)
                              .css("top", evt.pageY);
                    $(".menu").css("display", "block");
                    currentRow = $(evt.target).parent();
                }
            });


            $(document).click(function (evt) {
                $(".menu").css("display", "none");
            });

            $(".menuItem").click(function (evt) {
                if (evt.currentTarget.id == "bold") {
                    $(currentRow).removeClass("italicRow")
                                 .removeClass("underlineRow")
                                 .addClass("boldRow");
                }
                if (evt.currentTarget.id == "italic") {
                    $(currentRow).removeClass("boldRow")
                                 .removeClass("underlineRow")
                                 .addClass("italicRow");
                }
                if (evt.currentTarget.id == "underline") {
                    $(currentRow).removeClass("boldRow")
                                 .removeClass("italicRow")
                                 .addClass("underlineRow");
                }
                $(".menu").css("display", "none");
                evt.preventDefault();
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Country]) VALUES (@LastName, @FirstName, @Country)" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Country] FROM [Employees] ORDER BY [EmployeeID]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Country] = @Country WHERE [EmployeeID] = @EmployeeID">
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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            </Columns>
        </asp:GridView>

         <ul class="menu">
            <li>
                <asp:LinkButton ID="bold" CssClass="menuItem" runat="server">Show Bold</asp:LinkButton></li>
            <li>
                <asp:LinkButton ID="italic" CssClass="menuItem" runat="server">Show Italics</asp:LinkButton></li>
            <li>
                <asp:LinkButton ID="underline" CssClass="menuItem" runat="server">Show Underlined</asp:LinkButton></li>
        </ul>

    </form>
</body>
</html>
