<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="EffectsAnimations.Animation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#button1").click(function () {
                $("img").stop();
            });

            $("img").each(function () {
                var top = $(this).prev(".Notes").position().top;
                var left = $(this).prev(".Notes").position().left;
                $(this).css("position","absolute").css("top", top).css("left", left);
            });
            $("img").hover(function () {
                var top = $(this).prev(".Notes").position().top;
                var left = $(this).prev(".Notes").position().left;
                $(this).animate({ top: (top + 225) + 'px', height: '0px' }, 5000);
            }, function () {
                var top = $(this).prev(".Notes").position().top;
                var left = $(this).prev(".Notes").position().left;
                $(this).animate({ top: top + 'px',height:'225px' }, 5000);
            });
        });
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
        <input type="button" value="Stop Animation" id="button1" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Notes], [PhotoPath] FROM [Employees]"></asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" CellPadding="6" DataKeyField="EmployeeID" DataSourceID="SqlDataSource1" GridLines="Both" RepeatDirection="Horizontal">
            <ItemStyle Width="225px" />
            <ItemTemplate>
                <asp:Label ID="lblEmployeeID" runat="server" Text='<%# Eval("EmployeeID","#{0}") %>' />
                <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("FirstName") %>' /> &nbsp;
                <asp:Label ID="lblLastName" runat="server" Text='<%# Eval("LastName") %>' />
                <br />
                <div class="Notes" style="height:225px;width:225px;overflow:auto">
                <asp:Label ID="lblNotes" runat="server" Text='<%# Eval("Notes") %>' />
                </div>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/profilepic.jpg" />
            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
