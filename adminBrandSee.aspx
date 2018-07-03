<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminBrandSee.aspx.cs" Inherits="Test1.adminBrandSee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="hideDiv" style="margin-top: 75px; margin-left: -50px;">
        <div class="fixed-menu">
            <ul class="nav nav-tabs" style="position:fixed">
                <li><a href="adminBrandSee.aspx">Brands</a></li>
                <li><a href="AddBrand.aspx">Add Brands</a></li>
                <li><a href="adminBrandView.aspx">Update/Delete Brands</a></li>
            </ul>
        </div>
    </div>
     <div style=" width: 50%; margin-left: -30px;margin-top:50px;">
           <asp:GridView ID="GridView1" runat="server" CellPadding="3" Width="1319px" CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" DataKeyNames="brand_id">
            <Columns>
                <asp:BoundField DataField="brand_id" HeaderText="brand_id" ReadOnly="True" SortExpression="brand_id" />
                <asp:BoundField DataField="brand_name" HeaderText="brand_name" SortExpression="brand_name" />
                <asp:BoundField DataField="brand_detail" HeaderText="brand_detail" SortExpression="brand_detail" />

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
    </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT * FROM [brand]"></asp:SqlDataSource>


</asp:Content>
