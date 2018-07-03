<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminChart.aspx.cs" Inherits="Test1.AdminChart" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 100px; margin-left: 70px;">

        <table style="border: 1px solid black; font-family: Arial">
            <tr>
                <td>
                    <b>Select Chart Type:</b>
                </td>
                <td  style="padding-top:100px;">                    
                    <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Chart ID="Chart1" runat="server" Width="1200px" OnLoad="Chart1_Load">
                        <Titles>
                            <asp:Title Text="Chart of total numbers of likes in each product">
                            </asp:Title>
                        </Titles>
                        <Series>
                            <asp:Series Name="Series1" ChartArea="ChartArea1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisX Title="Product Name"></AxisX>
                                <AxisY Title="Total number of likes"></AxisY>

                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
