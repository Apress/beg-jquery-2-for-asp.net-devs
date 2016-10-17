<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BasicEventHandling.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("body").click(function (evt) { alert('body received the event'); });
            $("#outer").click(function (evt) { alert('outer' + evt.target.id); });
            $("#inner").click(function () { alert('inner'); });
            $("#inner").click(function () { alert('inner2'); });

            $("#button1").click(function (evt) {
                alert('Inside OnClick event handler');
                //evt.stopPropagation();
            });

        });

        function OnClick() {
            alert('Inside OnClick event handler');
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">

    <div id="outer">
        <input id="button1" type="button" value="Click Me" />

        <div id="inner">
            <br />
            Hello World
            <br />
            <br />
        </div>
    </div>
    </form>
</body>
</html>
