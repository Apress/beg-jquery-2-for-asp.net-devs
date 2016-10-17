<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreventDefault.aspx.cs" Inherits="AdvancedTechniques.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>


    <script type="text/javascript">
        
        
        
        $(document).ready(function () {

            $("#Button1").click(function (evt) {
                if (!confirm("Do you want to submit this form?")) {
                    evt.preventDefault();
                    evt.stopPropagation();
                }
            });

            $("#Panel1").click(function (evt) {
                if (evt.isDefaultPrevented()) {
                    alert("You cancelled the form submission!");
                }
                else {
                    alert("You are submitting this form!");
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" BackColor="#FF9900" BorderColor="Maroon" BorderStyle="Solid" BorderWidth="2px" Height="200px" HorizontalAlign="Center">
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Click me to submit this form" Font-Bold="True" Font-Size="20px" Height="50px" />
        </asp:Panel>
    </form>
</body>
</html>
