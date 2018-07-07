<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="adminProductView.aspx.cs" Inherits="Test1.adminProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div style="  margin-left:130px;  margin-top: 140px;">
    <asp:GridView ID="GridView1" runat="server" CellPadding="3" border CssClass="table table-hover table-striped" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:TemplateField HeaderText="Image"  SortExpression="Image"   ItemStyle-Width="30%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="img" Width="150px" Height="150px" runat="server" ImageUrl='<%# Bind("Image") %>'></asp:Image>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Description" SortExpression="ProductName" ItemStyle-Width="50%" ItemStyle-Height="40%">
                <ItemTemplate>
                    <div class="text-left">
                        Product Id: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductId") %>'></asp:Label>
                        <br />
                        Product Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        <br />                       
                        Price: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        <br />
                        Brand: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                        <br />
                         </div>
                </ItemTemplate>
                <ItemStyle Height="20%" Width="50%"></ItemStyle>
            </asp:TemplateField>

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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT image.image as Image,product.product_id as ProductId,product.product_name as ProductName,product.product_detail as Details, product.product_price as Price,brand.brand_name as Brand FROM image INNER JOIN product ON image.product_id=product.product_id  INNER JOIN brand ON brand.brand_id=product.brand_id "></asp:SqlDataSource>
   </div>


</asp:Content>
