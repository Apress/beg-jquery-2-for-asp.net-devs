<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormSelectors.aspx.cs" Inherits="SelectorsWebForms.FormSelectors" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.0.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#GridView1 input:checkbox[name$='chkHeader']").click(function () {
                if ($("#GridView1 input:checkbox[name$='chkHeader']").is(":checked")) {
                    $("#GridView1 input:checkbox").prop("checked", true);
                }
                else {
                    $("#GridView1 input:checkbox").prop("checked",false);
                }
            });

            $("#GridView1 input:radio").click(function (evt) {
                var currentRadioId = this.id;
                $("#GridView1 input:radio").each(function () {
                    if (this.id != currentRadioId) {
                        $(this).prop("checked",false);
                    }
                });
            });

	 $("#form1 input:image").click(function (evt) {
                var chkCount = $("#GridView1 input:checkbox:checked").length;
                var radCount = $("#GridView1 input:radio:checked").length;
                alert(chkCount +  " checkboxes and " + radCount + " radio buttons are selected!");
                evt.preventDefault();
            });

            $("#form1").submit(function (evt) {
                if ($("#GridView1 input:text").length > 0) {
                    if ($("#form1 :input[name$='TextBox1']").val() == "") {
                        alert("Please enter first name!");
                        evt.preventDefault();
                    }
                    if ($("#GridView1 :input[name$='TextBox2']").val() == "") {
                        alert("Please enter last name!");
                        evt.preventDefault();
                    }
                    if ($("#GridView1 :selected").val() == "Please select") {
                        alert("Please select a country!");
                        evt.preventDefault();
                    }
                }
            });

           

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @EmployeeID" InsertCommand="INSERT INTO [Employees] ([LastName], [FirstName], [Country]) VALUES (@LastName, @FirstName, @Country)" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Country] FROM [Employees]" UpdateCommand="UPDATE [Employees] SET [LastName] = @LastName, [FirstName] = @FirstName, [Country] = @Country WHERE [EmployeeID] = @EmployeeID">
            <DeleteParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT DISTINCT [Country] FROM [Employees] ORDER BY [Country]"></asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="10" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkRow" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:RadioButton ID="radRow" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:TemplateField HeaderText="FirstName" SortExpression="FirstName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="LastName" SortExpression="LastName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country" SortExpression="Country">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Country" DataValueField="Country" SelectedValue='<%# Bind("Country") %>' AppendDataBoundItems="True">
                            <asp:ListItem>Please select</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Country") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Submit.gif" />
    </form>
</body>
</html>
