<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CharacterCounter.aspx.cs" Inherits="KeyboardEvents.CharacterCounter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">

        var maxLength = 20;
        var allowOverflow = true;
        var counterType = 'Remaining';

        $(document).ready(function () {
            $("#TextBox1").keydown(OnKeyDown);
            $("#TextBox1").keyup(OnKeyUp);
            $("#TextBox1").focus(OnFocus);
            $("#TextBox1").blur(OnBlur);
        })

        function OnKeyUp(evt) {
            var text = $("#TextBox1").val();
            if (text.length > maxLength) {
                if (!allowOverflow) {
                    $("#TextBox1").val(text.substring(0, maxLength));
                }
            }
            var diff = 0;

            if (counterType == 'Remaining') {
                diff = maxLength - $("#TextBox1").val().length;
                if (diff < 0) {
                    $("#lblCounter").removeClass("NormalCounter");
                    $("#lblCounter").addClass("WarningCounter");
                }
                else {
                    $("#lblCounter").removeClass("WarningCounter");
                    $("#lblCounter").addClass("NormalCounter");
                }
            }

            if (counterType == 'Total') {
                diff = $("#TextBox1").val().length;
                if (diff > maxLength) {
                    $("#lblCounter").removeClass("NormalCounter");
                    $("#lblCounter").addClass("WarningCounter");
                }
                else {
                    $("#lblCounter").removeClass("WarningCounter");
                    $("#lblCounter").addClass("NormalCounter");
                }
            }
            $("#lblCounter").text(diff);

            if (evt.which == 16) {
                $("#lblShift").removeClass("SpecialKeysOn");
                $("#lblShift").addClass("SpecialKeysOff");

            }
            if (evt.which == 17) {
                $("#lblCtrl").removeClass("SpecialKeysOn");
                $("#lblCtrl").addClass("SpecialKeysOff");
            }
            if (evt.which == 18) {
                $("#lblAlt").removeClass("SpecialKeysOn");
                $("#lblAlt").addClass("SpecialKeysOff");
            }
        }

        function OnKeyDown(evt) {
            if (evt.which==16) {
                $("#lblShift").addClass("SpecialKeysOn");
                $("#lblShift").removeClass("SpecialKeysOff");
            }
            if (evt.which == 17) {
                $("#lblCtrl").addClass("SpecialKeysOn");
                $("#lblCtrl").removeClass("SpecialKeysOff");
            }
            if (evt.which == 18) {
                $("#lblAlt").addClass("SpecialKeysOn");
                $("#lblAlt").removeClass("SpecialKeysOff");
            }
            if (evt.which == 8 || evt.which == 46) {
                $("#TextBox1").keypress();
            }
        }

        function OnFocus() {
            $("#TextBox1").keyup();
        }

        function OnBlur() {
            $("#TextBox1").keyup();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server" Columns="50" Rows="5" TextMode="MultiLine"></asp:TextBox>
    
    </div>
        <br />
        <asp:Label ID="lblCounter" runat="server" CssClass="NormalCounter"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
        <br />
        <asp:Label ID="lblShift" runat="server" CssClass="SpecialKeysOff" >[Shift]</asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="lblCtrl" runat="server" CssClass="SpecialKeysOff" >[Ctrl]</asp:Label>
        &nbsp;&nbsp;
        <asp:Label ID="lblAlt" runat="server" CssClass="SpecialKeysOff" >[Alt]</asp:Label>
        <br /><br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
