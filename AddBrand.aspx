<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="Test1.AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="hideDiv" style="margin-top: 75px; margin-left: -50px;">
        <div class="fixed-menu">
            <ul class="nav nav-tabs" style="position:fixed">
                <li><a href="adminBrandSee.aspx">Brands</a></li>
                <li><a href="AddBrand.aspx">Add Brands</a></li>
                <li><a href="adminBrandView.aspx">Update/Delete Brands</a></li>
            </ul>
        </div>
    </div>
    <div class="form-group" style="margin-left: 70px; margin-top:100px;">
        <label for="">Brand Name  :</label>
        <div class="clearfix">
            <asp:TextBox ID="txtName" runat="server" Height="50px" TextMode="SingleLine" CssClass="form-control" required></asp:TextBox>
            <div class="clearfix">
            </div>
            <div class="form-group">
                <label for="">Brand Name  :</label>
                <asp:TextBox ID="txtDetail" runat="server" Height="50px" CssClass="form-control" required TextMode="MultiLine" Width="339px"></asp:TextBox>
            </div>

            <div class="form-group">
                <fieldset>
                    <asp:Button ID="BtnSaveBrand" runat="server" Text="Save" class="btn btn-primary" OnClick="BtnSaveBrand_Click" />

                </fieldset>
            </div>
        </div>
    </div>
    <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
    <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
</asp:Content>
