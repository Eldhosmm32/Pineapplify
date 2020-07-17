<%-- 
    Document   : profile
    Created on : Apr 01, 2020, 8:01:08 PM
    Author     : user
--%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
    String name = (String) session.getAttribute("userName");
    if (name == "") {
        response.sendRedirect("./");
    }
%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean class="com.pineapplify.services.OwnerHomeServices" id="ohs"></jsp:useBean>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="./Assets/css/material.icons.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/owner.css" media="screen,projection" />
        <script type="text/javascript" src="./Assets/js/jquery-3.4.1.js"></script>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Home</title>
    </head>

    <body>
        <!-- navbar -->
        <div class="navbar-fixed">
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
        </div>

        <ul id="dropdown1" class="dropdown-content dpos">
            <li><a href="ManagePlantation">Manage</a></li>
            <li class="divider"></li>
            <li><a href="ViewCultivation">Cultivation</a></li>
            <li class="divider"></li>
            <li><a href="#!">Announce</a></li>
        </ul>

        <ul id="dropdown2" class="dropdown-content dpos">
            <li><a href="ViewProfile">Profile</a></li>
            <li class="divider"></li>
            <li><a href="Logout">Logout</a></li>
        </ul>

        <!-- sidebar -->
        <ul class="sidenav" id="mobile-demo">
            <br>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>${userName}</b>
            <li class="divider"></li>
            <li><a href="ViewProfile">&nbsp;&nbsp;&nbsp;Profile</a></li>
            <li class="divider"></li>
            <li><a href="ViewNotification">&nbsp;&nbsp;&nbsp;Notifications 
                    <span class="badge new red" style="text-align:left;"><% out.print(ohs.getUpdateCount(session.getAttribute("userMail").toString())); %>
                    </span>
                </a>
            </li>
            <li class="divider"></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Operations</b>
            <li class="divider"></li>
            <li><a href="ManagePlantation">&nbsp;&nbsp;&nbsp;Manage</a></li>
            <li class="divider"></li>
            <li><a href="ViewCultivation">&nbsp;&nbsp;&nbsp;Cultivation</a></li>
            <li class="divider"></li>
            <li><a href="#!">&nbsp;&nbsp;&nbsp;Announce</a></li>
            <li class="divider"></li>
	    <li><a href="Logout"><b>Logout</b></a></li>
            <li class="divider"></li>
        </ul>

        <!--notification drop-down-->
        <ul id="noti" class="dropdown-content dpos2">
            <li style="padding-top:7px"><h6>&nbsp;&nbsp;&nbsp;&nbsp;NOTIFICATIONS</h6></li>
            <li class="divider"></li>
        </ul>

        <!-- parallax -->
        <div class="parallax-container" style="height: 400px;">
            <div class="parallax"><img src="./Assets/img/para.jpg"></div>
        </div>

        <!-- contents -->
        <div class="container-fluid">
            <br class="hide-on-small-only">
            <div class="row">
                <div class="col s12 m3">
                    <div class="col s12 m12">
                        <div class="card">
                            <div class="card-content">
                                <h5 class="center-align pcol-text">Helpline</h5>
                                <ul class="collection with-header">

                                    <li class="collection-item"><b>Department of Agriculture Development and Farmers'
                                            Welfare</b></li>
                                    <li class="collection-item">Vikas Bhavan,</li>
                                    <li class="collection-item">Trivandram-695033</li>
                                    <li class="collection-item">0471 - 2304480, 2304481</li>
                                    <li class="collection-item">krishidirector@gmail.com</li>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col s12 m6">
                    <div class="col s12 m12">
                        <div class="card">
                            <div class="card-content">
                                <h5 class="center-align pcol-text">About Cultivation</h5>
                                <ul class="collection">
                                    <li class="collection-item">
                                        <p style="font-size: 15px;" class="text-justify">
                                            Pineapple is one of the commercially important fruit crops of India. It is one of the
                                            popular fruits all over the world because of its pleasant taste and flavor. Pineapple is
                                            a good source of vitamin A and B and fairly rich in vitamin C and minerals like calcium,
                                            magnesium, potassium, and iron. It is also a source of Bromelain, a digestive enzyme. In
                                            addition to being eaten fresh, the fruit can also be canned and processed in different
                                            forms. Total annual world production is estimated at 14.6 million tonnes of fruits.
                                            India is the fifth largest producer of pineapple with an annual output of about 1.2
                                            million tonnes.
                                        </p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m12">
                        <div class="card">
                            <div class="card-content">
                                <h5 class="center-align pcol-text">On going cultivations</h5>
                                <ul class="collection">
                                    <%
                                        ResultSet rs = ohs.loadOnGoing(session.getAttribute("userMail").toString());
                                        while (rs.next()) {
                                            out.print("<li class='collection-item avatar'>"
                                                    + "<i class='material-icons circle " + rs.getString("col_name") + "'>filter_vintage</i>"
                                                    + "<span class='title'><b>" + rs.getString("plt_name") + "</b></span>"
                                                    + "<p>Started Cultivation : " + ohs.convertDate(rs.getString("cul_start")) + "<br>"
                                                    + "Expected Harvest : " + ohs.convertDate(rs.getString("cul_rot1")) + "<br>"
                                                    + "Current Status : " + ohs.fromStartToNow(rs.getString("cul_start")) + ""
                                                    + " </p>"
                                                    + " <a class='secondary-content hide-on-small-only'><i class='material-icons'>filter_vintage</i></a>"
                                                    + "</li>");
                                        }
                                    %>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col s12 m3">
                    <div class="col s12 m12">
                        <div class="card">
                            <div class="card-content">
                                <h5 class="center-align pcol-text">Weather</h5>
                                <ul class="collection with-header">
                                    <li class="collection-item pad-0">
                                        <a class="weatherwidget-io" href="https://forecast7.com/en/10d8576d27/kerala/"
                                           data-theme="pure" data-label_1="KERALA" data-mode="Current"></a>
                                        <script>
                                            !function (d, s, id) {
                                                var js, fjs = d.getElementsByTagName(s)[0];
                                                if (!d.getElementById(id)) {
                                                    js = d.createElement(s);
                                                    js.id = id;
                                                    js.src = 'https://weatherwidget.io/js/widget.min.js';
                                                    fjs.parentNode.insertBefore(js, fjs);
                                                }
                                            }(document, 'script', 'weatherwidget-io-js');
                                        </script>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col s12 m12">
                        <div class="card">
                            <div class="card-content">
                                <h5 class="center-align"><a class="pcol-text" href="http://www.vfpck.org/vegprice.asp?ID=55">Market Prize</a></h5>
                                <ul class="collection with-header">
                                    <%
                                        ArrayList<String> market = ohs.getMarketPrice();
                                        for (String i : market) {
                                            out.print("<li class='collection-item'>" + i + "</li>");
                                        }

                                    %>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
            $(".scroll").click(function () {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });
            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.parallax').parallax();
                $('.collapsible').collapsible();
                $('.dropdown-trigger').dropdown({
                    alignment: 'right'
                });
            });
        </script>
        <script type="text/javascript" src="./Assets/js/materialize.min.js"></script>
    </body>

</html>