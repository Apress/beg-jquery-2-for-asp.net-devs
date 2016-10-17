<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppendAppendTo.aspx.cs" Inherits="ManipulatingDOM.AppendAppendTo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#table1").append("<tr><td>Hello World!</td></tr>");
            $("<tr><td>Hello World!</td></tr>").appendTo("#table1");

            var clonedElements = $("#table1").clone();
            $("#div1").append(clonedElements);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table id="table1"></table>

        <div id="div1"></div>
    </form>
</body>
</html>
