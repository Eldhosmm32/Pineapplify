<%-- 
    Document   : PendingWorks
    Created on : Jul 10, 2020, 4:04:42 PM
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="com.pineapplify.services.AdminServices" id="ads"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<br>
<div class="container">
    <div class="row">
        <h4>Pending works of (<span id="datetime"></span>)</h4>

        <br>
        <select class="browser-default col l3" name="User" id="User" size="0" required>
            <option value="0" selected>Users</option>
            <%
                ResultSet rs = ads.loadUsers();
                while (rs.next()) {
                    out.print("<option value=" + rs.getString("us_mail") + ">" + rs.getString("us_name") + "</option>");
                }
                rs.close();
            %>
        </select>

        <select class="browser-default col l3 offset-l1" name="Plantation" id="Plantation">
            <option value="0">Plantation Name</option>
        </select>
    </div>
    <div class="row">
        <ul class="collection col l4 white" id="Dates" style="padding: 0px">
            <a class="collection-item"><h6 class="pcol-text">Pending Today</h6></a>
            <%
                ResultSet rs1 = ads.loadPendingActivities(null);
                while (rs1.next()) {
                    out.print("<li class='collection-item avatar'>"
                            + "<img src='../Assets/img/farmer.png' alt='' class='circle'>"
                            + "<span class='title'><b>" + rs1.getString("us_name") + "</b></span>"
                            + "<p>" + rs1.getString("plt_name") + " - " + rs1.getString("dat_cat") + "<br>"
                            + "@ " + rs1.getString("plc_name") + ""
                            + "</p></li>");
                }
                rs1.close();
            %>
        </ul>
    </div>
</div>
<%
    ads.closeConnection();
%>

<script>
    var dt = new Date();
    document.getElementById("datetime").innerHTML = dt.toLocaleDateString();
</script>
<script type="text/javascript">
    $user = $("#User");
    $plantation = $("#Plantation");
    $dates = $("#Dates");

    $user.change(function () {
        $.ajax({
            type: "GET",
            url: "../AdminDateCheck",
            data: {
                user: $user.val()
            },
            success: function (data) {
                $("#Plantation").html(data);
            }
        });
    });

    $plantation.change(function () {
        $.ajax({
            type: "GET",
            url: "../AdminPendingActivities",
            data: {
                plantation: $plantation.val()
            },
            success: function (data) {
                $("#Dates").html(data);
            }
        });
    });

</script>

<jsp:include page="footer.jsp"/>
