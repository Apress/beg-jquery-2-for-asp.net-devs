<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AjaxMethod.aspx.cs" Inherits="JSONBasics.AjaxMethod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#Button1").click(function (evt) {
                var data = {};
                data.Country = $("#TextBox1").val();
                data.Designation = $("#TextBox2").val();

                $.ajax({
                    url: "PostTarget.aspx",
                    type: "POST",
                    data: data,
                    contentType:"application/x-www-form-urlencoded;charset=UTF-8",
                    dataType: "json",
                    success: function (result,status,jqXHR) {
                        $("#container").empty();
                        for (var i = 0; i < result.length; i++) {
                            $("#container").append("<tr><td>" + 
                                result[i].EmployeeID + "</td><td>" +
                                result[i].FirstName + "</td><td>" +
                                result[i].LastName + "</td></tr>");
                        }
                        alert("Employee data retrieved successfully!");
                    },
                    error: function (jqXHR,status,err) {
                        alert("ERROR : " + status);
                    }

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
        <asp:Button ID="Button1" runat="server" Text="Get" />
        <br /><br />
        <table border="1" cellpadding="6" id="container"></table>
    </form>
</body>
</html>
