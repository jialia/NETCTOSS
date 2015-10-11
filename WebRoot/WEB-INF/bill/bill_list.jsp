<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>达内－NetCTOSS</title>
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global.css" />
        <link type="text/css" rel="stylesheet" media="all" href="../styles/global_color.css" /> 
        <script language="javascript" type="text/javascript">
            //写入下拉框中的年份和月份
            function initialYearAndMonth() {
                //写入最近3年
                var yearObj = document.getElementById("selYears");
                var year = (new Date()).getFullYear();
                for (var i = 0; i <= 2; i++) {
                    var opObj = new Option(year - i, year - i);
                    yearObj.options[i] = opObj;
                }
                //写入 12 月
                var monthObj = document.getElementById("selMonths");
                var opObj = new Option("全部", "全部");
                monthObj.options[0] = opObj;
                for (var i = 1; i <= 12; i++) {
                    var opObj = new Option(i, i);
                    monthObj.options[i] = opObj;
                }
            }
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
            <form action="findBill.do" method="post">
            	<input type="hidden" name="currentPage" id="current_page" />

                <!--查询-->
                <div class="search_add">                        
                    <div>身份证：<input name="idcard_no" type="text"  value="${billPage.idcard_no}" class="text_search" /></div>
                    <div>账务账号：<input name="login_name" type="text" value="${billPage.login_name}" class="width100 text_search" /></div>                            
                    <div>姓名：<input name="real_name" type="text" value="${billPage.real_name}" class="width70 text_search" /></div>
                    <div>
                        <select class="select_search" id="selYears">
                        </select> 年
                        <select class="select_search" id="selMonths">
                        </select> 月
                    </div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="to_page(1)" /></div>
                </div>  
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">账单ID</th>
                        <th class="width70">姓名</th>
                        <th class="width150">身份证</th>
                        <th class="width150">账务账号</th>
                        <th>费用</th>
                        <th class="width100">月份</th>
                        <th class="width100">支付方式</th>
                        <th class="width100">支付状态</th>                                                        
                        <th class="width50"></th>
                    </tr>
                    <c:forEach items="${bills}" var="b">
                    <tr>
                        <td>${b.bill_id}</td>
                        <td>${b.real_name}</td>
                        <td>${b.idcard_no}</td>
                        <td>${b.login_name}</td>
                        <td>${b.cost}</td>
                        <td>${b.bill_month}</td>
                        <c:choose>
                        	<c:when test="${b.payment_mode == 0}"><td>现金</td></c:when>
                        	<c:when test="${b.payment_mode == 1}"><td>信用卡</td></c:when>
                        	<c:when test="${b.payment_mode == 2}"><td>网上银行</td></c:when>
                        	<c:when test="${b.payment_mode == 3}"><td>支付宝</td></c:when>
                        	<c:otherwise><td>其他方式</td></c:otherwise>
                        </c:choose>
                        <c:choose>
                        	<c:when test="${b.pay_state == 0}"><td>未支付</td></c:when>
                        	<c:otherwise><td>已支付</td></c:otherwise>
                        </c:choose>
                        <td><a href="findItem.do?bill_id=${b.bill_id}" title="账单明细">明细</a></td>
                    </tr>
                    </c:forEach>
                </table>
                
                <p>业务说明：<br />
                1、设计支付方式和支付状态，为用户自服务中的支付功能预留；<br />
                2、只查询近 3 年的账单，即当前年和前两年，如2013/2012/2011；<br />
                3、年和月的数据由 js代码自动生成；<br />
                4、由数据库中的job每月的月底定时计算账单数据。</p>
                </div>                    
                <!--分页-->
                <div id="pages">
                    <a href="javascript:to_page(1)">首页</a>
                    <c:choose>
                    	<c:when test="${billPage.currentPage == 1}">
		        	        <a href="javascript:;">上一页</a>
                    	</c:when>
                    	<c:otherwise>
		        	        <a href="javascript:to_page(${billPage.currentPage-1})">上一页</a>
                    	</c:otherwise>
                    </c:choose>
        	        <c:forEach begin="1" end="${billPage.totalPage}" var="p">
        	        	<c:choose>
        	        		<c:when test="${billPage.currentPage == p}">
			                    <a href="javascript:to_page(${billPage.currentPage})" class="current_page">${p}</a>
        	        		</c:when>
        	        		<c:otherwise>
			                    <a href="javascript:to_page(${p})" >${p}</a>
        	        		</c:otherwise>
        	        	</c:choose>
        	        </c:forEach>
                    <c:choose>
                    	<c:when test="${billPage.totalPage == billPage.currentPage}">
		                    <a href="javascript:;">下一页</a>
                    	</c:when>
                    	<c:otherwise>
		                    <a href="javascript:to_page(${billPage.currentPage+1})">下一页</a>
                    	</c:otherwise>
                    </c:choose>
                    <a href="javascript:to_page(${billPage.totalPage})">末页</a>
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
