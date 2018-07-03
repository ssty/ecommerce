<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ajax.aspx.cs" Inherits="Test1.Ajax" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <style>
        .blue {
            background-color: blue
        }

        .red {
            background-color: red
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="email" runat="server" onblur="checkEmailAddress()" ></asp:TextBox>
        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        <input id="btnCheck" type="button" value="Show Availability" />
        <br />
        <span id="message"></span>
       
        <span style="color: red"></span>
        <script type="text/javascript">


         function checkEmailAddress() {
        var email_address = $("#email").val();
        $.ajax({
            type: "POST",
            url: "Ajax.aspx/CheckUserName",
            data: {email_address: email_address },
            contentType: "application/json; charset=utf-8",
           // dataType: "json",
            success: function (response) {
                var message = $("#message");
                if (response.d) {
                     message.css("color", "red");
                    message.html("Email address is already used");
                   
                }
                else {
                    message.css("color", "green");
                    message.html("Email address is available");
                   
                }
            }
        });
    };
 
    function ClearMessage() {
        $("#message").html("");
    };
</script>


    </form>
</body>
</html>

