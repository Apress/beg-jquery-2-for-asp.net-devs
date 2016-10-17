<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatePickerDemo.aspx.cs" Inherits="jQueryUIDemo.DatePickerDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script>
        $(document).ready(function () {
            $("#datepicker").datepicker();
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <span>Select Date : </span><input type="text" id="datepicker" />
    </form>
</body>
</html>
