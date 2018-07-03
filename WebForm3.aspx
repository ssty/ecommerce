<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Test1.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  
<link href="http://code.jquery.com/ui/1.11.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">
function openPopup(product_id, product_name,product_price) {
$('#lblId').text(product_id);
$('#lblName').text(product_name);
$('#lblPrice').text(product_price);
$("#popupdiv").dialog({
title: "jQuery Show Gridview Row Details in Popup",
width: 300,
height: 250,
modal: true,
buttons: {
Close: function () {
$(this).dialog('close');
}
}
});
}
</script>
<style type="text/css">
.GridviewDiv {font-size: 100%; font-family: 'Lucida Grande', 'Lucida Sans Unicode', Verdana, Arial, Helevetica, sans-serif; color: #303933;}
.headerstyle
{
color:#FFFFFF;border-right-color:#abb079;border-bottom-color:#abb079;background-color: #df5015;padding:0.5em 0.5em 0.5em 0.5em;text-align:center;
}
</style>
<div>
<div id="popupdiv" title="Basic modal dialog" style="display: none">
Product Id: <label id="lblId"></label><br />
Product Name: <label id="lblName"></label><br />
Price: <label id="lblPrice"></label>
</div>
<table align="center" style="margin-top:200px">
<tr>
<td>
<div class="GridviewDiv">
<asp:GridView runat="server" ID="gvDetails" AutoGenerateColumns="false" Width="420px">
<HeaderStyle CssClass="headerstyle" />
<Columns>
<asp:BoundField DataField="product_id" HeaderText="Product Id" />
<asp:BoundField DataField="product_name" HeaderText="Product Name" />
<asp:BoundField DataField="product_price" HeaderText="Price" />
<asp:TemplateField>
<ItemTemplate>
<a href="#" class="gridViewToolTip" onclick='openPopup("<%# Eval("product_id")%>","<%# Eval("product_name")%>","<%# Eval("product_price")%>")'>test</a>
</ItemTemplate>
</asp:TemplateField>
</Columns>
</asp:GridView>
</div>
</td>
</tr>
</table>
</div>


</asp:Content>
		
