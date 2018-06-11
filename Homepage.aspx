<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Test1.Home" %>


<!DOCTYPE html>
<html lang="zxx">

<head>
	<title></title>
	<!--/tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link href="/Bootstrap/Design/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/Bootstrap/Design/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/Bootstrap/Design/css/font-awesome.css" rel="stylesheet">
	<!--pop-up-box-->
	<link href="/Bootstrap/Design/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
	<!--//pop-up-box-->
	<!-- price range -->
	<link rel="stylesheet" type="text/css" href="/Bootstrap/Design/css/jquery-ui1.css">
	<!-- fonts -->
	<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800" rel="stylesheet">
    <style type="text/css">
        #form1 {
            height: 55px;
        }
    </style>
</head>

<body>
    <!-- header-bot -->
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
			<!-- header-bot -->

			<div class="col-md-8 header">
				<!-- header lists -->
                <div class="top_nav_right">
				<ul>
					<li>
						<a href="Home.aspx" data-toggle="modal" data-target="#myModal2">
							<span class="fa fa-pencil-square-o" aria-hidden="true"></span> Sign out</a>
					</li>
				</ul>
                </div>
                </div>
				<!-- //header lists -->
				
				<!-- cart details -->
				
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
				<form id="form1" runat="server">
	<div class="ban-top">
		<div class="container" >
			<div class="agileits-navi_search">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="50px" Width="399px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="Clothing"></asp:ListItem>
                        <asp:ListItem Value="Electronics"></asp:ListItem>
                        <asp:ListItem Value="Automobile"></asp:ListItem>
                        <asp:ListItem Value="Food"></asp:ListItem>
                        <asp:ListItem Value="Bike"></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
			</div>
			<div class="top_nav_left">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav menu__list">
								<li class="active">
									<a class="nav-stylehead" href="index.html">Home
										<span class="sr-only">(current)</span>
									</a>
								</li>
								<li class="">
									<a class="nav-stylehead" href="about.html">About Us</a>
								</li>								
								<li class="">
									<a class="nav-stylehead" href="contact.html">Contact</a>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</div>        
		</div>
        </div>
    <div class="ads-grid">
		<div class="container">
			<!-- tittle heading -->
			<div class="side-bar col-md-3">
				<div class="search-hotel">
					<h3 class="agileits-sear-head">Search Here..</h3>
                    <h3 class="agileits-sear-head">Product name</h3>
					<form action="#" method="post">
						<input type="search" placeholder="Product name..." name="search" required="">
					</form>
                    <asp:Button ID="Search1" runat="server" Text="Search" />
				</div>
                <div class="search-hotel">
                    <h3 class="agileits-sear-head"> &nbsp;Brand name</h3>
					<form action="#" method="post">
						<input type="search" placeholder="Product name..." name="search" required="">&nbsp;
					</form>
                    <asp:Button ID="Search2" runat="server" Text="Search" />
				</div>
				<!-- price range -->
				<div class="range">
					<h3 class="agileits-sear-head">Price range</h3>
					<ul class="dropdown-menu6">
						<li>

							<div id="slider-range"></div>
							<input type="text" id="amount" style="border: 0; color: #ffffff; font-weight: normal;" />
						</li>
					</ul>
				</div>
				
			<!-- //product right -->
		</div>
            
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>



	</div>
        </div>
	
	

	

    </form>
				
	

</body>

</html>

















