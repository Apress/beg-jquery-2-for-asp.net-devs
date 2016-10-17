<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicFilters.aspx.cs" Inherits="SelectorsWebForms.BasicFilters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#Button1").click(function (evt) {
                var target = $("#DropDownList1").val();
                var index = $("#TextBox1").val();
                $(".Highlight").removeClass("Highlight");

                switch (target) {
                    case "FR":
                        $("tr:first").addClass("Highlight");
                        break;
                    case "LR":
                        $("tr:last").addClass("Highlight");
                        break;
                    case "OD":
                        $("tr:odd").addClass("Highlight");
                        break;
                    case "EV":
                        $("tr:even").addClass("Highlight");
                        break;
                    case "LT":
                        $("tr:lt(" + index + ")").addClass("Highlight");
                        break;
                    case "GT":
                        $("tr:gt(" + index + ")").addClass("Highlight");
                        break;
                    case "EQ":
                        $("tr:eq(" + index + ")").addClass("Highlight");
                        break;
                }
               
                evt.preventDefault();
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Mark Rows :"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="FR">First Row</asp:ListItem>
            <asp:ListItem Value="LR">Last Row</asp:ListItem>
            <asp:ListItem Value="OD">Odd</asp:ListItem>
            <asp:ListItem Value="EV">Even</asp:ListItem>
            <asp:ListItem Value="LT">Less Than</asp:ListItem>
            <asp:ListItem Value="GT">Greater Than</asp:ListItem>
            <asp:ListItem Value="EQ">Equal</asp:ListItem>
        </asp:DropDownList>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" Columns="5"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Mark" />
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" SelectMethod="SelectEmployees">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                <asp:BoundField DataField="Title" HeaderText="Designation" />
                <asp:BoundField DataField="Country" HeaderText="Country" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
