<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PassData.aspx.cs" Inherits="AdvancedTechniques.PassData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">

        var options = {};
        options.MaxLength = 20;
        options.AllowOverflow = true;
        options.CounterType = "Remaining";
        options.NormalCssClass = "NormalCounter";
        options.WarningCssClass = "WarningCounter";
        options.SpecialKeysOnCssClass = "SpecialKeysOn";
        options.SpecialKeysOffCssClass = "SpecialKeysOff";

        $(document).ready(function () {

            $("#TextBox1").keydown(options,OnKeyDown);
            $("#TextBox1").keyup(options,OnKeyUp);
            $("#TextBox1").focus(options,OnFocus);
            $("#TextBox1").blur(options,OnBlur);
        })

        function OnKeyUp(evt) {
            var text = $("#TextBox1").val();
            if (text.length > evt.data.MaxLength) {
                if (!evt.data.AllowOverflow) {
                    $("#TextBox1").val(text.substring(0, evt.data.MaxLength));
                }
            }
            var diff = 0;

            if (evt.data.CounterType == 'Remaining') {
                diff = evt.data.MaxLength - $("#TextBox1").val().length;
                if (diff < 0) {
                    $("#lblCounter").removeClass(evt.data.NormalCssClass);
                    $("#lblCounter").addClass(evt.data.WarningCssClass);
                }
                else {
                    $("#lblCounter").removeClass(evt.data.WarningCssClass);
                    $("#lblCounter").addClass(evt.data.NormalCssClass);
                }
            }

            if (evt.data.CounterType == 'Total') {
                diff = $("#TextBox1").val().length;
                if (diff > evt.data.MaxLength) {
                    $("#lblCounter").removeClass(evt.data.NormalCssClass);
                    $("#lblCounter").addClass(evt.data.WarningCssClass);
                }
                else {
                    $("#lblCounter").removeClass(evt.data.WarningCssClass);
                    $("#lblCounter").addClass(evt.data.NormalCssClass);
                }
            }
            $("#lblCounter").text(diff);

            if (evt.which == 16) {
                $("#lblShift").removeClass(evt.data.SpecialKeysOnCssClass);
                $("#lblShift").addClass(evt.data.SpecialKeysOffCssClass);

            }
            if (evt.which == 17) {
                $("#lblCtrl").removeClass(evt.data.SpecialKeysOnCssClass);
                $("#lblCtrl").addClass(evt.data.SpecialKeysOffCssClass);
            }
            if (evt.which == 18) {
                $("#lblAlt").removeClass(evt.data.SpecialKeysOnCssClass);
                $("#lblAlt").addClass(evt.data.SpecialKeysOffCssClass);
            }
        }

        function OnKeyDown(evt) {
            if (evt.which == 16) {
                $("#lblShift").addClass(evt.data.SpecialKeysOnCssClass);
                $("#lblShift").removeClass(evt.data.SpecialKeysOffCssClass);
            }
            if (evt.which == 17) {
                $("#lblCtrl").addClass(evt.data.SpecialKeysOnCssClass);
                $("#lblCtrl").removeClass(evt.data.SpecialKeysOffCssClass);
            }
            if (evt.which == 18) {
                $("#lblAlt").addClass(evt.data.SpecialKeysOnCssClass);
                $("#lblAlt").removeClass(evt.data.SpecialKeysOffCssClass);
            }
            if (evt.which == 8 || evt.which == 46) {
                $("#TextBox1").keypress();
            }
        }

        function OnFocus() {
            $("#TextBox1").keyup();
        }

        function OnBlur() {
            $("#TextBox1").keyup(options);
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
