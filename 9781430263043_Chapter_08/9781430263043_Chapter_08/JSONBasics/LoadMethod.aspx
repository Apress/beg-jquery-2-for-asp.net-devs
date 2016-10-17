<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoadMethod.aspx.cs" Inherits="JSONBasics.LoadMethod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#Button1").click(function (evt) {
                var data = {};
                data.Country = $("#TextBox1").val();
                data.Designation = $("#TextBox2").val();
                $("#container").load("LoadTarget.aspx", data, function () {
                    alert("HTML markup loaded successfully!");
                });
                evt.preventDefault();
            });


        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Country :"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text="Title :"></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Load" />
        <br /><br />
        <div id="container"></div>
    </form>
</body>
</html>
