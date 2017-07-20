<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<h2>Hello World!</h2>

<c:forEach items="${zones}" var="zone">
    ${zone.zoneid}/${zone.zonename}/${zone.isdef}
</c:forEach>
</body>
</html>
