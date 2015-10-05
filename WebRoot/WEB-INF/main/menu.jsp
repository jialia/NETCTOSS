<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="base" value="/"></c:url>
 <ul id="menu">
 	<c:if test="${currentModule == 0}">
		<li><a href="${base}login/toIndex.do" class="index_on"></a></li>
 	</c:if>
 	<c:if test="${currentModule != 0}">
		<li><a href="${base}login/toIndex.do" class="index_off"></a></li>
 	</c:if>
 	
	<c:forEach items="${allModules}" var="m">
		<c:if test="${m.module_id == 1}">
			<c:if test="${currentModule == 1}">
				<li><a href="${base}role/findRole.do" class="role_on"></a></li>
			</c:if>
			<c:if test="${currentModule != 1}">
				<li><a href="${base}role/findRole.do" class="role_off"></a></li>
			</c:if>
		</c:if>
		<c:if test="${m.module_id == 2}">
			<c:if test="${currentModule == 2}">
				<li><a href="${base}admin/findAdmin.do" class="admin_on"></a></li>
			</c:if>
			<c:if test="${currentModule != 2}">
				<li><a href="${base}admin/findAdmin.do" class="admin_off"></a></li>
			</c:if>
		</c:if>
		<c:if test="${m.module_id == 3}">
			<c:if test="${currentModule == 3}">
				<li><a href="${base}cost/findCost.do" class="fee_on"></a></li>
			</c:if>
			<c:if test="${currentModule != 3}">
				<li><a href="${base}cost/findCost.do" class="fee_off"></a></li>
			</c:if>
		</c:if>
		<c:if test="${m.module_id == 4}">
			<c:if test="${currentModule == 4}">
				<li><a href="${base}account/findAccount.do" class="account_on"></a></li>
			</c:if>
			<c:if test="${currentModule != 4}">
				<li><a href="${base}account/findAccount.do" class="account_off"></a></li>
			</c:if>
		</c:if>
		<c:if test="${m.module_id == 5}">
			<c:if test="${currentModule == 5}">
				<li><a href="${base}service/findService.do" class="service_on"></a></li>
			</c:if>
			<c:if test="${currentModule != 5}">
				<li><a href="${base}service/findService.do" class="service_off"></a></li>
			</c:if>
		</c:if>
		<c:if test="${m.module_id == 6}">
			<c:if test="${currentModule == 6}">
				<li><a href="bill/bill_list.html" class="bill_on"></a></li>
			</c:if>
			<c:if test="${currentModule != 6}">
				<li><a href="bill/bill_list.html" class="bill_off"></a></li>
			</c:if>
		</c:if>
		<c:if test="${m.module_id == 7}">
			<c:if test="${currentModule == 7}">
				<li><a href="report/report_list.html" class="report_on"></a></li>
			</c:if>
			<c:if test="${currentModule != 7}">
				<li><a href="report/report_list.html" class="report_off"></a></li>
			</c:if>
		</c:if>
	</c:forEach>
	<li><a href="${base}user/toUserInfo.do" class="information_off"></a></li>
	<li><a href="${base}user/toUserPassword.do" class="password_off"></a></li>
</ul>