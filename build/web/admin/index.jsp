<%@page pageEncoding="cp1251" contentType="text/html; charset=cp1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<div id="adminMenu" class="alignLeft">
    <p><a href="<c:url value='viewCustomers'/>">Просмотр всех покупателей</a></p>

    <p><a href="<c:url value='viewOrders'/>">Просмотр всех заказов</a></p>
    
    <p><a href="<c:url value='logout'/>">Выход</a></p>
</div>

<%-- customerList is requested --%>
<c:if test="${!empty customerList}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="4">Покупатели</th>
        </tr>

        <tr class="tableHeading">
            <td>№</td>
            <td>Имя</td>
            <td>email</td>
            <td>Телефон</td>
        </tr>

        <c:forEach var="customer" items="${customerList}" varStatus="iter">

            <tr class="${((iter.index % 2) == 1) ? 'lightBlue' : 'white'} tableRow"
                onclick="document.location.href='customerRecord?${customer.id}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.id}</a></td>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.name}</a></td>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.email}</a></td>
                <td><a href="customerRecord?${customer.id}" class="noDecoration">${customer.phohe}</a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<%-- orderList is requested --%>
<c:if test="${!empty orderList}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="4">Заказы</th>
        </tr>

        <tr class="tableHeading">
            <td>№</td>
            <td>Код заказа</td>
            <td>Сумма</td>
            <td>Дата создания</td>
        </tr>

        <c:forEach var="order" items="${orderList}" varStatus="iter">

            <tr class="${((iter.index % 2) == 1) ? 'lightBlue' : 'white'} tableRow"
                onclick="document.location.href='orderRecord?${order.id}'">

              <%-- Below anchor tags are provided in case JavaScript is disabled --%>
                <td><a href="orderRecord?${order.id}" class="noDecoration">${order.id}</a></td>
                <td><a href="orderRecord?${order.id}" class="noDecoration">${order.confirmationNumber}</a></td>
                <td><a href="orderRecord?${order.id}" class="noDecoration">
                        <fmt:formatNumber type="currency"
                                          currencySymbol="&euro; "
                                          value="${order.amont}"/></a></td>

                <td><a href="orderRecord?${order.id}" class="noDecoration">
                        <fmt:formatDate value="${order.dateCreated}"
                                        type="both"
                                        dateStyle="short"
                                        timeStyle="short"/></a></td>
            </tr>

        </c:forEach>

    </table>

</c:if>

<%-- customerRecord is requested --%>
<c:if test="${!empty customerRecord}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="2">Данные покупателя</th>
        </tr>
        <tr>
            <td style="width: 290px"><strong>№:</strong></td>
            <td>${customerRecord.id}</td>
        </tr>
        <tr>
            <td><strong>Имя:</strong></td>
            <td>${customerRecord.name}</td>
        </tr>
        <tr>
            <td><strong>email:</strong></td>
            <td>${customerRecord.email}</td>
        </tr>
        <tr>
            <td><strong>Телефон:</strong></td>
            <td>${customerRecord.phohe}</td>
        </tr>
        <tr>
            <td><strong>Адрес:</strong></td>
            <td>${customerRecord.adress}</td>
        </tr>
        <tr>
            <td><strong>Индекс:</strong></td>
            <td>${customerRecord.cityRegion}</td>
        </tr>
        <tr>
            <td><strong>Номер карты:</strong></td>
            <td>${customerRecord.ccNumber}</td>
        </tr>

        <tr><td colspan="2" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='orderRecord?${order.id}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="orderRecord?${order.id}" class="noDecoration">
                <strong>Просмотр заказов &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>

<%-- orderRecord is requested --%>
<c:if test="${!empty orderRecord}">

    <table id="adminTable" class="detailsTable">

        <tr class="header">
            <th colspan="2">Сумма заказа</th>
        </tr>
        <tr>
            <td><strong>№:</strong></td>
            <td>${orderRecord.id}</td>
        </tr>
        <tr>
            <td><strong>Код заказа:</strong></td>
            <td>${orderRecord.confirmationNumber}</td>
        </tr>
        <tr>
            <td><strong>Дата создания:</strong></td>
            <td>
                <fmt:formatDate value="${orderRecord.dateCreated}"
                                type="both"
                                dateStyle="short"
                                timeStyle="short"/></td>
        </tr>

        <tr>
            <td colspan="2">
                <table class="embedded detailsTable">
                   <tr class="tableHeading">
                        <td class="rigidWidth">Продукт</td>
                        <td class="rigidWidth">Количество</td>
                        <td>Сумма</td>
                    </tr>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                        <tr>
                            <td>
                                <fmt:message key="${products[iter.index].name}"/>
                            </td>
                            <td>
                                ${orderedProduct.quantity}
                            </td>
                            <td class="confirmationPriceColumn">
                                <fmt:formatNumber type="currency" currencySymbol="&euro; "
                                                  value="${products[iter.index].price * orderedProduct.quantity}"/>
                            </td>
                        </tr>

                    </c:forEach>

                    <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

                    <tr>
                        <td colspan="2" id="deliverySurchargeCellLeft"><strong>Сумма доставки:</strong></td>
                        <td id="deliverySurchargeCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&euro; "
                                              value="${initParam.deliverySurcharge}"/></td>
                    </tr>

                    <tr>
                        <td colspan="2" id="totalCellLeft"><strong>Общая стоимость:</strong></td>
                        <td id="totalCellRight">
                            <fmt:formatNumber type="currency"
                                              currencySymbol="&euro; "
                                              value="${orderRecord.amont}"/></td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr><td colspan="3" style="padding: 0 20px"><hr></td></tr>

        <tr class="tableRow"
            onclick="document.location.href='customerRecord?${customer.id}'">
            <td colspan="2">
                <%-- Anchor tag is provided in case JavaScript is disabled --%>
                <a href="customerRecord?${customer.id}" class="noDecoration">
                    <strong>Просмотр информации о покупателе &#x279f;</strong></a></td>
        </tr>
    </table>

</c:if>