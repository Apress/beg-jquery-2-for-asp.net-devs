<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeMethods.aspx.cs" Inherits="TreeTraversal.TreeMethods" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            //$("#root").children().each(function () {
            //    alert($(this).text());
            //});

            //$("#level2").parents().each(function () {
            //    alert(this.tagName);
            //});

            //$("#aspnet").parents().each(function () {
            //    alert(this.tagName);
            //});

            //alert($("#level2").closest("li").text());

            //$("#level1").nextAll().each(function () { 
            //    alert($(this).text()); 
            //});

            //alert($("#level1").next().text());

            //alert($("#level1").next().text());

            //alert($("#level1").prevAll().text());

            $("#level3").closest("ul").each(function () {
                alert($(this).text());
            });

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
                    <li id="level3">Web Forms</li>
                    <li>MVC</li>
                    <li>Configuration</li>
                </ul>
            </li>
            <li>.NET Framework</li>
            <li>Security</li>
        </ul>
    </form>
</body>
</html>
