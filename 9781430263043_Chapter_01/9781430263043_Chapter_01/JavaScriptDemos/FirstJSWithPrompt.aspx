<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FirstJSWithPrompt.aspx.cs" Inherits="Chapter_01.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript">
        function confirmName() {
            var textbox = document.getElementById("TextBox1");
            alert("You will now be asked to enter your name.");
            var enteredName = prompt("Please enter your name below:", "name goes here...");
            var flag = confirm("You entered : " + enteredName + "\n\nDo you wish to continue?");
            if (flag) {
                textbox.value = enteredName;
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>First JavaScript Program</h1>
        <asp:Label ID="Label1" runat="server" Text="Enter your name :"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClientClick="return confirmName();" OnClick="Button1_Click" />
        <br /><br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </form>
    <script type="text/javascript">
        document.write("<hr />");
        document.write("Page rendered on " + new Date().toString());
    </script>
</body>
</html>