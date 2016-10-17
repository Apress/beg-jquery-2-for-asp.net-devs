<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DialogHost.aspx.cs" Inherits="CSSFeatures.DialogHost" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Panel1").addClass("dialogHidden");

            $("#Button1").click(function (evt) {
                var top = 0;
                var left = 0;

                if ($("#Panel1").hasClass("dialogHidden")) {
                    $("#Panel1").removeClass("dialogHidden");
                }
                $("#Panel1").addClass("dialogVisible");

                var windowHeight = $(window).height();
                var windowWidth = $(window).width();

                var dialogHeight = $("#Panel1").outerHeight();
                var dialogWidth = $("#Panel1").outerWidth();

                top = ((windowHeight - dialogHeight) / 2 + $(window).scrollTop()) + "px";
                left = ((windowWidth - dialogWidth) / 2 + $(window).scrollLeft()) + "px";

                $("#Panel1").css("top", top);
                $("#Panel1").css("left", left);

                $("#backgroundDiv").addClass("dialogBackground")
                   .height(windowHeight)
                   .width(windowWidth)
                   .css("display", "block");

                evt.preventDefault();
            });

            $(window).resize(function () {
                if ($("#Panel1").hasClass("dialogVisible")) {
                    $("#Button1").click();
                }
            });

            $("#Panel1 input:submit[value='Cancel']").click(function (evt) {
                if ($("#backgroundDiv").hasClass("dialogBackground")) {
                    $("#backgroundDiv").removeClass("dialogBackground").css("display", "none");
                }
                if ($("#Panel1").hasClass("dialogVisible")) {
                    $("#Panel1").removeClass("dialogVisible");
                }
                $("#Panel1").addClass("dialogHidden");
                evt.preventDefault();
            });



        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text. This is sample text.
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Show Dialog" />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <div id="backgroundDiv"></div>

<asp:Panel ID="Panel1" runat="server" ClientIDMode="Static">
    <asp:Label ID="Label1" runat="server" Text="Enter your name :"></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button2" runat="server" Text="OK" Width="75px" OnClick="Button2_Click" />
    &nbsp;&nbsp;
    <asp:Button ID="Button3" runat="server" Text="Cancel" Width="75px" />
</asp:Panel>



    </form>
</body>
</html>
