<%-- 
    Document   : Cultivation
    Created on : Apr 25, 2020, 2:54:26 PM
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
<jsp:useBean class="com.pineapplify.services.CultivationServices" id="cs"></jsp:useBean>
<jsp:useBean class="com.pineapplify.services.OwnerHomeServices" id="ohs"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

        <!--Import materialize.css-->
        <link href="./Assets/css/material.icons.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/owner.css" media="screen,projection" />


        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Cultivation</title>
    </head>

    <body>
        <!-- navbar -->
        <nav class="navbar navbgcol white" id="navi">
            <div class="container nav-wrapper">
                <a href="#!" class="brand-logo">
                    <img class="materialboxed logos" width="200" src="./Assets/img/logo.png">
                </a>
                <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i
                        class="material-icons navulcol">menu</i></a>
                <ul class="right hide-on-med-and-down ul-style2">
                    <li><a href="#" class="dropdown-trigger" data-target="noti"><i class="material-icons pcol-text" style="position: absolute;">notifications</i><small
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
            <li><a href="#!">Announce</a></li>
        </ul>

        <ul id="dropdown2" class="dropdown-content dpos">
            <li><a href="Login">Home</a></li>
            <li class="divider"></li>
            <li><a href="ViewProfile">Profile</a></li>
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
            <li><a href="ManagePlantation">&nbsp;&nbsp;&nbsp;Manage</a></li>
            <li class="divider"></li>
            <li><a href="#!">&nbsp;&nbsp;&nbsp;Announce</a></li>
            <li class="divider"></li>
            <li><a href="Logout"><b>Logout</b></a></li>
            <li class="divider"></li>
        </ul>

        <!-- contents -->
        <br class="hide-on-small-only">
        <div class="container eheight">
            <div class="row  card-panel">
                <div class="col s12 m12 l12">
                    <h3 class="mt-0 mb-0 pcol-text">Cultivations</h3>
                    <span>Here you can mange the cultivation details.</span>
                </div>
                <%
                    int count = (Integer) cs.loadPlantationCount(session.getAttribute("userMail").toString());
                    if (count < 1) {
                        out.print("<div class='col s12 m12 l12 boxer'>"
                                + "<table class='col s12 m12 l12 bordered highlight'>"
                                + "<tbody>"
                                + "<h3 class='pcol-text center-align'>N/A</h3><br>"
                                + "</tbody>"
                                + "</table></div>");

                    } else {
                        ResultSet rs = cs.loadPlantationDetails(session.getAttribute("userMail").toString());
                        while (rs.next()) {
                            String plantation = rs.getString("plt_name");
                            String id = rs.getString("plt_id");
                            out.print("<div class='col s12 m12 l12 boxer'>"
                                    + "<table class='col s12 m12 l12 bordered highlight'>"
                                    + "<tbody>"
                                    + "<tr>"
                                    + "<td colspan='2'>"
                                    + "<h4 class='pr-0 mt-0 mb-0 pcol-text col'>" + plantation + "</h4>"
                                    + "<span class='col pl-0 boxer-txt'>@" + rs.getString("plc_name") + "</span>"
                                    + "<div class='left'>"
                                    + "<img class='col boxer-img' src='./Assets/img/pineapple.png' height=20>"
                                    + "<span class='col pl-0 boxer-txt'>" + rs.getString("ver_name") + "</span>"
                                    + "<img class='col boxer-img' src='./Assets/img/farmer.png' height=20>"
                                    + "<span class='col pl-0 boxer-txt'>" + rs.getString("wrk_name") + "</span>"
                                    + "<img class='col boxer-img' src='./Assets/img/calendar.png' height=20>"
                                    + "<span class='col pl-0 boxer-txt'>" + cs.convertDate(rs.getString("plt_date")) + "</span>"
                                    + "</div>"
                                    + "</td>"
                                    + "</tr>"
                                    + "</tbody>"
                                    + "</table>");

                            ResultSet rs1 = cs.loadPlantationIntervals(session.getAttribute("userMail").toString(), plantation);
                            out.print("<table class='col s12 m12 l4 highlight boxer-tbl'>"
                                    + "<tbody>"
                                    + "<tr>"
                                    + "<td colspan='2'>"
                                    + "<h5 class='pr-0 mt-0 mb-0 pcol-text col'>Intervals<i class='material-icons'>timelapse</i></h5>"
                                    + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Manuring</td>"
                                    + "<td class='boxer-td'>" + rs1.getString("int_manuring") + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Cleaning</td>"
                                    + "<td class='boxer-td'>" + rs1.getString("int_cleaning") + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Checking</td>"
                                    + "<td class='boxer-td'>" + rs1.getString("int_checking") + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Watering</td>"
                                    + "<td class='boxer-td'>" + rs1.getString("int_watering") + "</td>"
                                    + "</tr>"
                                    + "</tbody>"
                                    + "</table>");
                            String m, cl, ch, wa;
                            if (cs.loadUpcomingEvents("Manuring", id) == null) {
                                m = "N/A";
                                cl = "N/A";
                                ch = "N/A";
                                wa = "N/A";
                            } else {
                                m = cs.convertDate(cs.loadUpcomingEvents("Manuring", id));
                                cl = cs.convertDate(cs.loadUpcomingEvents("Cleaning", id));
                                ch = cs.convertDate(cs.loadUpcomingEvents("Checking", id));
                                wa = cs.convertDate(cs.loadUpcomingEvents("Watering", id));
                            }
                            out.print("<table class='col s12 m12 l4 highlight boxer-tbl'>"
                                    + "<tbody>"
                                    + "<tr>"
                                    + "<td colspan='2'>"
                                    + "<h5 class='pr-0 mt-0 mb-0 pcol-text col'>Upcoming<i class='material-icons md-18'>alarm</i></h5>"
                                    + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Manuring</td>"
                                    + "<td class='boxer-td'>" + m + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Cleaning</td>"
                                    + "<td class='boxer-td'>" + cl + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Checking</td>"
                                    + "<td class='boxer-td'>" + ch + "</td>"
                                    + "</tr>"
                                    + "<tr>"
                                    + "<td class='boxer-td'>Watering</td>"
                                    + "<td class='boxer-td'>" + wa + "</td>"
                                    + "</tr>"
                                    + "</tbody>"
                                    + "</table>");

                            out.print("<table class='col s12 m12 l4 bordered highlight '>"
                                    + "<tbody>"
                                    + "<tr>"
                                    + "<td colspan='2'>"
                                    + "<h5 class='pr-0 mt-0 mb-0 pcol-text col'>History<i class='material-icons md-18'>history </i></h5>"
                                    + "</td>"
                                    + "</tr>");
                            rs1.close();
                            ResultSet rs2 = cs.loadLastEvents(id);
                            String icon = "", col = "";
                            int row = 0;

                            while (rs2.next()) {
                                row = rs2.getRow();
                                if (rs2.getString("dat_status").equals("1")) {
                                    col = "green-text";
                                    icon = "check_circle";
                                }
                                if (rs2.getString("dat_status").equals("2")) {
                                    col = "red-text";
                                    icon = "cancel";
                                }
                                out.print("<tr><td class='boxer-td'>" + rs2.getString("dat_cat") + " on " + cs.convertDate(rs2.getString("dat_date")) + "<i class='material-icons " + col + " icn_tbl right'>" + icon + "</i></td></tr>");
                            }
                            rs2.close();
                            for (int i = 0; i < 4 - row; i++) {
                                out.print("<tr><td class='boxer-td'>N/A</td></tr>");
                            }

                            out.print("</tbody>"
                                    + "</table>");

                            out.print("<table class='col s12 m12 l12 bordered highlight'>"
                                    + "<tbody>"
                                    + "<tr>"
                                    + "<td class='boxer-td right' colspan='2'>"
                                    + "<form action='ViewPlantation' method='post'>"
                                    + "<input type='hidden' value=" + id + " name='plantation'>"
                                    + "<input class='waves-effect waves-light btn-flat' type='submit' value='Goto Details'></form>"
                                    + "</td>"
                                    + "</tr>"
                                    + "</tbody>"
                                    + "</table>"
                                    + "</div>"
                            );
                        }
                        rs.close();
                        cs.closeConnection();
                        ohs.closeConnection();
                    }

                %>
            </div>            
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
                            <li><img src="./Assets/img/add (2).png" alt="" width="14px"><span class="text"> +2 392
                                    3929210</span>
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
            });
            $(".scroll").click(function (e) {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });
        </script>
    </body>

</html>