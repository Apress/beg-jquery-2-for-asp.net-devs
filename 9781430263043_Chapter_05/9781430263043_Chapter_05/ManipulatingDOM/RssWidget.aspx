<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RssWidget.aspx.cs" Inherits="ManipulatingDOM.RssWidget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnGenerate").click(OnGenerate);
            $("#btnUp").click(OnUp);
            $("#btnDown").click(OnDown);
        });

        function OnGenerate(event) {
            var SourceUrl = "RssReader.aspx?feedUrl=" + $("#txtURL").val();
            $.get(SourceUrl, OnSuccess);
            event.preventDefault();
        }

        function OnSuccess(feedData) {
            $("#RssBox").empty();
            $("#RssBox").append("<div><strong>" + $("#txtTitle").val() + "</strong></div>")
                        .append("<hr />")
                        .css("width", $("#txtWidth").val())
                        .css("height", $("#txtHeight").val())
                        .css("overflow", "auto")
                        .css("text-align", $("#ddlAlign").val())
                        .css("padding", "10px")
                        .css("border", "2px solid silver");
            $(feedData).find("item").each(ProcessFeedItem);
        }

        function ProcessFeedItem(index) {
            if (index >= $("#txtItemCount").val()) {
                return;
            }
            var item = $(this);
            var title = item.find("title").text();
            var link = item.find("link").text();
            var description = item.find("description").text();
            var pubDate = item.find("pubDate").text();

            var newDiv = $("<div></div>");

            for (var i = 1; i <= $("#lstSequence option").length; i++) {
                switch ($("#lstSequence option:nth-child(" + i + ")").val()) {
                    case "title":
                        $("<strong>" + title + "</strong><br />").appendTo(newDiv);
                        break;
                    case "date":
                        $("<em>Posted on : " + pubDate + "</em><br />").appendTo(newDiv);
                        break;
                    case "desc":
                        $("<p>" + description + "</p>").appendTo(newDiv);
                        break;
                    case "link":
                        $("<a href='" + link + "' target='" + ($("#chkTarget").is(":checked") ? '_blank' : '_self') + "'>Full story...</a><br /><br />").appendTo(newDiv);
                        break;
                }
            }

            $("#RssBox").append(newDiv);
            var clonedRssBox = $("#RssBox").clone();
            $("#HtmlSource").val($(clonedRssBox).html());
        }

        function OnUp(event) {
            $('#lstSequence option:selected').each(function () {
                $(this).insertBefore($(this).prev());
            });
            event.preventDefault();
        }

        function OnDown(event) {
            $('#lstSequence option:selected').each(function () {
                $(this).insertAfter($(this).next());
            });
            event.preventDefault();
        }

    </script>
    
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">

    <table cellpadding="3" cellspacing="0" class="style1">
        <tr>
            <td align="right" width="30%">
                RSS Feed URL :</td>
            <td>
                    <asp:TextBox ID="txtURL" runat="server" Columns="50"></asp:TextBox>
</td>
        </tr>
        <tr>
            <td align="right" width="30%">
                Desired Title :</td>
            <td>
                    <asp:TextBox ID="txtTitle" runat="server" Columns="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                Item Count :</td>
            <td>
                    <asp:TextBox ID="txtItemCount" runat="server" Columns="50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                Open URLs in New Window :</td>
            <td>
                <asp:CheckBox ID="chkTarget" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                Alignment :</td>
            <td>
                <asp:DropDownList ID="ddlAlign" runat="server" 
                    >
                    <asp:ListItem>Left</asp:ListItem>
                    <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Center</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                Height :</td>
            <td>
                    <asp:TextBox ID="txtHeight" runat="server" Columns="10" 
                        ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                Width :</td>
            <td>
                    <asp:TextBox ID="txtWidth" runat="server" Columns="10"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" width="30%">
                Sequence :</td>
            <td>
                    <asp:ListBox ID="lstSequence" runat="server" Width="120px">
                        <asp:ListItem Value="title">Item Title</asp:ListItem>
                        <asp:ListItem Value="date">Publication Date</asp:ListItem>
                        <asp:ListItem Value="desc">Description</asp:ListItem>
                        <asp:ListItem Value="link">Link to Full Story</asp:ListItem>
                    </asp:ListBox>
                    <br />
                    <asp:Button ID="btnUp" runat="server" Text="Up" Width="60px" />
                    <asp:Button ID="btnDown" runat="server" Text="Down" Width="60px" />
            </td>
        </tr>
    </table>
    <asp:Button ID="btnGenerate" runat="server" Text="Generate" />
    <br />


    <div id="RssBox">
    </div>
    <br />
    <br />
    <textarea id="HtmlSource" rows="10" cols="50">
    </textarea>
    </form>
</body>
</html>
