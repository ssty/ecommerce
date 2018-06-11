<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminDahboard.aspx.cs" Inherits="Test1.adminDahboard" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="/Bootstrap/Design/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/Bootstrap/Design/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/Bootstrap/Design/css/font-awesome.css" rel="stylesheet"/>
	<script src="~/Scripts/modernizr-2.6.2.js"></script>
</head>
<body>
   
    <nav class="navbar navbar-inverse" style="height:75px;">
        <div class="container-fluid" >
            <div class="row">
                <div class="navbar-header col-sm-4 " >                   
                    <a class="navbar-brand" href="/Admin/Home"> ADMIN DASHBOARD</a>
                </div>              
                <div class="nav navbar-nav navbar-right col-sm-4" >
                    <div class="pull-right">
                    <a href="#" ><span class="glyphicon glyphicon-log-out"></span> Sign Out</a>
                    </div>
                </div>
            </div>
        </div>
        </nav>
   

    <div class="container">
        <div class=" row">

            <div class="nav flex-column col-lg-6 " style="  position: fixed; z-index: 1;top: 75px;left:0px;height: 100%; width: 160px;  background-color: #111; overflow-x: hidden;">

                <div class="container">
                    <div class=" btn-group-lg" style="margin-top:50px;">
                        <table class="table-condensed">
                            <tr><td><a href="CRUDByAdmin.aspx" role="button">Products</a></td> </tr>
                            <tr> <td><a href="/Admin/Getroles" role="button">Brand</a></td></tr>
                            <tr> <td><a href="/Admin/Getsalaries" role="button">Type</a></td></tr>
                            <tr><td><a href="/Admin/GetLeaves" role="button">Account</a></td> </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="container body-content col-lg-6" style=" left:120px;"></div>
                
            </div>
        </div>
    





    <div class="footer navbar-fixed-bottom">
        <footer>
           
        </footer>
    </div>


</body>
</html>

