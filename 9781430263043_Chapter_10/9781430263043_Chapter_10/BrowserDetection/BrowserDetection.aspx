<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrowserDetection.aspx.cs" Inherits="jQueryMobileWebForms.BrowserDetection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <table cellpadding="3" cellspacing="0" class="auto-style1" border="1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="IsMobileDevice :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="MobileDeviceManifacturer :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="MobileDeviceModel :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="ScreenPixelsHeight :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="ScreenPixelsWidth :"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
