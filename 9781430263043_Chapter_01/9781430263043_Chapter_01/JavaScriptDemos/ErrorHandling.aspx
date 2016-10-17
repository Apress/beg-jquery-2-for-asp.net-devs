<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorHandling.aspx.cs" Inherits="Chapter_01.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function calculate() {
            var result;

            try {
                var val1 = document.getElementById("TextBox1").value;
                var val2 = document.getElementById("TextBox2").value;
                var operator = document.getElementById("DropDownList1").value;
                switch (operator) {
                    case "+":
                        result = val1 + val2;
                        break;
                    case "-":
                        result = val - val2;
                        break;
                    case "*":
                        result = val1 * val2;
                        break;
                    case "/":
                        result = val1 / val2;
                        break;
                }
                if (isNaN(result)) {
                    result = undefined;
                    throw new Error("Result is not a number!");
                }
                if (!isFinite(result)) {
                    result = undefined;
                    throw new Error("Result is infinity!");
                }
            }
            catch (err) {
                alert(err.name + "\n" + err.message );
            }
            finally {
                var label = document.getElementById("lblMsg");
                var resultMsg = "Result of calculation : ";
                if (typeof result === "undefined") {
                    resultMsg += " -- ERROR -- ";
                }
                else {
                    resultMsg += result;
                }
                label.innerHTML = resultMsg;
            }
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Label ID="Label2" runat="server" Text="Enter numbers and operation :"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server" Font-Bold="True" Font-Size="12px" Width="75px">
            <asp:ListItem>+</asp:ListItem>
            <asp:ListItem>-</asp:ListItem>
            <asp:ListItem>*</asp:ListItem>
            <asp:ListItem>/</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Calculate" OnClientClick="return calculate();" />
        <br />
        <br />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
