<%-- 
    Document   : checkout
    Created on : 04.06.2016, 20:40:10
    Author     : olli
--%>
  
<%@page pageEncoding="cp1251" contentType="text/html; charset=cp1251"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<c:set var='view' value='/checkout' scope='session' />

<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                phohe: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                adress: {
                    required: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                }
            }
        });
    });
</script>

<div id="singleColumn">

    <h2><fmt:message key="checkout"/></h2>

    <p><fmt:message key="checkoutText"/></p>

    <c:if test="${!empty orderFailureFlag}">
        <p class="error"><fmt:message key="orderFailureError"/></p>
    </c:if>

    <form id="checkoutForm" action="<c:url value='purchase'/>" method="post">
        <table id="checkoutTable">
          <c:if test="${!empty validationErrorFlag}">
            <tr>
                <td colspan="2" style="text-align:left">
                    <span class="error smallText"><fmt:message key="validationErrorMessage"/>

                      <c:if test="${!empty nameError}">
                        <br><span class="indent"><fmt:message key="nameError"/></span>
                      </c:if>
                      <c:if test="${!empty emailError}">
                        <br><span class="indent"><fmt:message key="emailError"/></span>
                      </c:if>
                      <c:if test="${!empty phoheError}">
                        <br><span class="indent"><fmt:message key="phoheError"/></span>
                      </c:if>
                      <c:if test="${!empty adressError}">
                        <br><span class="indent"><fmt:message key="adressError"/></span>
                      </c:if>
                      <c:if test="${!empty cityRegionError}">
                        <br><span class="indent"><fmt:message key="cityRegionError"/></span>
                      </c:if>
                      <c:if test="${!empty ccNumberError}">
                        <br><span class="indent"><fmt:message key="ccNumberError"/></span>
                      </c:if>

                    </span>
                </td>
            </tr>
          </c:if>
            <tr>
                <td><label for="name"><fmt:message key="customerName"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="name"
                           name="name"
                           value="${param.name}">
                </td>
            </tr>
            <tr>
                <td><label for="email"><fmt:message key="email"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>
            <tr>
                <td><label for="phohe"><fmt:message key="phohe"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="phohe"
                           name="phohe"
                           value="${param.phohe}">
                </td>
            </tr>
            <tr>
                <td><label for="adress"><fmt:message key="adress"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="adress"
                           name="adress"
                           value="${param.adress}">

                    <br>
                    <fmt:message key="prague"/>
                    <select name="cityRegion">
                      <c:forEach begin="1" end="10" var="regionNumber">
                        <option value="${regionNumber}"
                                <c:if test="${param.cityRegion eq regionNumber}">selected</c:if>>${regionNumber}</option>
                      </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="creditcard"><fmt:message key="creditCard"/>:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="creditcard"
                           name="creditcard"
                           value="${param.creditcard}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="<fmt:message key='submit'/>">
                </td>
            </tr>
        </table>
    </form>

    <div id="infoBox">

        <ul>
            <li><fmt:message key="nextDayGuarantee"/></li>
            <li><fmt:message key="deliveryFee1"/>
                <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${initParam.deliverySurcharge}"/>
                <fmt:message key="deliveryFee2"/></li>
        </ul>

        <table id="priceBox">
            <tr>
                <td><fmt:message key="subtotal"/>:</td>
                <td class="checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${cart.subtotal}"/></td>
            </tr>
            <tr>
                <td><fmt:message key="surcharge"/>:</td>
                <td class="checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${initParam.deliverySurcharge}"/></td>
            </tr>
            <tr>
                <td class="total"><fmt:message key="total"/>:</td>
                <td class="total checkoutPriceColumn">
                    <fmt:formatNumber type="currency" currencySymbol="&euro; " value="${cart.total}"/></td>
            </tr>
        </table>
    </div>
</div>