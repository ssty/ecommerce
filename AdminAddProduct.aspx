<%@ Page Title="" Language="C#" MasterPageFile="~/AdminProductMaster.Master" AutoEventWireup="true" CodeBehind="AdminAddProduct.aspx.cs" Inherits="Test1.AdminAddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-8 col-md-offset-2" >

        <div class="form-group col-md-6" style="top:200px;">
            <label for="">Product Name  :</label>
            <div class="clearfix">
                <asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" CssClass="form-control" required></asp:TextBox>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="">Product Price:</label>
            <div class="clearfix">
                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" required TextMode="SingleLine"></asp:TextBox>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="">Brand Name</label>
            <div class="clearfix">
                <asp:DropDownList ID="txtProductBrand" runat="server" DataSourceID="SqlDataSource1" DataTextField="brand_name" DataValueField="brand_name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT [brand_name] FROM [product]"></asp:SqlDataSource>

            </div>
        </div>
        <%--<div class="form-group col-md-6">
            <label for="">Brand Name</label>
            <div class="clearfix">
                <asp:TextBox ID="TextBoxs" runat="server" CssClass="form-control" required TextMode="SingleLine"></asp:TextBox>
            </div>
        </div>--%>


        <label for="">Product Detail:</label>
        <div class="clearfix">
            <asp:TextBox ID="txtDetail" runat="server" CssClass="form-control" required TextMode="MultiLine" Width="339px"></asp:TextBox>
        </div>

        <div class="form-group ">
            <label for="">Image</label>
            <div class="clearfix">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
        </div>



        <div class="form-group col-md-6">
            <fieldset>
                <asp:Button ID="BtnLogin" runat="server" Text="Save" class="btn btn-primary" />
            </fieldset>
        </div>
    </div>






</asp:Content>
