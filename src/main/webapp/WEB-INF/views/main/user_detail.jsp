<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Phoenix</title>
  </head>

  <body>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
    <jsp:include page="../main/nav.jsp"/>
        
      <div class="content">
        <div class="mb-9">
          <h2 class="mb-0">주문내역<span>#349</span></h2>
          <div class="row g-5 gy-7">
            <div class="col-12 col-xl-8 col-xxl-9">
              <div id="orderTable" data-list='{"valueNames":["products","color","size","price","quantity","total"],"page":10}'>
                <div class="table-responsive scrollbar">
                  <table class="table fs-9 mb-0 border-top border-translucent">
                    <thead>
                      <tr>
                        <th class="sort white-space-nowrap align-middle fs-10" scope="col"></th>
                        <th class="sort white-space-nowrap align-middle" scope="col" style="min-width:400px;" data-sort="products">상품</th>
                        <th class="sort align-middle text-end ps-4" scope="col" data-sort="price" style="width:150px;">가격</th>
                        <th class="sort align-middle text-end ps-4" scope="col" data-sort="quantity" style="width:200px;">수량</th>
                        <th class="sort align-middle text-end ps-4" scope="col" data-sort="total" style="width:250px;">총합계</th>
                        <th class="sort align-middle text-end ps-4" scope="col" data-sort="product_comment" style="width:250px;">리뷰</th>
                      </tr>
                    </thead>
                    <tbody class="list" id="order-table-body">
                    <c:forEach var="bp" items="${list }">
                      <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                        <td class="align-middle white-space-nowrap py-2"><a class="d-block border border-translucent rounded-2" href="../../../apps/e-commerce/landing/product-details.html"><img src="resources/productimages/${bp.p_image }" alt="" width="53" /></a></td>
                        <td class="products align-middle py-0"><a class="fw-semibold line-clamp-2 mb-0" href="../../../apps/e-commerce/landing/product-details.html">${bp.p_name }</a></td>
                        <td class="price align-middle text-body fw-semibold text-end py-0 ps-4">${bp.p_price }</td>
                        <td class="quantity align-middle text-end py-0 ps-4 text-body-tertiary">${bp.p_count }</td>
                        <td class="total align-middle fw-bold text-body-highlight text-end py-0 ps-4">${bp.totalprice }</td>
                        <c:if test="${bp.pc_check eq 1}">
                        <td class="total align-middle fw-bold text-body-highlight text-end py-0 ps-4"><a href="product_view.do?p_idx=${bp.p_idx }">리뷰완료</a></td>
                        </c:if>
                        <c:if test="${bp.pc_check eq 0}">
                        <td class="total align-middle fw-bold text-body-highlight text-end py-0 ps-4"><a href="product_comment_write_form.do">리뷰달기</a></td>
                        </c:if>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
    </main><!-- ===============================================-->
  </body>

</html>