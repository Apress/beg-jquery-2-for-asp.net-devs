<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WaitIndicator.aspx.cs" Inherits="EffectsAnimations.WaitIndicator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        var handle;

        $(document).ready(function () {
            $("#Panel1").hide();

            $("#Button1").click(function (evt) {
                $("input:submit").prop("disabled", true);
                handle=setTimeout(Wait, 1000);
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "ProcessingHandler.ashx");
                $(xhr).on("load", function (evt) {
                    clearTimeout(handle);
                    $("#Panel1").hide();
                    $("input:submit").prop("disabled", false);
                    alert(evt.target.responseText);
                });
                xhr.send();
                evt.preventDefault();
            });

        });

        function Wait() {
            $("#Panel1").fadeToggle("slow");
            handle=setTimeout(Wait, 1000);
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Start Processing" />
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Wait...Processing your request..." Font-Bold="True" Font-Names="Arial" Font-Size="30px" ForeColor="Red"></asp:Label>
        </asp:Panel>
    </form>
</body>
</html>
