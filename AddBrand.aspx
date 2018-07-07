<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="Test1.AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="hideDiv" style="margin-top: 75px; margin-left: -50px;">
        <div class="fixed-menu">
            <ul class="nav nav-tabs" style="position: fixed">
                <li><a href="adminBrandSee.aspx">Brands</a></li>
                <li><a href="AddBrand.aspx">Add Brands</a></li>
                <li><a href="adminBrandView.aspx">Update/Delete Brands</a></li>
            </ul>
        </div>
    </div>

    <div class="form-group" style="margin-left: 70px; margin-top: 100px;">
        <label for="">Brand Name  :</label>
        <div class="clearfix">
            <asp:TextBox ID="txtName" runat="server" Height="50px" TextMode="SingleLine" CssClass="form-control" onblur="checkBrand()" required="required"></asp:TextBox>
            <span id="message"></span>
            <span style="color: red"></span>
            <script type="text/javascript">
                function checkBrand() {
                    var brand_name = $("#ContentPlaceHolder1_txtName").val();
                    $.ajax({
                        type: "POST",
                        url: "AddBrand.aspx/checkBrand",
                        data: '{brand_name: "' + brand_name + '" }',
                        contentType: "application/json; charset=utf-8",
                        success: function (response) {
                            var message = $("#message");
                            if (response.d) {
                                message.css("color", "red");
                                message.html("Brand already exist!!");

                            }
                            else {
                                message.css("color", "green");
                            }
                        }
                    });
                };
                function ClearMessage() {
                    $("#message").html("");
                };
            </script>
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
            <div>
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </div>
    <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
    <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />

</asp:Content>
