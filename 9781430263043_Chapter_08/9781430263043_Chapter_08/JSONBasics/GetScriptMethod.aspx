<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetScriptMethod.aspx.cs" Inherits="JSONBasics.GetScriptMethod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.getScript("Scripts/AdScript.js", function () {
                alert("Ad script executed successfully!");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="adspace">
    
    </div>
    </form>
</body>
</html>
