<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
        <script language="javascript" type="text/javascript">
			 function to_page(curr_page){
            	document.getElementById("current_page").value = curr_page ;
            	document.forms[0].submit();
            }
		</script>
    </head>
    <body onload="initialYearAndMonth();">
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <jsp:include page="/WEB-INF/main/menu.jsp" />            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="findDetail.do" method="post">
            	<input type="hidden" name="currentPage" id="current_page" />
            	<input type="hidden" name="item_id" id="${detailPage.item_id}" />
            	<input type="hidden" name="service_id" id="${detailPage.service_id}" />
            	
                <!--查询-->
                <div class="search_add">                        
                    <div>账务账号：<span class="readonly width70">${item.account_id}</span></div>                            
                    <div>OS 账号：<span class="readonly width100">${item.os_username}</span></div>
                    <div>服务器 IP：<span class="readonly width100">${item.unix_host}</span></div>
                    <div>计费时间：<span class="readonly width70">2013年8月</span></div>
                    <div>费用：<span class="readonly width70">${item.cost}</span></div>
                    <input type="button" value="返回" class="btn_add" onclick="history.back();" />
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="width150">客户登录 IP</th>
                            <th class="width150">登入时刻</th>
                            <th class="width150">登出时刻</th>
                            <th class="width100">时长（秒）</th>
                            <th class="width150">费用</th>
                            <th>资费</th>
                        </tr>
                        <c:forEach items="${details}" var="d" >
                        <tr>
                            <td>${d.client_host}</td>
                            <td><fmt:formatDate value="${d.login_time}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                            <td><fmt:formatDate value="${d.logout_time}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
                            <td>${d.duration}</td>
                            <td>${d.cost}</td>
                            <td>${d.cost_name}</td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
                    <c:choose>
                    	<c:when test="${detailPage.currentPage == 1}">
		        	        <a href="javascript:;">上一页</a>
                    	</c:when>
                    	<c:otherwise>
		        	        <a href="javascript:to_page(${detailPage.currentPage-1})">上一页</a>
                    	</c:otherwise>
                    </c:choose>
        	        <c:forEach begin="1" end="${detailPage.totalPage}" var="p">
        	        	<c:choose>
        	        		<c:when test="${detailPage.currentPage == p}">
			                    <a href="javascript:to_page(${detailPage.currentPage})" class="current_page">${p}</a>
        	        		</c:when>
        	        		<c:otherwise>
			                    <a href="javascript:to_page(${p})" >${p}</a>
        	        		</c:otherwise>
        	        	</c:choose>
        	        </c:forEach>
                    <c:choose>
                    	<c:when test="${detailPage.totalPage == detailPage.currentPage}">
		                    <a href="javascript:;">下一页</a>
                    	</c:when>
                    	<c:otherwise>
		                    <a href="javascript:to_page(${detailPage.currentPage+1})">下一页</a>
                    	</c:otherwise>
                    </c:choose>
                </div>
            </form>
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)加拿大达内IT培训集团公司 </p>
        </div>
    </body>
</html>
