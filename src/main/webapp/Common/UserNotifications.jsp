<%-- 
    Document   : UserNotifications
    Created on : Jul 10, 2020, 9:56:20 PM
    Author     : user
--%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store,must-revalidate");
    String name = (String) session.getAttribute("userName");
    if (name == "") {
        response.sendRedirect("./");
    }
%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="com.pineapplify.services.OwnerHomeServices" id="ohs"></jsp:useBean>
<jsp:useBean class="com.pineapplify.services.NotificationServices" id="ns"></jsp:useBean>

    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
            <!--Import materialize.css-->
            <link type="text/css" rel="stylesheet" href="./Assets/css/material.icons.css" rel="stylesheet">
            <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
            <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
            <link type="text/css" rel="stylesheet" href="./Assets/css/owner.css" media="screen,projection" />
            <!--Let browser know website is optimized for mobile-->
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <title>Home</title>
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
                        <li><a href="#" class="dropdown-trigger" data-target="noti"><i class="material-icons pcol-text" style="position: absolute;">notifications</i>
                                <small class="notification-badge"> <% out.print(ohs.getUpdateCount(session.getAttribute("userMail").toString()));%> </small>
                        </a>
                    </li>
                    <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown1">Operations<i class="material-icons right">arrow_drop_down</i></a>
                    </li>
                    <li><a class="dropdown-trigger pcol-text" href="#!" data-target="dropdown2">${userName}<i class="material-icons right">arrow_drop_down</i></a>
                    </li>
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
            <li><a href="ViewCultivation">Cultivation</a></li>
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
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Operations</b></li>
            <li class="divider"></li>
            <li><a href=ManagePlantation>&nbsp;&nbsp;&nbsp;Manage</a></li>
            <li class="divider"></li>
            <li><a href="ViewCultivation">&nbsp;&nbsp;&nbsp;Cultivation</a></li>
            <li class="divider"></li>
            <li><a href="#!">&nbsp;&nbsp;&nbsp;Announce</a></li>
            <li class="divider"></li>
            <li><a href="Logout"><b>Logout</b></a></li>
            <li class="divider"></li>
        </ul>

        <!-- contents -->
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l6">
                    <div class="card">
                        <div class="card-content">
                            <h5 class="center-align pcol-text">Notification (<span id="datetime"></span>)</h5>
                            <%
                                ResultSet rs = ohs.getUpdate(session.getAttribute("userMail").toString());
                                Boolean f = true;
                                if (rs.first() == false) {
                                    f = false;
                                    out.print("<table class='striped'><tbody><tr>"
                                            + "<td><i class='material-icons'>filter_drama</i></td>"
                                            + "<td>No Notifications</td>"
                                            + "<td></td>"
                                            + "<td></td>"
                                            + "</tr></tbody></table>");

                                } else {
                                    rs.first();
                                    out.print("<table class='highlight'><thead><tr><th></th><th></th><th></th><th></th></tr></thead><tbody>");
                                }
                                do {
                                    if (f == true) {
                                        out.print("<tr>"
                                                + "<td><i class='material-icons " + rs.getString("col_name") + "-text'>filter_vintage</i></td>"
                                                + "<td>" + rs.getString("dat_cat") + " on " + rs.getString("plt_name") + "</td>"
                                                + "<td><form action='ViewNotification' method='post'>"
                                                + "<input type='hidden' value=" + rs.getString("dat_id") + " name='id'>"
                                                + "<input type='hidden' name='done'>"
                                                + "<button class='btn-floating btn-flat green btn-small' type='submit'><i class='material-icons'>check</i></button></form></td>"
                                                + "<td><form action='ViewNotification' method='post'>"
                                                + "<input type='hidden' value=" + rs.getString("dat_id") + " name='id'>"
                                                + "<input type='hidden' name='ignore'>"
                                                + "<button class='btn-floating btn-flat red btn-small' type='submit'><i class='material-icons'>close</i></a></button></form></td>"
                                                + "</tr>");
                                    }
                                } while (rs.next());
                                out.print("</tbody></table>");
                                rs.close();
                            %>
                        </div>
                    </div>

                </div>
                <div class="col s12 m12 l6">
                    <div class="card">
                        <div class="card-content">
                            <h5 class="center-align pcol-text">Pending Works</h5>
                            <%
                                ResultSet rs1 = ns.loadLongPending(session.getAttribute("userMail").toString());
                                f = true;
                                if (rs1.first() == false) {
                                    f = false;
                                    out.print("<table class='striped'><tbody><tr>"
                                            + "<td><i class='material-icons'>filter_drama</i></td>"
                                            + "<td>No Pending Works</td>"
                                            + "<td></td>"
                                            + "<td></td>"
                                            + "</tr></tbody></table>");
                                } else {
                                    rs1.first();
                                    out.print("<table class='highlight'><thead><tr><th></th><th></th><th></th><th></th></tr></thead><tbody>");
                                }
                                do {
                                    if (f == true) {
                                        out.print("<tr>"
                                                + "<td><i class='material-icons  " + rs1.getString("col_name") + "-text'>filter_vintage</i></td>"
                                                + "<td>" + rs1.getString("dat_cat") + " on " + rs1.getString("plt_name") + "</td>"
                                                + "<td><form action='ViewNotification' method='post'>"
                                                + "<input type='hidden' value=" + rs1.getString("dat_id") + " name='id'>"
                                                + "<input type='hidden' name='done'>"
                                                + "<button class='btn-floating btn-flat green btn-small' type='submit'><i class='material-icons'>check</i></button></form></td>"
                                                + "<td><form action='ViewNotification' method='post'>"
                                                + "<input type='hidden' value=" + rs1.getString("dat_id") + " name='id'>"
                                                + "<input type='hidden' name='ignore'>"
                                                + "<button class='btn-floating btn-flat red btn-small' type='submit'><i class='material-icons'>close</i></a></button></form></td>"
                                                + "</tr>");
                                    }
                                } while (rs1.next());
                                out.print("</tbody></table>");
                                rs1.close();
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--                        "<label>System assigned date is " + rs1.getString("dat_date") + ", If you missed please update here.</label>"-->
        <%
            ohs.closeConnection();
            ns.closeConnection();
        %>

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
            var dt = new Date();
            document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
        </script>
        <script type="text/javascript" >
            $(".scroll").click(function (e) {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });
            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.collapsible').collapsible();
                $('.dropdown-trigger').dropdown({alignment: 'right'});
            });
        </script>
    </body>

</html>