<%@ Page Title="" Language="C#" MasterPageFile="~/AdminProductMaster.Master" AutoEventWireup="true" CodeBehind="UpdateDeleteByAdmin.aspx.cs" Inherits="Test1.UpdateDeleteByAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
       <style type="text/css">
        .table-striped {}
        .table-striped {}
        .table-striped {}
        .table-striped {}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

          <h1>
              <asp:Label ID="Label1" runat="server" Text="Label" CssClass="right pull-right"></asp:Label>
          </h1>
          <div style="height:100%; width:100%; margin-top:100px; margin-left:inherit;"> 
    <asp:GridView ID="ProductGridView" UseAccessibleHeader="true" CssClass="table table-hover table-striped" ShowHeaderWhenEmpty="true" runat="server" OnRowDeleting="ProductGridView_RowDeleting" OnRowUpdating="ProductGridView_RowUpdating" OnRowCancelingEdit="ProductGridView_RowCancelingEdit" OnRowCommand="ProductGridView_RowCommand" OnRowEditing="ProductGridView_RowEditing" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" CellPadding="4" CellSpacing="10" margin-top="100"  ShowFooter="true" DataKeyNames="ProductID" OnSelectedIndexChanged="ProductGridView_SelectedIndexChanged1" Height="574px" Width="500px" AllowPaging="True" AllowSorting="True" CaptionAlign="Left">
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

                        <asp:TemplateField HeaderText="Product Name" >
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
                                <asp:TextBox ID="txtProductDetailFooter" runat="server" Width="375px" />
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
                                <asp:FileUpload ID="FileUpload1" runat="server"  />
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
