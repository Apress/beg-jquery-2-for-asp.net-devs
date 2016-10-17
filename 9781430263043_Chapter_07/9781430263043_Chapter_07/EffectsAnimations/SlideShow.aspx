<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SlideShow.aspx.cs" Inherits="EffectsAnimations.SlideShow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        var index = 0;
        var panels = null;
        var visibleTime = 2000;
        var animationTime = 1000;

        $(document).ready(function () {

            panels = $(".Panel").get();
            $(".Panel").hide();
            $(panels[0]).show();

            setTimeout(ShowSlide, visibleTime);

        });

        function ShowSlide() {
            $(panels[index]).hide(animationTime, function () {
                index++;
                if (index >= panels.length) {
                    index = 0;
                }
                $(panels[index]).show(animationTime, function () {
                    setTimeout(ShowSlide, visibleTime);
                });
            });
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [Notes] FROM [Employees]"></asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="Panel">
                    <span><%# Eval("TitleOfCourtesy") %></span> <span><%# Eval("FirstName") %></span> <span><%# Eval("LastName") %></span>
                    <br />
                    <span><%# Eval("Title") %></span>
                    <br />
                    <span><%# Eval("Notes") %></span>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
