<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Attributes.aspx.cs" Inherits="AttributesProperties.Attributes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#DropDownList1").change(function () {
                var selectedIndex = $("#DropDownList1").prop("selectedIndex");
                if (selectedIndex != 0) {
                    $("#audio1").attr("src", "media/" + $("#DropDownList1").val());
                    $("#audio1").get(0).play();
                }
            });

            $("#CheckBox1").click(function () {
                if ($("#CheckBox1").prop("checked")) {
                    $("#audio1").attr("controls", "controls");
                }
                else {
                    $("#audio1").removeAttr("controls");
                }
            });

            $("#CheckBox2").click(function () {
                if ($("#CheckBox2").prop("checked")) {
                    $("#audio1").attr("loop", "loop");
                }
                else {
                    $("#audio1").removeAttr("loop");
                }
            });

            $("#CheckBox3").click(function () {
                if ($("#CheckBox3").prop("checked")) {
                    $("#audio1").attr("muted", "muted");
                }
                else {
                    $("#audio1").removeAttr("muted");
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Select file to play :"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Please Select</asp:ListItem>
            <asp:ListItem>Audio1.mp3</asp:ListItem>
            <asp:ListItem>Audio2.mp3</asp:ListItem>
            <asp:ListItem>Audio3.mp3</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Show Controls" />
        &nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox2" runat="server" Text="Play in Loop" />
        &nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox3" runat="server" Text="Mute" />
        <br />
        <br />
        <audio id="audio1"></audio>
        
    </form>
</body>
</html>
