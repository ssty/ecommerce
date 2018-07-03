<%@ Page Title="" Language="C#" MasterPageFile="~/AdminProductMaster.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Test1.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-8 col-md-offset-2">
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="form-group col-md-6">
            <label for="">Product Name  :</label>
            <div class="clearfix">
                <asp:TextBox ID="txtName" runat="server" Height="50px" TextMode="SingleLine" CssClass="form-control" required></asp:TextBox>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="">Product Price:</label>
            <div class="clearfix">
                <asp:TextBox ID="txtPrice" runat="server" Height="50px" CssClass="form-control" required TextMode="SingleLine"></asp:TextBox>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="">Brand Name</label>
            <div id="myDIV">
                <asp:DropDownList ID="txtProductBrand" Height="50px" runat="server" DataSourceID="SqlDataSource1" DataTextField="brand_name" DataValueField="brand_name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ecommerceConnectionString %>" SelectCommand="SELECT [brand_name] FROM [brand]"></asp:SqlDataSource>
                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <label for="">Product Detail:</label>
        <div class="clearfix">
            <asp:TextBox ID="txtDetail" runat="server" Height="50px" CssClass="form-control" required TextMode="MultiLine" Width="339px"></asp:TextBox>
        </div>

        <div class="form-group ">
            <label for="">Image</label>
            <div class="clearfix">
                <asp:FileUpload ID="FileUpload1" Height="50px" runat="server" />
            </div>
        </div>

        <div class="form-group col-md-6" style="margin-top: 0px;">
            <fieldset>
                <asp:Button ID="BtnLogin" runat="server" Text="Save" class="btn btn-primary" OnClick="BtnLogin_Click" />
            </fieldset>
        </div>
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
