<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageMethodSimpleClient.aspx.cs" Inherits="CallingPageMethodsUsingAjax.PageMethodSimpleClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#Button1").click(function (evt) {

                var options = {};
                options.url = "PageMethodSimpleClient.aspx/ConvertSimpleType";
                options.type = "POST";
                options.data = JSON.stringify({ t: $("#TextBox1").val(), scale: $("#DropDownList1").val() });
                options.contentType = "application/json";
                options.dataType = "json";
                options.success = function (data) {
                    if ($("#DropDownList1").val() == "C") {
                        $("#lblResult").html("Value in Fahrenheit = " + data.d);
                    }
                    else {
                        $("#lblResult").html("Value in Celsius = " + data.d);
                    }
                };
                options.error = function (jqXHR, status, err) { alert(status); };
                $.ajax(options);
                evt.preventDefault();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Enter Temperature :"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="C">Celsius</asp:ListItem>
            <asp:ListItem Value="F">Fehrenheit</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Convert" />
        <br />
    
    </div>
        <asp:Label ID="lblResult" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
