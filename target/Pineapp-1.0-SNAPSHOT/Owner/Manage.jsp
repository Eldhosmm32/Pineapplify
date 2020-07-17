<%-- 
    Document   : Manages
    Created on : Apr 24, 2020, 9:37:38 PM
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
<jsp:useBean class="com.pineapplify.services.ManageServices" id="ms"></jsp:useBean>
<jsp:useBean class="com.pineapplify.services.OwnerHomeServices" id="ohs"></jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="./Assets/css/material.icons.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="./Assets/css/materialize.min.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/common.css" media="screen,projection" />
        <link type="text/css" rel="stylesheet" href="./Assets/css/owner.css" media="screen,projection" />

        <!--Let browser know website is optimized for mobile-->
        <title>Manage</title>
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
                    <li><a href="#!" class="dropdown-trigger" data-target="noti"><i class="material-icons pcol-text" style="position: absolute;">notifications</i><small
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
            <li><a href="ViewCultivation">&nbsp;&nbsp;&nbsp;Cultivation</a></li>
            <li class="divider"></li>
            <li><a href="#!">&nbsp;&nbsp;&nbsp;Announce</a></li>
            <li class="divider"></li>
            <li><a href="Logout"><b>Logout</b></a></li>
            <li class="divider"></li>
        </ul>

        <!-- contents -->
        <br class="hide-on-small-only">
        <div class="container">
            <div class="row">
                <div class="col s12 m12 l12">
                    <div class="card-panel">
                        <h3 class="pcol-text mt-0 mb-0">Manage console</h3>
                        <p>Plantation details will display here. You can also mange the basic details of plantation, worker,
                            place.</p>
                    </div>
                </div>
                <div class="col s12 m12 l4">
                    <div class="card-panel">
                        <div class="row mb-0">
                            <h6 class="col m12 s12 pcol-text mt-0">Plantations registered</h6>
                            <div class="col s12 m12 pad-0">
                                <%
                                    ResultSet rs2 = (ResultSet) ms.loadPlantDrop(session.getAttribute("userMail").toString());
                                    Boolean f = true;
                                    if (rs2.first() == false) {
                                        f = false;
                                        out.print("<span class='badge new pcol white-text left' data-badge-caption='Nothing to show.'></span>");
                                    } else {
                                        rs2.first();
                                    }
                                    do {
                                        if (f == true) {
                                            out.print("<a href=EditPlantation?pname=" + rs2.getString("plt_id") + "><span class='badge new " + rs2.getString("col_name") + " white-text left' data-badge-caption=" + rs2.getString("plt_name") + "></span></a>");
                                        }
                                    } while (rs2.next());
                                    rs2.close();
                                %>
                            </div>
                            <h6 class="col m12 s12 pcol-text">Workers registered</h6>
                            <div class="col s12 m12 pad-0">
                                <%
                                    rs2.close();
                                    ResultSet rs4 = (ResultSet) ms.loadWorker(session.getAttribute("userMail").toString());
                                    f = true;
                                    if (rs4.first() == false) {
                                        f = false;
                                        out.print("<span class='badge new pcol white-text left' data-badge-caption='Nothing to show.'></span>");
                                        out.print("<span class='badge new yellow darken-3 white-text left' data-badge-caption='Worker is needed to add a planation.'></span>");
                                    } else {
                                        rs4.first();
                                    }
                                    do {
                                        if (f == true) {
                                            out.print("<a href=EditWorker?wname=" + rs4.getString("wrk_id") + "><span class='badge new pcol white-text left' data-badge-caption=" + rs4.getString("wrk_name") + "></span></a>");
                                        }
                                    } while (rs4.next());
                                    rs4.close();
                                %>
                            </div>
                        </div>
                    </div>
                    <ul class="collapsible">
                        <li>
                            <div class="collapsible-header"><i class="material-icons">add_circle_outline</i>New plantation
                            </div>
                            <div class="collapsible-body white">
                                <form method="post" action="AddPlantation"  id="a" class="row mb-0">
                                    <h5 class="col m12 s12 pcol-text mt-0">Please fill the following</h5>
                                    <label>* Unavailable place can add from <i class="material-icons tiny">add_circle_outline</i> New place</label><br>
                                    <label>* Worker can be add from <i class="material-icons tiny">add_circle_outline</i> New worker</label><br>
                                    <label>* Worker is a must to add plantation</label><br>
                                    <div class="input-field col s12 m12">
                                        <select class="browser-default" name="verity" required>
                                            <option value="" disabled selected>Pineapple verity</option>
                                            <%                                                ResultSet rs1 = (ResultSet) ms.loadVerities();
                                                f = true;
                                                if (rs1.first() == false) {
                                                    f = false;
                                                } else {
                                                    rs1.first();
                                                }
                                                do {
                                                    if (f == true) {
                                                        out.print("<option data-icon='./Assets/img/pineapple.png' value=" + rs1.getString("ver_id") + " class='left'>" + rs1.getString("ver_name") + "</option>");
                                                    }
                                                } while (rs1.next());
                                                rs1.close();
                                            %>
                                        </select>
                                    </div>

                                    <div class="input-field col s12 m12">
                                        <select class="browser-default" name="place" required>
                                            <option value="" disabled selected>Place situated</option>
                                            <%
                                                ResultSet rs3 = (ResultSet) ms.loadPlaceDop();
                                                f = true;
                                                if (rs3.first() == false) {
                                                    f = false;
                                                } else {
                                                    rs3.first();
                                                }
                                                do {
                                                    if (f == true) {
                                                        out.print("<option  value=" + rs3.getString("plc_id") + " class='left'>" + rs3.getString("plc_name") + "</option>");
                                                    }
                                                } while (rs3.next());
                                                rs3.close();
                                            %>
                                        </select>

                                    </div>

                                    <div class="input-field col s12 m12">
                                        <select class="browser-default" name="worker" required>
                                            <option value="" disabled selected>Caring worker</option>
                                            <%
                                                ResultSet rs7 = (ResultSet) ms.loadWorker(session.getAttribute("userMail").toString());
                                                f = true;
                                                if (rs7.first() == false) {
                                                    f = false;
                                                } else {
                                                    rs7.first();
                                                }
                                                do {
                                                    if (f == true) {
                                                        out.print("<option  value=" + rs7.getString("wrk_id") + " class='left'>" + rs7.getString("wrk_name") + "</option>");
                                                    }
                                                } while (rs7.next());
                                                rs7.close();
                                            %>
                                        </select>

                                    </div>

                                    <div class="input-field col s12 m12">
                                        <select class="browser-default" name="color" required>
                                            <option value="" disabled selected>Color label</option>
                                            <%
                                                ResultSet rs6 = (ResultSet) ms.loadColor();
                                                f = true;
                                                if (rs6.first() == false) {
                                                    f = false;
                                                } else {
                                                    rs6.first();
                                                }
                                                do {
                                                    if (f == true) {
                                                        out.print("<option  value=" + rs6.getString("col_id") + " class='left'>" + rs6.getString("col_name") + "</option>");
                                                    }
                                                } while (rs6.next());
                                                rs6.close();
                                            %>
                                        </select>

                                    </div>
                                    <div class="input-field col s12">
                                        <input type="submit" class="waves-effect col s12 waves-light pcol btn" value="Add">
                                    </div>

                                </form>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">add_circle_outline</i>New place
                            </div>
                            <div class="collapsible-body white">
                                <form method="POST" action="AddPlace" class="row mb-0">
                                    <h5 class="col m12 s12 pcol-text mt-0">Please fill the following</h5>
                                    <div class="input-field col s12 m12">
                                        <select class="browser-default" name="district" required>
                                            <option value="" disabled selected> Choose district</option>
                                            <option value="Thiruvananthapuram" class="left">Thiruvananthapuram</option>
                                            <option value="Kollam" class="left">Kollam</option>
                                            <option value="Pathanamthitta" class="left">Pathanamthitta</option>
                                            <option value="Alappuzha" class="left">Alappuzha</option>
                                            <option value="Kottayam" class="left">Kottayam</option>
                                            <option value="Idukki" class="left">Idukki</option>
                                            <option value="Ernakulam" class="left">Ernakulam</option>
                                            <option value="Thrissur" class="left">Thrissur</option>
                                            <option value="Palakkad" class="left">Palakkad</option>
                                            <option value="Malappuram" class="left">Malappuram</option>
                                            <option value="Wayanad" class="left">Wayanad</option>
                                            <option value="Kozhikode" class="left">Kozhikode</option>
                                            <option value="Kannur" class="left">Kannur</option>
                                            <option value="Kasaragod" class="left">Kasaragod</option>
                                        </select>
                                    </div>
                                    <div class="input-field col s12 m12">
                                        <input type="text" name="place" placeholder="Type place" class="c-txt" id="place" required>
                                        <label for="place">Place name</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <input type="submit" class="waves-effect col s12 waves-light pcol btn" value="Add">
                                    </div>
                                </form>
                            </div>
                        </li>
                        <li>
                            <div class="collapsible-header"><i class="material-icons">add_circle_outline</i>New worker</div>
                            <div class="collapsible-body white">
                                <form method="POST" action="AddWorker" class="row mb-0">
                                    <h5 class="col m12 s12 pcol-text mt-0">Please fill the following</h5>
                                    <div class="input-field col s12 m12">
                                        <input type="text" placeholder="Type name" class="c-txt" name="workername" id="workername" required>
                                        <label for="workername">Worker name</label>
                                    </div>
                                    <div class="input-field col s12 m12">
                                        <input type="text" placeholder="Type phone" class="c-txt" name="workerphone" value="9633422518" id="workerphone" required>
                                        <label for="workerphone">Worker phone</label>
                                    </div>
                                    <div class="input-field col s12">
                                        <input type="submit" class="waves-effect col s12 waves-light pcol btn" value="Add">
                                    </div>
                                </form>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col s12 m12 l8">
                    <div class="row">
                        <%
                            ResultSet rs = ms.loadPlantation(session.getAttribute("userMail").toString());
                            f = true;
                            if (rs.first() == false) {
                                f = false;
                                out.print("<div class='col s12 m6 l6'><div class='card white'><div class='card-content pcol-txt center-align'><br><h3 class='pcol-text mt-0'>N/A</h3><br></div></div></div>");
                            } else {
                                rs.first();
                            }
                            do {
                                if (f == true) {
                                    out.print("<div class='col s12 m6 l6'><div class='card white'><div class='card-content pcol-txt'><h4 class='pcol-text mt-0'>" + rs.getString("plt_name") + "</h4>");
                                    out.print("<table><tbody><tr><td>Situated</td><td>");
                                    out.print(rs.getString("plc_name"));
                                    out.print("</td></tr>");
                                    out.print("<tr><td>Verity</td><td>");
                                    out.print(rs.getString("ver_name"));
                                    out.print("</td></tr>");
                                    out.print("<tr><td>Added on</td><td>");
                                    out.print(rs.getString("plt_date"));
                                    out.print("</td></tr>");
                                    out.print("<tr><td>Worker</td><td>");
                                    out.print(rs.getString("wrk_name"));
                                    out.print("</td></tr>");
                                    out.print("<tr><td>");
                                    out.print("<a href=EditPlantation?pname=" + rs.getString("plt_id") + ">Edit</a></td><td>");
                                    out.print("</td>");
                                    out.print("</tr></tbody></table></div></div></div>");
                                }
                            } while (rs.next());
                            rs.close();
                            ms.closeConnection();
                            ohs.closeConnection();
                        %>
                    </div>
                </div>
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
        <script type="text/javascript" src="./Assets/js/sweetalert.min.js"></script>
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
        <script type="text/javascript">
            if (window.history.replaceState) {
                window.history.replaceState(null, null, "ManagePlantation");
            }

            $(document).ready(function () {
                $('.sidenav').sidenav();
                $('.dropdown-trigger').dropdown({alignment: 'right'});
                $('select').formSelect();
                $('.collapsible').collapsible();
            });


            $(document).click(function () {
                $('li[id^="select-options"]').on('touchend', function (e) {
                    e.stopPropagation();
                });
            });

            $(".scroll").click(function (e) {
                $('html, body').animate({scrollTop: 0}, 'slow');
            });
        </script>
    </body>
</html>
