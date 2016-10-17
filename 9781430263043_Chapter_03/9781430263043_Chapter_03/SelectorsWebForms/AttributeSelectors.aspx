<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttributeSelectors.aspx.cs" Inherits="SelectorsWebForms.AttributeSelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#Button1").click(function (evt) {
                switch ($("#DropDownList1").val()) {
                    case "A":
                        $("#GridView1 tr a").parent().css("display", "block");
                        break;
                    case "P":
                        $("#GridView1 tr a[href *= 'products/']").parent().css("display", "block");
                        $("#GridView1 tr a[href |= 'Paper']").parent().css("display", "none");
                        $("#GridView1 tr a[href $= '-comp.aspx']").parent().css("display", "none");
                        break;
                    case "WP":
                        $("#GridView1 tr a[href *= 'products/']").parent().css("display", "none");
                        $("#GridView1 tr a[href |= 'Paper']").parent().css("display", "block");
                        $("#GridView1 tr a[href $= '-comp.aspx']").parent().css("display", "none");
                        break;
                    case "C":
                        $("#GridView1 tr a[href *= 'products/']").parent().css("display", "none");
                        $("#GridView1 tr a[href |= 'Paper']").parent().css("display", "none");
                        $("#GridView1 tr a[href $= '-comp.aspx']").parent().css("display", "block");
                        break;
                }
                evt.preventDefault();
            })
        })
    </script>

</head>
<body>
    <form id="form1" runat="server">
           <table cellpadding="5">
            <tr>
                <td>
                    <b>Show : </b> </td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem Value="A">All Downloads</asp:ListItem>
                        <asp:ListItem Value="P">Products</asp:ListItem>
                        <asp:ListItem Value="WP">White Papers</asp:ListItem>
                        <asp:ListItem Value="C">Components</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Show" />
                </td>
            </tr>
        </table>
        <br />
    
        <asp:GridView ID="GridView1" runat="server" CellPadding="10" 
            ForeColor="#333333" AutoGenerateColumns="False">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="URL" DataTextField="Title" 
                    HeaderText="Downloads" />
            </Columns>
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>

    </form>
</body>
</html>
