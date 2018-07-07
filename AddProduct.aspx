<%@ Page Title="" Language="C#" MasterPageFile="~/AdminProductMaster.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Test1.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
                <asp:TextBox ID="txtName" runat="server" Height="50px" TextMode="SingleLine" onblur="checkProduct()" CssClass="form-control" required></asp:TextBox>
                <span id="message"></span>
                <span style="color: red"></span>
                <script type="text/javascript">
                    function checkProduct() {
                        var product_name = $("#ContentPlaceHolder1_txtName").val();
                        $.ajax({
                            type: "POST",
                            url: "AddProduct.aspx/checkProduct",
                            data: '{product_name: "' + product_name + '" }',
                            contentType: "application/json; charset=utf-8",
                            success: function (response) {
                                var message = $("#message");
                                if (response.d) {
                                    message.css("color", "red");
                                    message.html("Product already exist!!");

                                }
                                else {
                                    $("#message").html("");
                                }
                            }
                        });
                    };
                    function ClearMessage() {
                        $("#message").html("");
                    };
                </script>
            </div>
        </div>

        <div class="form-group col-md-6">
            <label for="">Product Price:</label>
            <div class="clearfix">
                <asp:TextBox ID="txtPrice" runat="server" Height="50px" onblur="checkInp()" CssClass="form-control" required TextMode="SingleLine"></asp:TextBox>
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
                <asp:Button ID="BtnLogin" runat="server" Text="Save" class="btn btn-primary" OnClientClick="clearLabel()" OnClick="BtnLogin_Click" />
            </fieldset>
        </div>
        <asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="Red" Text=""></asp:Label>
        <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true" ForeColor="Green"></asp:Label>
    </div>
    <script>
        function checkInp() {
            var x = document.getElementById("ContentPlaceHolder1_txtPrice").value;
            if (isNaN(x)) // this is the code I need to change
            {
                alert("Must integer numbers");
                return false;
            }
        }
        function clearLabel() {
            document.getElementById("Label1") = "";
        }
    </script>
</asp:Content>
