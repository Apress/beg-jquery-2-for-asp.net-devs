<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnOffTrigger.aspx.cs" Inherits="AdvancedTechniques.OnOffTrigger" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>


    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("audio").on("play pause ended", function (evt) {
                switch (evt.type) {
                    case "play":
                        $("#spanMsg").text("Audio is playing.");
                        break;
                    case "pause":
                        $("#spanMsg").text("Audio has been paused.");
                        break;
                    case "ended":
                        $("#spanMsg").text("Audio has completed.");
                        break;
                }
                
            });

            $(document).keydown(function (evt) {
                switch (evt.which) {
                    case 118:
                        $("audio").trigger("play");
                        break;
                    case 119:
                        $("audio").trigger("pause");
                        break;
                    case 120:
                        $("audio").off("play pause ended");
                        $("#spanMsg").text("Event handlers are removed.");
                        break;
                    default:
                        alert('F7 - Play, F8 - Pause, F9 - Off');
                        break;
                }
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <audio src="media/audio1.mp3" controls="controls"></audio>
         <br />
        <asp:Label ID="spanMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
