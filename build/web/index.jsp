<%-- 
    Document   : index
    Created on : 04.06.2016, 18:26:21
    Author     : olli
--%>

<%@page pageEncoding="cp1251" contentType="text/html; charset=cp1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:set var='view' value='/index' scope='session'/>

<div id="indexLeftColumn">
    <div id="welcomeText">
        <p style="font-size: larger"><fmt:message key='greeting'/></p>

        <p><fmt:message key='introText' /></p>
    </div>
</div>

<div id="indexRightColumn">
    <c:forEach var="category" items="${categories}">
        <div class="categoryBox">
            <a href="<c:url value='category?${category.id}'/>">
                <span class="categoryLabel"></span>
                <span class="categoryLabelText"><fmt:message key='${category.name}'/></span>

                <img src="${initParam.categoryImagePath}${category.name}.jpg"
                     alt="<fmt:message key='${category.name}'/>" class="categoryImage">
            </a>
        </div>
    </c:forEach>
</div>

