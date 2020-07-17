<%-- 
    Document   : ShowProcessList
    Created on : Jul 10, 2020, 6:04:55 PM
    Author     : user
--%>
<meta http-equiv="refresh" content="30" />
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="com.pineapplify.services.AdminServices" id="ads"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>
<br>
<div class="container" onload="function timedRefresh() {setTimeout("location.reload(true);",1000);}">
    <%
        int count = 0;
        ResultSet rs = ads.ProcessList();
        while (rs.next()) {
            count++;
        }
    %>
    <h2>Total Process Count: <%=count%></h2>

    <%
        int count1 = 0;
        ResultSet rs1 = ads.ProcessList();
        while (rs1.next()) {
            if (Integer.parseInt(rs1.getString("time")) > 200) {
                ads.killConnections(rs1.getString("id"));
                count1++;
            }
        }
    %>

    <h2>Killed Process > 200s: <%=count1%></h2>
    <%
        ads.closeConnection();
    %>
</div>

<script>
    setTimeout(function () {
        window.location.reload(1);
    }, 30000);
</script>
<jsp:include page="footer.jsp"/>
