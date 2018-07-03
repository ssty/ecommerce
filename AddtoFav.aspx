<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="AddtoFav.aspx.cs" Inherits="Test1.AddtoFav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AllowSorting="True" DataKeyNames="product_id" DataSourceID="SqlDataSource1">
        <Columns>           
            <asp:BoundField DataField="product_id"  HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="product_id">
            </asp:BoundField>
            <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name">
            </asp:BoundField>
            <asp:BoundField DataField="brand_name" HeaderText="Brand Name" SortExpression="brand_name">
            </asp:BoundField>
            <asp:BoundField DataField="count" HeaderText="Total Likes" ReadOnly="True" SortExpression="count">
            </asp:BoundField>
            
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="  select product_id, product_name,brand_name,(select count (distinct account_id) from favourite where product_id=temp.product_id) as count from product as temp;"></asp:SqlDataSource>





</asp:Content>
