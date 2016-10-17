<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EachFindInGridView.aspx.cs" Inherits="TreeTraversal.EachFindInGridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" />
    <script src="Scripts/jquery-2.0.3.js"></script>


    <script type="text/javascript">
        $(document).ready(function () {

            if ($("#DropDownList1").val() != "Please select") {

                var totalAmount = 0;

                $("tr").each(function () {
                    if (!$(this).hasClass("Header") && !$(this).hasClass("Footer")) {
                        var price = $(this).find(".Price").text();
                        var qty = $(this).find(".Qty").text();
                        totalAmount += (price * qty);
                    }
                    if ($(this).hasClass("Footer")) {
                        $(this).empty();
                        $(this).append("<td colspan='3' align='right'>TOTAL : " + totalAmount.toFixed(2) + "</td>");
                    }
                });
            }

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [OrderID] FROM [Orders]"></asp:SqlDataSource>
        Order ID :
        <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource1" DataTextField="OrderID" DataValueField="OrderID" AutoPostBack="True">
        </asp:DropDownList>
        <br /><br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [ProductID], [UnitPrice], [Quantity] FROM [Order Details] WHERE ([OrderID] = @OrderID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6" DataSourceID="SqlDataSource2" ShowFooter="True">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" >
                <ItemStyle CssClass="Price" />
                </asp:BoundField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" >
                <ItemStyle CssClass="Qty" />
                </asp:BoundField>
            </Columns>
            <FooterStyle CssClass="Footer" />
            <HeaderStyle CssClass="Header" />
        </asp:GridView>

    </form>
</body>
</html>
