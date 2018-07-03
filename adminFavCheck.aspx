<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminFavCheck.aspx.cs" Inherits="Test1.adminFavCheck" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div style="top: 350px;margin-top:75px; margin-left:-40px;">
    <asp:GridView ID="GridView1" runat="server" Width="1319px" CellPadding="3" CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" DataKeyNames="product_id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"  BorderWidth="1px" Height="612px">
        <Columns>
            <asp:BoundField DataField="product_id" HeaderText="Product Id" InsertVisible="False" ReadOnly="True" SortExpression="product_id" />
            <asp:BoundField DataField="product_name" HeaderText="Product Name" SortExpression="product_name" />
            <asp:BoundField DataField="product_detail" HeaderText="Product Details" SortExpression="product_detail" />
            <asp:BoundField DataField="Total_likes" HeaderText="Total Likes" ReadOnly="True" SortExpression="Total_likes" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT product_id, product_name, product_detail,(SELECT COUNT(DISTINCT account_id) AS Expr1 FROM favourite WHERE (product_id = temp.product_id)) AS Total_likes FROM product AS temp"></asp:SqlDataSource>
   </div>


</asp:Content>
