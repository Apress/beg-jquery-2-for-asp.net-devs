<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accordion.aspx.cs" Inherits="EffectsAnimations.Accordion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $("div[id $= 'menuItemGroup']").hide();
            $(".Menu").click(function (evt) {
                $("div[id $= 'menuItemGroup']").slideUp(1000);
                if (evt.target.tagName == "DIV") {
                    var child = $(evt.target).children("div[id $= 'menuItemGroup']").eq(0);
                }
                else {
                    var child = $(evt.target).parent().children("div[id $= 'menuItemGroup']").eq(0);
                }
                $(child).slideDown(1000);
            });
        });


    </script>
    
    <style type="text/css">
        .Menu
        {
            width:200px;
            text-align:center;
            border:solid 2px gray;
            padding:0px;
            background-color:Silver;
            cursor:hand;
            font-weight:bold;
        }
        
        .MenuItem
        {
            width:192px;
            text-align:center;
            border:solid 1px silver;
            padding:2px;
            background-color:whitesmoke;
        }

    </style>
    
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" ClientIDMode="AutoID"  OnItemDataBound="Repeater1_ItemDataBound">
            <ItemTemplate>
                <asp:Panel ID="Panel1" runat="server" CssClass="Menu">
                    <asp:Label ID="lblText" runat="server" Text='<%# Eval("Text") %>'></asp:Label>
                    <asp:Panel ID="menuItemGroup" runat="server" CssClass="MenuItem">
                        
                    </asp:Panel>
                </asp:Panel>
            </ItemTemplate>
        </asp:Repeater>
     </form>
</body>
</html>
