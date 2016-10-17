<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BasicEffects.aspx.cs" Inherits="EffectsAnimations.BasicEffects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#button1").click(function () {
                $("#div1").hide(3000, function () { alert('done'); });
            });

            $("#button2").click(function () {
                $("#div1").show(3000, function () { alert('done'); });
            });

            $("#button3").click(function () {
                $("#div1").toggle(3000, function () { alert('done'); });
            });
        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="button" id="button1" value="Hide DIV" />
         <input type="button" id="button2" value="Show DIV" />
        <input type="button" id="button3" value="Toggle DIV" />
    <div id="div1" style="height:300px;width:300px;border:2px solid red;background-color:blue">
    
    </div>
    </form>
</body>
</html>
