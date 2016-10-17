<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentFilters.aspx.cs" Inherits="SelectorsWebForms.ContentFilters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#Button1").click(function (evt) {
                var searchString = $("#TextBox1").val();
                $("#GridView1 tr").removeClass("HighlightedRow");
                $("#GridView1 tr:has(p:contains('" + searchString + "'))").addClass("HighlightedRow");
                evt.preventDefault();
            });
        });
    </script>
    
    <style type="text/css">
        .HighlightedRow
        {
            background-color:navy;
            color:White;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
           <p>
               <asp:Label ID="Label5" runat="server" Text="Search Notes :"></asp:Label>
               <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
               <asp:Button ID="Button1" runat="server" Text="Search" />
               <br />
           </p>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Notes] FROM [Employees]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" CellPadding="5" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="Employee Details">
                    <ItemTemplate>
                        <table cellpadding="3" cellspacing="0" class="auto-style1">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("EmployeeID") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                    &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <p><%# Eval("Notes") %></p>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
