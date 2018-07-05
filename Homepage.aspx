<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Test1.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="http://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        function openPopup(product_id, product_name, product_price, product_detail, brand_name, brand_detail) {
            $('#lblId').text(product_id);
            $('#lblName').text(product_name);
            $('#lblPrice').text(product_price);
            $('#lblProductDetail').text(product_detail);
            $('#lblBrand').text(brand_name);
            $('#lblBrandDetail').text(brand_detail);
            $("#popupdiv").dialog({
                title: "Description",
                width: 1000,
                height: 550,
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog('close');
                    }
                }
            });
        }
    </script>


    <div class="side-bar col-md-3" style="height: 500px; width: 320px;">
        <div class="search-hotel">
            <h3 class="agileits-sear-head">Search Here..</h3>
            <asp:Panel ID="panelSearch" runat="server">
                <h3 class="agileits-sear-head">Product name</h3>
                <div style="padding-bottom: 0px; clear: both">
                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Product name..." Width="206px" Height="39px"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="btn" Height="39px" />
                </div>
                <h3 class="agileits-sear-head" style="clear: both">Brand name</h3>
                <div style="padding-bottom: 0px;">
                    <asp:TextBox ID="txtBrandSearch" runat="server" placeholder="Brand name..." Width="206px" Height="39px"></asp:TextBox>
                    <asp:Button ID="btnBrandSearch" runat="server" OnClick="btnBrandSearch_Click1" Text="Search" CssClass="btn" Height="39px" />
                </div>

            </asp:Panel>
        </div>
    </div>



    <div id="popupdiv" title="modal dialog" style="display: none;">
        Product Id:
                    <label id="lblId"></label>
        <br />
        Product Name:
                    <label id="lblName"></label>
        <br />
        Brand Name:
                    <label id="lblBrand"></label>
        <br />
        Price:
                    <label id="lblPrice"></label>
        <br />
        Product Detail:
                    <label id="lblProductDetail"></label>
        <br />
        Brand Detail:
                    <label id="lblBrandDetail"></label>
    </div>

    <asp:Label ID="Label1" runat="server" ForeColor="Green"></asp:Label>
    <div class="col col-lg-9">
        <table style="position: center">
            <tr>
                <td>
                    <div class="GridviewDiv">
                        <asp:GridView runat="server" ID="gvDetails" OnPageIndexChanging="gvDetails_PageIndexChanging" GridLines="None" CellPadding="3" AllowPaging="true" CssClass="table table-striped" margin-top="100" OnRowCommand="gvDetails_RowCommand" AutoGenerateColumns="false" Width="1020px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" PagerSettings-PageButtonCount="10" PageSize="5">
                            <HeaderStyle CssClass="headerstyle" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image" SortExpression="Image" ItemStyle-Width="20%" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Image ID="img" Width="150px" Height="150px" runat="server" ImageUrl='<%# Eval("image") %>'></asp:Image>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="20%"></ItemStyle>
                                </asp:TemplateField>
                                <asp:BoundField DataField="product_id" HeaderText="Product Id" />
                                <asp:BoundField DataField="product_name" HeaderText="Product Name" />
                                <asp:BoundField DataField="brand_name" HeaderText="Brand Name" />
                                <asp:BoundField DataField="product_price" HeaderText="Price" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <a href="#" class="gridViewToolTip" onclick='openPopup("<%# Eval("product_id")%>","<%# Eval("product_name")%>","<%# Eval("product_price")%>","<%# Eval("product_detail")%>","<%# Eval("brand_name")%>","<%# Eval("brand_detail")%>")'>View Details</a>
                                        <br />
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# Container.DataItemIndex %>" CommandName="Select" Text="Add to favourite"></asp:LinkButton>
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
                    </div>
                </td>
            </tr>
            <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
            <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
        </table>
    </div>
</asp:Content>


