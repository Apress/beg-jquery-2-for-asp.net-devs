<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MiscMethods.aspx.cs" Inherits="MiscMethods.MiscMethods" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //var audio = $("#audio1").get(0);
            //audio.play();

            //var audioList = $("audio").get();
            //for (var i = 0; i < audioList.length; i++) {
            //    audioList[i].play();
            //}

            alert($("#level1").index());

            var item = $("#level1");
            alert($("li").index(item));

            alert($("li").toArray().length);

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!--
        <audio id="audio1" src="media/audio1.mp3" controls="controls"></audio>
        <audio id="audio2" src="media/audio2.mp3" controls="controls"></audio>
        <audio id="audio3" src="media/audio3.mp3" controls="controls"></audio>
        -->

        <ul id="root">
            <li>C#</li>
            <li>Windows Forms</li>
            <li id="level1">ASP.NET</li>
            <li>.NET Framework</li>
            <li>Security</li>
        </ul>
    </form>
</body>
</html>
