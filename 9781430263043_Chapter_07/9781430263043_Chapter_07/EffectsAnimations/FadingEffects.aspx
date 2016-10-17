<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FadingEffects.aspx.cs" Inherits="EffectsAnimations.FadingEffects" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#button1").click(function () {
                $("#div1").fadeIn(3000, function () { alert('done'); });
            });

            $("#button2").click(function () {
                $("#div1").fadeOut(3000, function () { alert('done'); });
            });

            $("#button3").click(function () {
                $("#div1").fadeToggle(3000, function () { alert('done'); });
            });

            $("#button4").click(function () {
                $("#div1").fadeTo(3000, 0.5,function () { alert('done'); });
            });

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input type="button" id="button1" value="Fade In" />
         <input type="button" id="button2" value="Fade Out" />
        <input type="button" id="button3" value="Fade Toggle" />
        <input type="button" id="button4" value="Fade To" />

    <div id="div1" style="height:300px;width:300px;border:2px solid red;background-color:blue">
    
    </div>
    </form>
</body>
</html>
