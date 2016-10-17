<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccordionDemo.aspx.cs" Inherits="jQueryUIDemo.AccordionDemo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var options = {};
            options.heightStyle = "content";
            options.collapsible = true;
            options.header = "h3";
            options.active = 3;
            options.icons = false;
            options.beforeActivate = function (evt, ui) {
                if ($(ui.newPanel).find(".hidden").val()) {
                    $.ajax({
                        url: "AccordionDemo.aspx/GetNotes",
                        type: "POST",
                        data: JSON.stringify({ employeeid: $(ui.newPanel).find(".hidden").val() }),
                        dataType: "json",
                        contentType: "application/json",
                        success: function (result) {
                            $(ui.newPanel).find(".notes").remove();
                            $(ui.newPanel).append("<div class='notes'>" + result.d + "</div>");
                        },
                        error: function (xhr, status, err) { alert('Error' + err); }
                    });
                }
            };
            options.create = function (evt,ui) {
                $.ajax({
                    url: "AccordionDemo.aspx/GetNotes",
                    type: "POST",
                    data: JSON.stringify({ employeeid: $(ui.panel).find(".hidden").val() }),
                    dataType: "json",
                    contentType: "application/json",
                    success: function (result) {
                        $(ui.panel).find(".notes").remove();
                        $(ui.panel).append("<div class='notes'>" + result.d + "</div>");
                    },
                    error: function (xhr, status, err) { alert('Error' + err); }
                });
            };
            $("#accordion").accordion(options);

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:Repeater ID="Repeater1" runat="server" SelectMethod="Repeater1_GetData">
            <HeaderTemplate>
                <div id="accordion">
            </HeaderTemplate>
            <ItemTemplate>
                <h3><%# Eval("FirstName") %> <%# Eval("LastName") %></h3>
                <div>
                    <input type="hidden" class="hidden" value="<%# Eval("EmployeeID") %>" />
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>

    </form>
</body>
</html>
