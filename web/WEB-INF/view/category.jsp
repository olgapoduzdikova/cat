<%-- 
    Document   : category
    Created on : 04.06.2016, 20:39:10
    Author     : olli
--%>

<%@page pageEncoding="cp1251" contentType="text/html; charset=cp1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:set var='view' value='/category' scope='session' />

<div id="categoryLeftColumn">

    <c:forEach var="category" items="${categories}">

        <c:choose>
            <c:when test="${category.name == selectedCategory.name}">
                <div class="categoryButton" id="selectedCategory">
                    <span class="categoryText">
                        <fmt:message key="${category.name}"/>
                    </span>
                </div>
            </c:when>
            <c:otherwise>
                <a href="<c:url value='category?${category.id}'/>" class="categoryButton">
                    <span class="categoryText">
                        <fmt:message key="${category.name}"/>
                    </span>
                </a>
            </c:otherwise>
        </c:choose>

    </c:forEach>

</div>

<div id="categoryRightColumn">

    <p id="categoryTitle"><fmt:message key="${selectedCategory.name}" /></p>

    <table id="productTable">

        <c:forEach var="product" items="${categoryProducts}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                <td>
                    <img src="${initParam.productImagePath}${product.name}.png"
                         alt="<fmt:message key='${product.name}'/>">
                </td>

                <td>
                    <fmt:message key="${product.name}"/>
                    <br>
                    <span class="smallText"><fmt:message key='${product.name}Description'/></span>
                </td>

                <td><fmt:formatNumber type="currency" currencySymbol="&euro; " value="${product.price}"/></td>

                <td>
                    <form action="<c:url value='addToCart'/>" method="post">
                        <input type="hidden"
                               name="productId"
                               value="${product.id}">
                        <input type="submit"
                               name="submit"
                               value="<fmt:message key='addToCart'/>">
                    </form>
                </td>
            </tr>

        </c:forEach>

    </table>
</div>