<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoBar.aspx.cs" Inherits="BrowserDocumentEvents.InfoBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $(window).scroll(function () {
                if (GetCookieValue("ShowInfoBar") == null) {
                    $("#infobarDiv").css("marginTop", $(window).scrollTop());
                }
            });

            $(window).resize(function () {
                if ($(window).width() < 300) {
                    $("#infobarDiv").css('display', 'none');
                }
                else {
                    $("#infobarDiv").css('display', 'block');
                }
            });

            $("#closeBtn").click(function (e) {
                $("#infobarDiv").slideUp('slow');
                document.cookie = "ShowInfoBar=false;path=/";
                e.preventDefault();
            });

            if (GetCookieValue("ShowInfoBar") == null) {
                $("#infobarDiv").css('display', 'block');
            }
            else {
                $("#infobarDiv").css('display', 'none');
            }

        });

        var GetCookieValue = function (name) {
            var cookieName = name + "=";
            var cookieArray = document.cookie.split(';');
            for (var i = 0; i < cookieArray.length; i++) {
                var c = cookieArray[i];
                while (c.charAt(0) == ' ')
                    c = c.substring(1, c.length);
                if (c.indexOf(cookieName) == 0)
                    return c.substring
                    (cookieName.length, c.length);
            }
            return null;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="infobarDiv" runat="server" CssClass="InfoBar">
            This is InfoBar developed in ASP.NET and jQuery.
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
        </asp:Panel>
        <p>
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        This is sample text. This is sample text. This is sample text. 
        </p>
    </form>
</body>
</html>
