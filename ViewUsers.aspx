<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewUsers.aspx.cs" Inherits="Test1.ViewUsers" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="top: 350px; margin-top: 75px; margin-left:-30px; ">
        <asp:GridView ID="GridView1" UseAccessibleHeader="true" CssClass="table table-hover table-striped"
            ShowHeaderWhenEmpty="true" runat="server" Width="1319px" Height="100%"
            OnRowDeleting="GridView1_RowDeleting" AutoGenerateColumns="false" BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="2px" margin-top="100"
            DataKeyNames="account_id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
            AllowSorting="True" CaptionAlign="Left">
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
            <Columns>

                <asp:TemplateField HeaderText="Account Id">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("account_id") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("name") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email Address">
                    <ItemTemplate>
                        <asp:Label Text='<%#Eval("email_address") %>' runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton ImageUrl="~/images/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" OnClientClick="javascript:return window.confirm('are u really want to delete this data')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Label ID="LblSuccessMsg" Text="" runat="server" ForeColor="Green" />
        <asp:Label ID="LblErrorMsg" Text="" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
