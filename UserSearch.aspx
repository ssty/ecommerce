<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="UserSearch.aspx.cs" Inherits="Test1.UserSearch" %>

<%@ MasterType VirtualPath="~/usermaster.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="ErrorMsg" Text="" runat="server" ForeColor="Red" />
       
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" OnRowCommand="GridView1_RowCommand" BorderWidth="1px" CellPadding="3">
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
                        Price: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                        <br />
                        Brand: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label5" runat="server" Text='<%# Bind("Brand") %>'></asp:Label>
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
    <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
    <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />


</asp:Content>
