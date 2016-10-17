<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JsonDotNet.aspx.cs" Inherits="JSONBasics.JsonDotNet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            jQuery.ajax();
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Click" OnClick="Button1_Click" />
    </form>
</body>
</html>
