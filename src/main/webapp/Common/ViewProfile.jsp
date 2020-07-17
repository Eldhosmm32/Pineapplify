<%-- 
    Document   : profile
    Created on : Apr 14, 2020, 8:01:08 PM
    Author     : user
--%>

<%@page import="com.pineapplify.modal.LoginModal"%>
<jsp:useBean class="com.pineapplify.services.OwnerHomeServices" id="ohs"></jsp:useBean>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/dealer.css" media="screen,projection" />

        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>AgroMart</title>
    </head>

    <body>
        <!-- navbar -->
        <nav class="navbar navbgcol white" id="navi">
            <div class="container nav-wrapper">
                <a href="Login" class="brand-logo">
                    <img class="materialboxed logos" width="200" src="./Assets/img/logo.png">
                </a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
                        class="material-icons navulcol">menu</i></a>
                <ul class="right hide-on-med-and-down ul-style2">
                    <li><a href="" class="dropdown-trigger" data-target="noti"><i class="material-icons pcol-text" style="position: absolute;">notifications</i><small
                                class="notification-badge"><% out.print(ohs.getUpdateCount(session.getAttribute("userMail").toString())); %></small></a></li>
                    <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown1">Operations<i
                                class="material-icons right">arrow_drop_down</i></a></li>
                    <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown2">${userName}<i
                                class="material-icons right">arrow_drop_down</i></a></li>
                </ul>
            </div>
        </nav>

        <!--notification drop-down-->
        <ul id="noti" class="dropdown-content dpos2">
            <li style="padding-top:7px"><h6>&nbsp;&nbsp;&nbsp;&nbsp;NOTIFICATIONS</h6></li>
            <li class="divider"></li>
        </ul>

        <ul id="dropdown1" class="dropdown-content dpos">
            <li><a href="ManagePlantation">Manage</a></li>
            <li class="divider"></li>
            <li><a href="ViewCultivations">Cultivations</a></li>
            <li class="divider"></li>
            <li><a href="#!">Announce</a></li>
        </ul>

        <ul id="dropdown2" class="dropdown-content dpos">
            <li><a href="Login">Home</a></li>
            <li class="divider"></li>
            <li><a href="Logout">Logout</a></li>
        </ul>

        <!-- sidebar -->
        <ul class="sidenav" id="mobile-demo">
            <br>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${userName}</b>
            <li class="divider"></li>
            <li><a href="Login">&nbsp;&nbsp;&nbsp;Home</a></li> 
            <li class="divider"></li>
            <li><a href="ViewNotification">&nbsp;&nbsp;&nbsp;Notifications 
                    <span class="badge new red" style="text-align:left;"><% out.print(ohs.getUpdateCount(session.getAttribute("userMail").toString())); %>
                    </span>
                </a>
            </li>
            <li class="divider"></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Operations</b>
            <li class="divider"></li>
            <li><a href="ViewCultivation">&nbsp;&nbsp;&nbsp;Cultivations</a></li>
            <li class="divider"></li>
            <li><a href="ManagePlantation">&nbsp;&nbsp;&nbsp;Manage</a></li>
            <li class="divider"></li>
            <li><a href="#!">&nbsp;&nbsp;&nbsp;Announce</a></li>
            <li class="divider"></li>
            <li><a href="Logout"><b>Logout</b></a></li>
            <li class="divider"></li>
        </ul>

        <% LoginModal lm = (LoginModal) request.getAttribute("user");%>
        <!-- contents -->
        <div class="container">
            <br class="hide-on-small-only">
            <div class="row card-panel no-shadow">
                <div class="col s12 m3">
                    <h3 class="pcol-text mt-0">Profile</h3>
                    <div class="col s12 m12">
                        <img class="responsive-img umg" src="./Assets/img/person_1.jpg" />
                        <a class="pcol-text" href="#!">change photo</a>
                    </div>
                    <div class="col s12 m12 center-align">
                        <h5 class="pcol-text"><%=lm.getUsName()%></h5>
                        <h6 class="pcol-text"><%
                            if (lm.getUsRole() == "1") {
                                out.print("Farm Owner");
                            } else {
                                out.print("Pineapple Dealer");
                            }

                            %><br> </h6>
                    </div>
                </div>

                <div class="col s12 m9">
                    <br><br>

                    <div class="no-shadow">
                        <table class="">
                            <tbody>
                                <tr>
                                    <td class="valign-wrapper">Address&nbsp;&nbsp;</td>
                                    <td><%=lm.getUsAddress()%></td>
                                </tr>
                                <tr>
                                    <td>Place</td>
                                    <td><%=lm.getUsPlace()%></td>
                                </tr>
                                <tr>
                                    <td>Phone</td>
                                    <td><%=lm.getUsPhone()%></td>
                                </tr>
                                <tr>
                                    <td>Mail Id</td>
                                    <td><%=lm.getUsMail()%></td>
                                </tr>
                                <tr>
                                    <td>Join Date</td>
                                    <td><%=lm.getUsJoinDate()%></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><a class="pcol-text" href="#!">edit details</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <%
                ohs.closeConnection();
            %>
        </div>
        <br class="hide-on-small-only">
        <!-- footer -->
        <footer class="page-footer white teal-text lighten-2 z-depth-3">
            <div class="center gotop">
                <a class="scroll btn-floating btn-large pcol">
                    <i class="large material-icons">keyboard_arrow_up</i>
                </a>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col l4 offset-l1 s12">
                        <h5 class="">About Pineapplify</h5>
                        <p class="grey-text text-justify">We majorly deal in helping pineapple cultivators to manage their
                            wide spread plantations by
                            giving correct information at correct time.</p>
                    </div>

                    <div class="col l4 s12 ">
                        <h5 class="">Have Questions?</h5>
                        <ul class="grey-text">
                            <li><img src="./Assets/img/add (3).png" alt="" width="14px">
                                <span class=""> Near Municipal Busbay, Thdupuzha, Kerala, India.</span>
                            </li>
                            <li><img src="./Assets/img/add (2).png" alt="" width="14px"><span class="text"> +2 392 3929210</span>
                            </li>
                            <li><img src="./Assets/img/add (1).png" alt="" width="14px"></span><span class="text">
                                    info@yourdomain.com</span></li>
                        </ul>
                    </div>
                    <div class="col l3 s12">
                        <h5>Menu</h5>
                        <ul class="">
                            <li><a class="grey-text" href="sass.html">Home</a></li>
                            <li><a class="grey-text" href="badges.html">About</a></li>
                            <li><a class="grey-text" href="collapsible.html">Contact US</a></li>
                            <li><a class="grey-text" href="mobile.html">Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright teal-text lighten-2">
                <div class="container center-align">
                    © 2020 All Rights Reserved By Pineapplify Pvt. Ltd.
                </div>
            </div>
        </footer>

        <!-- scripts -->
        <script type="text/javascript" src="./Assets/js/jquery-3.4.1.js"></script>
        <script type="text/javascript" src="./Assets/js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    type: "GET",
                    url: "ViewNotificationList",
                    success: function (data) {
                        $("#noti").html(data);
                    }
                });
            });
        </script>
        <script>
            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.parallax').parallax();
                $('.collapsible').collapsible();
                $('.dropdown-trigger').dropdown({alignment: 'right'});
                $('select').formSelect();
            });
            $(".scroll").click(function (e) {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });
        </script>
    </body>

</html>