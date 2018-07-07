<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="adminBrandView.aspx.cs" Inherits="Test1.adminBrandView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .table-striped {
        }

        .table-striped {
        }

        .table-striped {
        }

        .table-striped {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container" id="hideDiv" style="margin-top:75px;margin-left:-50px;">
                 <div class="fixed-menu" >
                     <ul class="nav nav-tabs" style="position:fixed">
                         <li><a href="adminBrandSee.aspx">Brands</a></li>
                         <li><a href="AddProduct.aspx">Add Brands</a></li>
                         <li ><a href="adminBrandView.aspx">Update/Delete Brands</a></li>
                     </ul>
                 </div>
             </div>
        <div style="  margin-left: 130px; margin-right: 130px; margin-top:70px;">
            <asp:GridView ID="GridView1" UseAccessibleHeader="true" CssClass="table table-hover table-striped"
                ShowHeaderWhenEmpty="true" runat="server"  Height="100%"
                OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating"
                OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand"
                OnRowEditing="GridView1_RowEditing" AutoGenerateColumns="false" BackColor="White" 
                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px"  margin-top="100"
                DataKeyNames="BrandID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged"  AllowPaging="True" 
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

                    <asp:TemplateField HeaderText="Brand Name">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("brand_name") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBrandName" Width="50px" Text='<%#Eval("brand_name")%>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBrandNameFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Details">
                        <ItemTemplate>
                            <asp:Label Text='<%#Eval("brand_detail") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBrandDetail" Text='<%#Eval("brand_detail")%>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtBrandDetailFooter" runat="server" Width="375px" />
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
                            <asp:ImageButton ImageUrl="~/images/addNew.png" runat="server" CommandArgument="<%# Container.DataItemIndex%>" CommandName="AddNew" ToolTip="AddNew" Width="20px" Height="20px" />
                            <%--<asp:ImageButton ImageUrl="~/images/addNew.png" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="AddNew" ToolTip="AddNew" Width="20px" Height="20px" />--%>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
            <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
        </div>
</asp:Content>
