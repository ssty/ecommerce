<%@ Page Title="" Language="C#" MasterPageFile="~/PublicUsermaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Test1.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
    <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <style>
        .HiddenCol {
            display: none;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            if ('<%=Page.IsPostBack%>'.toLowerCase() == 'true')
                ShowPopup();
        });
        function ShowPopup() {
            $("#dialog").dialog({
                title: "Description",               
                width: 1000,
                buttons: {
                    Ok: function () {
                        $(this).dialog('close');
                    }
                },
                modal: true
            });
        }
    </script>
    <asp:GridView ID="GridView1" runat="server" CellPadding="3" CssClass="table table-striped" margin-top="100" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:TemplateField HeaderText="Image" SortExpression="Image" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Image ID="img" Width="150px" Height="150px" runat="server" ImageUrl='<%# Bind("Image") %>'></asp:Image>
                </ItemTemplate>

                <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Description" SortExpression="ProductName" ItemStyle-Width="50%" ItemStyle-Height="20%">
                <ItemTemplate>
                    <div class="text-left">
                        Product Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                        <br />
                        Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        <br />
                        Brand: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                        <br />
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Bind("ProductId") %>' CommandName="Details" Text="View Details"></asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;
                         <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Select" Text="Add to favourite"></asp:LinkButton>
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




    <div id="dialog" style="display: none">
        <asp:GridView ID="GridView2" runat="server" Width="950px" CellPadding="3" CssClass="table table-striped" margin-top="100" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" OnRowCommand="GridView1_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:TemplateField>
                     <HeaderStyle CssClass="HiddenCol" />
                    <ItemTemplate>
                        <div class="text-left">
                            Product Name: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            <br />
                            Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                            <br />
                            Brand:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
                            <br />
                            Product Details:
                           &nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Bind("Details") %>'></asp:Label>
                            <br />
                            Brand Details:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Bind("BrandDetails") %>'></asp:Label>
                            <br />
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

    </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT image.image as Image,product.product_id as ProductId,product.product_name as ProductName,product.product_detail as Details, product.product_price as Price,brand.brand_name as Brand,brand.brand_detail as BrandDetails FROM image INNER JOIN product ON image.product_id=product.product_id  INNER JOIN brand ON brand.brand_id=product.brand_id ">
        <FilterParameters>
            <asp:ControlParameter Name="Country" ControlID="txtSearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>

    <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
    <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />

</asp:Content>


















