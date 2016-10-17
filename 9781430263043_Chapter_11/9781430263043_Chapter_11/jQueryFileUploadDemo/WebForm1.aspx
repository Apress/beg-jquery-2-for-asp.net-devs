<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="jQueryFileUploadDemo.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#progress").hide();

            $("#Button1").click(function (evt) {
                var fileUpload = $("#FileUpload1").get(0);
                var files = fileUpload.files;
                var data = new FormData();
                for (var i = 0; i < files.length; i++) {
                    data.append(files[i].name, files[i]);
                }

                var options = {};
                options.url = "FileUploadHandler.ashx";
                options.type = "POST";
                options.data = data;
                options.contentType = false;
                options.processData = false;
                options.beforeSend = function () {
                    $("#progress").show();
                };
                options.success = function (result) { alert(result); };
                options.error = function (err) { alert(err.statusText); };
                options.complete = function () {
                    $("#progress").hide();
                }

                $.ajax(options);

                evt.preventDefault();
            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
        <br />
        <br />
        <div id="progress">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/progress.gif" />
        </div>
        <asp:Button ID="Button1" runat="server" Text="Upload Selected File(s)" />
    
    </div>
    </form>
</body>
</html>
