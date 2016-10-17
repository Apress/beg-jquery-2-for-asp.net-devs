<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicSelectors.aspx.cs" Inherits="SelectorsWebForms.BasicSelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnSetFont").click(function (evt) {
                var target = $("#txtTarget").val();
                var fontName=$("#txtFontName").val();
                var fontSize=$("#txtFontSize").val();

                $(target).css("font-family", fontName).css("font-size", fontSize);

                evt.preventDefault();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblFontName" runat="server" Text="Font Name : "></asp:Label>
        <asp:TextBox ID="txtFontName" runat="server" Columns="5"></asp:TextBox>
        <asp:Label ID="lblFontSize" runat="server" Text="Font Size : "></asp:Label>
        <asp:TextBox ID="txtFontSize" runat="server" Columns="5"></asp:TextBox>
        <asp:Label ID="lblTarget" runat="server" Text="Apply Font to : "></asp:Label>
        <asp:TextBox ID="txtTarget" runat="server" Columns="5"></asp:TextBox>

        <asp:Button ID="btnSetFont" runat="server" Text="Set Font" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="Solid" CellPadding="6" SelectMethod="SelectEmployees" ItemType="SelectorsWebForms.Models.Employee">
            <AlternatingRowStyle CssClass="AlternateRow" />
            <Columns>
                <asp:TemplateField HeaderText="Employee Details">
                    <ItemTemplate>
                        <div>#<%# Item.EmployeeID %></div>
                        <asp:Label ID="Label1" runat="server" Text="<%# Item.FirstName %>"></asp:Label>
                        <asp:Label ID="Label2" runat="server" Text="<%# Item.LastName %>"></asp:Label>
                        <p>
                            <%# Item.Notes %>
                        </p>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle CssClass="Row" />
        </asp:GridView>
    </form>
</body>
</html>
