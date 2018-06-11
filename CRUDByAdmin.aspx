<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDByAdmin.aspx.cs" Inherits="Test1.CRUDByAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link href="/Bootstrap/Design/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/font-awesome.css" rel="stylesheet" />
    <script src="~/Scripts/modernizr-2.6.2.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse" style="height: 75px;">
            <div class="container-fluid">
                <div class="row">

                    <div class="navbar-header col-sm-4">
                        <a class="navbar-brand" href="/Admin/Home">ADMIN DASHBOARD</a>
                    </div>
                    <div class="nav navbar-nav navbar-right col-sm-4">
                        <div class="pull-right">
                            <a href="#"><span class="glyphicon glyphicon-log-out"></span>Sign Out</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class=" row">

                <div class="nav flex-column col-lg-6 " style="position: fixed; z-index: 1; top: 75px; left: 0px; height: 100%; width: 160px; background-color: #111; overflow-x: hidden;">

                    <div class="container">
                        <div class=" btn-group-lg" style="margin-top: 50px;">
                            <table class="table-condensed">
                                <tr>
                                    <td><a href="adminProduct.aspx" role="button">Products</a></td>
                                </tr>
                                <tr>
                                    <td><a href="/Admin/Getroles" role="button">Brand</a></td>
                                </tr>
                                <tr>
                                    <td><a href="/Admin/Getsalaries" role="button">Type</a></td>
                                </tr>
                                <tr>
                                    <td><a href="/Admin/GetLeaves" role="button">Account</a></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <asp:GridView ID="ProductGridView" ShowHeaderWhenEmpty="true" runat="server" OnRowDeleting="ProductGridView_RowDeleting" OnRowUpdating="ProductGridView_RowUpdating" OnRowCancelingEdit="ProductGridView_RowCancelingEdit" OnRowCommand="ProductGridView_RowCommand" OnRowEditing="ProductGridView_RowEditing" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" ShowFooter="true" DataKeyNames="ProductID" OnSelectedIndexChanged="ProductGridView_SelectedIndexChanged1">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />

                    <Columns>

                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label Text='<%#Eval("product_name") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductName" Text='<%#Eval("product_name")%>' runat="server" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtProductNameFooter" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Details">
                            <ItemTemplate>
                                <asp:Label Text='<%#Eval("product_detail") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductDetail" Text='<%#Eval("product_detail")%>' runat="server" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtProductDetailFooter" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                <asp:Label Text='<%#Eval("product_price") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtProductPrice" Text='<%#Eval("product_price")%>' runat="server" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtProductPriceFooter" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Brand">
                            <ItemTemplate>
                                <asp:Label Text='<%#Eval("brand_name") %>' runat="server" />
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:DropDownList ID="txtProductBrand" runat="server" DataSourceID="SqlDataSource1" DataTextField="brand_name" DataValueField="brand_name">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT [brand_name] FROM [product]"></asp:SqlDataSource>
                            </EditItemTemplate>

                            <FooterTemplate>
                                <asp:DropDownList ID="txtProductBrandFooter" runat="server" DataSourceID="SqlDataSource1" DataTextField="brand_name" DataValueField="brand_name">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT [brand_name] FROM [product]"></asp:SqlDataSource>
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Images">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>'  Width="50px" Height="50px"/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />

                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>

                            <FooterTemplate>
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/images/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" OnClientClick="javascript:return window.confirm('are u really want to delete this data')" />

                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ImageUrl="~/images/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />

                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ImageUrl="~/images/addNew.png" runat="server" CommandName="AddNew" ToolTip="AddNew" Width="20px" Height="20px" />

                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
            </div>
            <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
        </div>



    </form>
</body>
</html>
