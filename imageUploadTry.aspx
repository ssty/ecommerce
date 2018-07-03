<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="imageUploadTry.aspx.cs" Inherits="Test1.imageUploadTry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:TextBox ID="Txtcode" runat="server"></asp:TextBox>
            <asp:TextBox ID="Txtname" runat="server"></asp:TextBox>
            <asp:TextBox ID="Txtcost" runat="server"></asp:TextBox>
            <asp:TextBox ID="Txtdescr" runat="server"></asp:TextBox>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" style="height: 29px" />
        </div>
    </form>
</body>
</html>
