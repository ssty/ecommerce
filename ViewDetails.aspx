<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="Test1.ViewDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductId" OnRowCommand="GridView1_RowCommand" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:TemplateField HeaderText="Image" SortExpression="Image" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="img" Width="150px" Height="150px" runat="server" ImageUrl='<%# Bind("Image") %>'></asp:Image>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Information" SortExpression="ProductName" ItemStyle-Width="25%" ItemStyle-Height="20%">
                <ItemTemplate>
                    <div class="text-left">
                        Product Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        <br />
                        Price: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        <br />
                        Brand: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                        <br />
                    </div>
                </ItemTemplate>
                <ItemStyle Height="20%" Width="50%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Description" SortExpression="ProductDetail">
                <ItemTemplate>
                    <div class="text-left">
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Brand Description" SortExpression="BrandDetail">
                <ItemTemplate>
                    <div class="text-left">
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("BrandDetails") %>'></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" SortExpression="">
                <ItemTemplate>
                    <div class="text-left">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Select" Text="Add to favourite"></asp:LinkButton>
                    </div>
                </ItemTemplate>
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
    <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
    <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT image.image AS Image, product.product_id AS ProductId, product.product_name AS ProductName, product.product_detail AS Details, product.product_price AS Price, brand.brand_name AS Brand,brand.brand_detail as BrandDetails FROM image INNER JOIN product ON image.product_id = product.product_id INNER JOIN brand ON brand.brand_id = product.brand_id"></asp:SqlDataSource>
</asp:Content>
