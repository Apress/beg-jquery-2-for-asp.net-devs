<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HierarchySelectors.aspx.cs" Inherits="SelectorsWebForms.HierarchySelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("#Container > div").css("border", "solid navy 2px");
            $("span + :text").css("background-color", "silver").css("border", "solid gray 1px");
            $("span ~ :text").css("font-family", "courier");
            $("#Panel2 fieldset > div").css("border", "solid red 2px").css("margin", "10px");
        })

    </script>
</head>
<body>
    <form id="form1" runat="server">
  <asp:Panel ID="Container" runat="server">
        <asp:Panel ID="Panel1" runat="server" GroupingText="Basic Details">
                <asp:Label ID="Label5" runat="server" Text="First Name : " Width="100px" style="text-align:right"></asp:Label>&nbsp;
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label6" runat="server" Text="Last Name : " Width="100px" style="text-align:right"></asp:Label>&nbsp;
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server" GroupingText="Contact Information" style="text-align:center">
            <asp:Panel ID="Panel3" runat="server" GroupingText="Address" Width="300px">
                <asp:Label ID="Label1" runat="server" Text="Street 1 : " Width="100px" style="text-align:right"></asp:Label>&nbsp;
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Street 2 : " Width="100px" style="text-align:right"></asp:Label>&nbsp;
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="State" runat="server" Text="State : " Width="100px" style="text-align:right"></asp:Label>&nbsp;
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Pin Code : " Width="100px" style="text-align:right"></asp:Label>&nbsp;
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Landmarks : " Width="100px" style="text-align:right"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" Width="250px"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" GroupingText="Telephones" Width="300px">
                <asp:Label ID="Label7" runat="server" Text="Home :" Width="100px"></asp:Label>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label8" runat="server" Text="Office :" Width="100px"></asp:Label>
                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel5" runat="server" GroupingText="Social Networking" Width="300px">
                <asp:Label ID="Label9" runat="server" Text="Facebook :" Width="100px"></asp:Label>
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Twitter :" Width="100px"></asp:Label>
                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="Label11" runat="server" Text="Google + :" Width="100px"></asp:Label>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
            </asp:Panel>
        </asp:Panel>
        <br />
    </asp:Panel>
    <asp:Button ID="Button1" runat="server" Text="Submit" />
    </form>
</body>
</html>
