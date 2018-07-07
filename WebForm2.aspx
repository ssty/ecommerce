<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Test1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <form runat="server">
        <div class=" col-md-9 col-lg-9">
            <label>
                Activate you email address
            </label>
            <label>
                Your activation code:
  <input name="code" id="code" type="text" class="form-control" required="required" style="height: 30px; width: 350px; margin-bottom: 20px;" />
            </label>
            <br />
            <asp:Label ID="Label3" runat="server"></asp:Label>

        </div>
        <div class="row">
            <span id='message3' class="text-center" style="width: 150px; position: center; margin-left: 30px;"></span>
        </div>
                <div id="btnHide">
                    <asp:Button ID="Button2" class="btn btn-default" OnClientClick="return check();" runat="server" Text="Verify Email" OnClick="Button2_Click" />
                </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
