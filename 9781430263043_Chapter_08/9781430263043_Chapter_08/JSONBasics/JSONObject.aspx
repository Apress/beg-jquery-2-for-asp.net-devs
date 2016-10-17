<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JSONObject.aspx.cs" Inherits="JSONBasics.JSONObject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

           /*
            var employee = {
                "EmployeeID": 1,
                "FirstName": "Nancy",
                "LastName": "Davalio",
                "IsContract":false
            };

            var employeeArray = [{
                "EmployeeID": 1,
                "FirstName": "Nancy",
                "LastName": "Davalio",
                "IsContract": false
            },
            {
                "EmployeeID": 2,
                "FirstName": "Andrew",
                "LastName": "Fuller",
                "IsContract": true
            }];
            */

            var obj = { Name: 'Andrew', Age: 45 };
            var strObj = JSON.stringify(obj);
            alert(strObj);
            var obj2 = JSON.parse(strObj);
            alert(obj2.Name);

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
