<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dropdownTest.aspx.cs" Inherits="Test1.dropdownTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/Bootstrap/Design/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="/Bootstrap/Design/css/font-awesome.css" rel="stylesheet"/>
</head>
<body>
    <div class="container">
        <header>

            <div class="header-bot">
                <div class="header-bot_inner_wthreeinfo_header_mid">
                    <div class="col-md-4 logo_agile">
                        <h1>
                            <a href="index.html">
                                <span>S</span>ee
						<span>P</span>roduct&nbsp;
                            </a>
                        </h1>
                    </div>
                   </div>
                </div>
        </header>
        <section>
            <div class="row">
                <div class="col-lg-3">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <h1>Drop down form</h1>
                        </div>


                        <div class="form-group">
                            <label for="DropDownList1">DropDownList1</label>
                            <asp:DropDownList ID="DropDownList1" runat="server"  CssClass="form-control" DataValueField='<%#Eval("brand_name")%>' OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem value="">----------select brand</asp:ListItem>
                                
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="DropDownList2">DropDownList1</label>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                               </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="submit" runat="server" Text="Submit"  class="btn btn-primary" OnClick="submit_Click" />
                        </div>
                        <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
                        <asp:Literal ID="Lit1" runat="server"></asp:Literal><asp:Literal ID="Lit2" runat="server"></asp:Literal>
                    </form>
                </div>
                
                </div>
          </section>
        <footer>
            
        </footer>
    </div>
</body>
</html>
