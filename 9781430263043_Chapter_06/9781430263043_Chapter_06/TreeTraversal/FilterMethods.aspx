<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilterMethods.aspx.cs" Inherits="TreeTraversal.FilterMethods" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            alert($("li").first().text());

            //alert($("li").last().text());

            //alert($("li").eq(3).text());

            //alert($("li").not(".sublist").length);

            //alert($("li").is(".sublist1"));

            //alert($("li").slice(0,2).text());

            //alert($("li").filter(".sublist").length);

            //var result = $("li").map(function () {
            //    if ($(this).children().length == 0) {
            //        return $(this).text();
            //    }
            //});

            //alert(result.get().join("|"));

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <ul id="root">
            <li>C#</li>
            <li>Windows Forms</li>
            <li id="level1">ASP.NET
                <ul id="level2">
                    <li id="level3"  class="sublist">Web Forms</li>
                    <li  class="sublist">MVC</li>
                    <li  class="sublist">Configuration</li>
                </ul>
            </li>
            <li>.NET Framework</li>
            <li>Security</li>
        </ul>
    </form>
</body>
</html>
