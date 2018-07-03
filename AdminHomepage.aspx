<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHomepage.aspx.cs" Inherits="Test1.AdminHomepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div style="position: fixed; z-index: 1;top: 150px;left:160px;height: 100%; width: 100%;">

         <h1>
            <asp:Label ID="Label4" runat="server" Text="Label" CssClass="right pull-left" Font-Bold="true"></asp:Label>
        </h1>
        <table style="width:100% ";  border="0"; >
                <tr class="pull-left" style="width:1024px; ">
                    <td style="border-right:hidden;height:50px; width:1000px;font-size:20px; " >
                        <asp:ImageButton ID="ImageButton6" runat="server" Width="214px" Height="151px"  ImageUrl="~/images/products.png" OnClick="ImageButton6_Click" />
                        <br />
                           <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Label"></asp:Label>
                         
                     </td>
                    
                     <td style="border-right:hidden;height:50px; width:1000px;font-size:20px; position:center; " >
                         <asp:ImageButton ID="ImageButton4" runat="server" Width="214px" Height="151px"  ImageUrl="~/images/fav1.png" OnClick="ImageButton4_Click" />
                        <br />
                           <asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Label"></asp:Label>
                         
                     </td>
                 
                     <td class="right" style="border-right:hidden;height:50px; width:700px;font-size:20px; " >
                         <asp:ImageButton ID="ImageButton5" runat="server" Width="214px" Height="151px"  ImageUrl="~/images/profile_icon.png" OnClick="ImageButton5_Click" />
                        <br />
                           <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Label"></asp:Label>
                         
                     </td>
                    </tr>
            </table>    

</div>


</asp:Content>

