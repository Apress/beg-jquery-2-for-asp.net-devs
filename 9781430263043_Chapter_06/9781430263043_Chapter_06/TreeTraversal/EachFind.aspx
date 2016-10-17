<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EachFind.aspx.cs" Inherits="TreeTraversal.EachFind" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$("li").each(function (index, element) {
            //    $(this).css("font-weight", "bold");
            //    if (index > 0) {
            //        return false;
            //    }
            //});

            var results = $("tr").find(".class1");
            $(results).each(function () {
                $(this).addClass("class2");
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <ul id="root">
            <li>C#</li>
            <li>Windows Forms</li>
            <li>ASP.NET
                <ul>
                    <li class="sublist">Web Forms</li>
                    <li class="sublist">MVC</li>
                    <li class="sublist">Configuration</li>
                </ul>
            </li>
            <li>.NET Framework</li>
            <li>Security</li>
        </ul>

        <table>
            <tr>
                <td>Col 1</td>
                <td class="class1">Col 2</td>
            </tr>
        </table>
    </form>
</body>
</html>
