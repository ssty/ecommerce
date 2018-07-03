<%@ Page Title="" Language="C#" MasterPageFile="~/usermaster.Master" AutoEventWireup="true" CodeBehind="UserMyFav.aspx.cs" Inherits="Test1.UserMyFav" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col col-lg-9">
        <asp:GridView ID="GridView1" UseAccessibleHeader="true" CssClass="table table-hover table-striped"
            ShowHeaderWhenEmpty="true" runat="server" Width="1000px" Height="100%"
            OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="false" BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" margin-top="100"
            DataKeyNames="ProductID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True"
            AllowSorting="True" CaptionAlign="Left">
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
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("product_price") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Brand">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("brand_name") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="Images">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' Width="150px" Height="150" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />                   
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" OnClientClick="javascript:return window.confirm('are u really want to delete this data')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
        <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
