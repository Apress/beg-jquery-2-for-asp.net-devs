<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="AutocompleteTextBoxDemo.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#TextBox1").on("input", function (evt) {
                var options = {};
                options.url = "WebForm1.aspx/gettitles";
                options.data = JSON.stringify({title:$(evt.target).val()});
                options.type = "POST";
                options.dataType = "json";
                options.contentType = "application/json";
                options.success = function (result) {
                    $("#titles").empty();
                    for (var i = 0; i < result.d.length; i++) {
                        $("#titles").append("<option>" + result.d[i] + "</option>");
                    }
                };
                options.error = function (xhr, status, err) { alert(err); };
                $.ajax(options);
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Enter Title :"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" list="titles"></asp:TextBox>
        <datalist id="titles"></datalist>
    </form>
</body>
</html>
