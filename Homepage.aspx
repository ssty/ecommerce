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
        <h1>
            <asp:Label ID="Label1" runat="server" Text="Label" CssClass=" pull-right" Font-Size="X-Small" Font-Bold="true" Font-Italic="true"></asp:Label>
        </h1>
        <div class="col col-lg-9">
            <asp:Label ID="ErrorMsg" Text="" runat="server" ForeColor="Red" />

            <table style="position: center">
                <tr>
                    <td>
                        <div class="GridviewDiv">
                            <asp:GridView runat="server" ID="gvDetails" CellPadding="3" CssClass="table table-striped" margin-top="100" OnRowCommand="gvDetails_RowCommand" AllowPaging="True" AutoGenerateColumns="false" Width="1020px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
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
                                            <a href="#" class="gridViewToolTip" onclick='openPopup("<%# Eval("product_id")%>","<%# Eval("product_name")%>","<%# Eval("product_price")%>","<%# Eval("product_detail")%>","<%# Eval("brand_name")%>","<%# Eval("brand_detail")%>")'>View Details</a>
                                            <br />
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
            </table>
        </div>
        <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
        <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
</asp:Content>


