<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FormEvents.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        var cancel = false;

        $(document).ready(function () {
            $("input:text,textarea").focus(function (evt) {
                $(evt.target).addClass("Highlight");
            });
            $("input:text,textarea").blur(function (evt) {
                $(evt.target).removeClass("Highlight");
            });
            $("select").change(function (evt) {
                if (!confirm("You are changing country of an employee. Are you sure?")) {
                    evt.preventDefault();
                    return;
                }
            });
            $("#Button2").click(function () {
                cancel = true;
            });

            $("#form1").submit(function (evt) {
                if (!cancel) {
                    $("input:text,textarea").each(function () {
                        if ($(this).val() == "") {
                            $("#Label1").text("All fields must be filled before submitting the form!");
                            $(this).focus();
                            evt.preventDefault();
                            return;
                        }
                    });
                    cancel = false;
                }
            });
        });
    </script>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Country], [Notes]) VALUES (@LastName, @FirstName, @Country, @Notes)" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Country], [Notes] FROM [Employees] ORDER BY [EmployeeID]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Country] = @Country, [Notes] = @Notes WHERE [EmployeeID] = @EmployeeID">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="Notes" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT DISTINCT [Country] FROM [Employees] ORDER BY [Country]">
        </asp:SqlDataSource>
    
    </div>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="10" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" GridLines="Both" Width="100%" ClientIDMode="Static">
            <EditItemTemplate>
                <table cellpadding="10" width="100%">
                    <tr>
                        <td align="right">EmployeeID : </td>
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">LastName : </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">FirstName : </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Country : </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Country" DataValueField="Country" SelectedValue='<%# Bind("Country") %>'>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">Notes :</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Columns="30" Rows="3" Text='<%# Bind("Notes") %>' TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" CommandName="Update" Text="Update" Width="75px" />
                            <asp:Button ID="Button2" runat="server" CommandName="Cancel" Text="Cancel" Width="75px" CausesValidation="False" />
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <table cellpadding="10" width="100%">
                    <tr>
                        <td align="right">EmployeeID : </td>
                        <td>
                            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">LastName : </td>
                        <td>
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">FirstName : </td>
                        <td>
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">Country : </td>
                        <td>
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top">Notes :</td>
                        <td>
                            <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" Width="75px" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
        <br />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>

    </form>
</body>
</html>
