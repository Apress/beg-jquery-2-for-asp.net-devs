<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Arrays.aspx.cs" Inherits="Chapter_01.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var myData = ["This","is","Array"];
        var myData = new Array("This","is","Array");

        function storeData() {
            var data = document.getElementById("TextBox1").value;
            myData.push(data);
            document.getElementById("Label1").innerHTML = "Array contains " + myData.length + " elements";
            return false;
        }

        function retrieveData() {
            var index = document.getElementById("TextBox1").value;
            alert(myData[index]);
            return false;
        }

        function removeData() {
            myData.pop();
            document.getElementById("Label1").innerHTML = "Array contains " + myData.length + " elements";
            return false;
        }

        function displayData() {
            var i = 0;
            var label = document.getElementById("Label1");
            label.innerHTML = "";
            do {
                label.innerHTML += myData[i] + "<br />";
                i++;
            } while (i < myData.length);

            //while (i < myData.length) {
            //    label.innerHTML += myData[i] + "<br />";
            //    i++;
            //}
            return false;
        }



    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:TextBox ID="TextBox1" runat="server" Width="235px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClientClick="return storeData();" Text="Store" Width="75px" />
&nbsp;<asp:Button ID="Button2" runat="server" OnClientClick="return retrieveData();" Text="Retrieve" Width="75px" />
&nbsp;<asp:Button ID="Button4" runat="server" OnClientClick="return removeData();" Text="Remove" Width="75px" />
&nbsp;<asp:Button ID="Button3" runat="server" OnClientClick="return displayData();" Text="Display" Width="75px" />
        <br />
        <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
