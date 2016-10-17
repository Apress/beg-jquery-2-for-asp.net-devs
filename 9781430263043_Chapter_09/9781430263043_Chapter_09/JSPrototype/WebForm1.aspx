<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="JSPrototype.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            function Employee() {
                this.employeeID = 0;
                this.firstName = '';
                this.lastName = '';
            };

            //instantiate Employee
            var objEmp1 = new Employee();
            objEmp1.employeeID = 1;
            objEmp1.firstName = 'Nancy';
            objEmp1.lastName = 'Davolio';

            //display employee details
            alert('#' + objEmp1.employeeID + ' ' + objEmp1.firstName + ' ' + objEmp1.lastName);

            //add properties and methods using prototype
            Employee.prototype.hireDate = null;
            Employee.prototype.getEmploymentPeriod = function () {
                var currentDate=new Date();
                var timePeriod = Math.abs(currentDate.getTime() - this.hireDate.getTime());
                var dayPeriod = Math.ceil(timePeriod / (1000 * 60 * 60 * 24));
                return dayPeriod;
            };

            //instantiate Employee again
            var objEmp2 = new Employee();
            objEmp2.employeeID = 2;
            objEmp2.firstName = 'Andrew';
            objEmp2.lastName = 'Fuller';
            objEmp2.hireDate = new Date(1992, 8, 14);
            var daysEmp2 = objEmp2.getEmploymentPeriod();
            alert(objEmp2.firstName + ' ' + objEmp2.lastName + ' is employed for ' + daysEmp2 + ' days.');

            //use newly added properties and methods on earlier instance
            objEmp1.hireDate = new Date(1992, 5, 1);
            var daysEmp1 = objEmp1.getEmploymentPeriod();
            alert(objEmp1.firstName + ' ' + objEmp1.lastName + ' is employed for ' + daysEmp1 + ' days.');

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
