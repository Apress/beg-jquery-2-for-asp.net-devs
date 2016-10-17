<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomFunctions.aspx.cs" Inherits="Chapter_01.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function calculate() {
            var textbox = document.getElementById("TextBox1");
            var result = convertTemperature(textbox.value);
            alert("Result = " + result + " degrees Fahrenheit");
            return false;
        }

        function convertTemperature(value, scale) {
            if (typeof scale === "undefined") {
                scale = "C";
            }

            var convertedValue;
            if (scale == "C") {
                convertedValue = (value * 1.8) + 32;
            } else if (scale == "F") {
                convertedValue = (value - 32) / 1.8;
            }
            else {
                convertedValue = -1;
            }
            return convertedValue;
        }

        //function celsiusToFahrenheit(celsius) {
        //    var fahrenheit = (celsius * 1.8) + 32;
        //    return fahrenheit;
        //}

        //function celsiusToFahrenheit() {
        //    var textbox = document.getElementById("TextBox1");
        //    var celsius = textbox.value;
        //    var fahrenheit = (celsius * 1.8) + 32;
        //    return fahrenheit;
        //}

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Enter temperature value in Celsius :"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Width="136px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClientClick="return calculate();" Text="Convert to Fahrenheit" />
    
    </div>
    </form>
</body>
</html>
