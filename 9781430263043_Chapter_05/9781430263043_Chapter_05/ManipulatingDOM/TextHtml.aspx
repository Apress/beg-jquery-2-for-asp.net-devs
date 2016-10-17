<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TextHtml.aspx.cs" Inherits="ManipulatingDOM.TextHtml" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert($("#container").text());
            //$("#container").text("Hello Universe!")
            //alert($("#container").text());
            //$("#container").text("<strong>Hello Universe!</strong>")
            //alert($("#container").text());

            alert($("#container").html());
            $("#container").text("Hello Universe!")
            alert($("#container").html());
            $("#container").html("<strong>Hello Universe!</strong>")
            alert($("#container").html());

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container">
        <strong>Hello</strong> <em>World!</em>
    </div>
    </form>
</body>
</html>
