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
    	<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
        <script language="javascript" type="text/javascript">
            //显示角色详细信息
            function showDetail(flag, a) {
                var detailDiv = a.parentNode.getElementsByTagName("div")[0];
                if (flag) {
                    detailDiv.style.display = "block";
                }
                else
                    detailDiv.style.display = "none";
            }
            //重置密码
            function resetPwd() {
                var checkObjs = $(":checkbox[name='check_admin']:checked");
                //判断是否选择了checkbox
                if(checkObjs.length == 0){
                	alert("请至少选择一个管理员");
                	return;
                }
                
                var r = window.confirm("确认要重置选中的管理员的密码吗？");
                if (r) {
	                //取得选中的checkbox
    	            var ids = new Array();
        	        for(var i=0;i<checkObjs.length;i++){
            	    	var trObj = $(checkObjs[i]).parents().parents();
                		var tdObj = $(trObj).children().eq(1);
                		ids.push($(tdObj).text());
               		}
                	//提交请求更新
                	$.post(
                		"resetPassword.do",
                		{"ids":ids.toString()},
                		function(data){
                			$("#operate_result_info").removeClass();
                    		if(data.success){
                    			//修改提示框样式
        	            		$("#operate_result_info").addClass("operate_success");
                    		} else {
        	            		$("#operate_result_info").addClass("operate_fail");
                    		}
                    		$("#operate_msg").text(data.message);
                    		$("#operate_result_info").show();
                    		//推迟一段时间之后，关闭提示信息
                    		setTimeout(function(){
                    			if(data.success){
                    				//成功时，刷新页面，自动关闭提示信息
                    				window.location.href="findAdmin.do";
                    			} else {
                    				// 失败时关闭提示信息
        		            		$("#operate_result_info").hide();
                    			}
                    		},2000);
                		}
                	);
                }
            }
            //删除
            function deleteAdmin(id) {
                var r = window.confirm("确定要删除此管理员吗？");
                if(r){
                	window.location.href="deleteAdmin.do?id=" + id;
                }
            }
            //全选
            function selectAdmins(inputObj) {
                var inputArray = document.getElementById("datalist").getElementsByTagName("input");
                for (var i = 1; i < inputArray.length; i++) {
                    if (inputArray[i].type == "checkbox") {
                        inputArray[i].checked = inputObj.checked;
                    }
                }
            }
            
            function to_page(curr_page){
            	//将传入的页码赋值给表单中的页码文本框
            	document.getElementById("current_page").value = curr_page ;
            	//提交表单，实现带条件的分页查询
            	document.forms[0].submit();
            }
        </script>       
    </head>
    <body>
        <!--Logo区域开始-->
        <div id="header">
            <img src="../images/logo.png" alt="logo" class="left"/>
            <a href="#">[退出]</a>            
        </div>
        <!--Logo区域结束-->
        <!--导航区域开始-->
        <div id="navi">                        
            <ul id="menu">
                <li><a href="../index.html" class="index_off"></a></li>
                <li><a href="../role/findRole.do" class="role_off"></a></li>
                <li><a href="../admin/findAdmin.do" class="admin_on"></a></li>
                <li><a href="../cost/findCost.do" class="fee_off"></a></li>
                <li><a href="../account/findAccount.do" class="account_off"></a></li>
                <li><a href="../service/findService.do" class="service_off"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="findAdmin.do" method="post">
            	<input type="hidden" name="currentPage" id="current_page" />
                <!--查询-->
                <div class="search_add">
                    <div>
                       	 模块：
                        <select id="selModules" name="moduleId" class="select_search">
                            <option value="">全部</option>
                            <c:forEach items="${modules}" var="m">
	                            <option value="${m.module_id}" <c:if test="${adminPage.moduleId==m.module_id}">selected</c:if> >${m.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>角色：<input type="text" name="roleName" value="${adminPage.roleName}" class="text_search width200" /></div>
                    <div><input type="button" value="搜索" class="btn_search" onclick="to_page(1)" /></div>
                    
                    <input type="button" value="密码重置" class="btn_add" onclick="resetPwd();" />
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddAdmin.do';" />
                </div>
                <!--删除和密码重置的操作提示-->
                <div id="operate_result_info" class="operate_fail">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                    <span id="operate_msg" >删除失败！数据并发错误。</span><!--密码重置失败！数据并发错误。-->
                </div> 
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                        <tr>
                            <th class="th_select_all">
                                <input type="checkbox" onclick="selectAdmins(this);" />
                                <span>全选</span>
                            </th>
                            <th>管理员ID</th>
                            <th>姓名</th>
                            <th>登录名</th>
                            <th>电话</th>
                            <th>电子邮件</th>
                            <th>授权日期</th>
                            <th class="width100">拥有角色</th>
                            <th></th>
                        </tr>  
                        
                        <c:forEach items="${admins}" var="admin" >
                        <tr>
                            <td><input type="checkbox" name="check_admin" /></td>
                            <td>${admin.admin_id}</td>
                            <td>${admin.name}</td>
                            <td>${admin.admin_code}</td>
                            <td>${admin.telephone}</td>
                            <td>${admin.email}</td>
                            <td><fmt:formatDate value="${admin.enrolldate}" pattern="yyyy-MM-dd" /></td>
                            <td>
                            	<c:choose>
                            		<c:when test="${admin.roles[1] != null}">
		                                <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${admin.roles[0].name} ...</a>
                                		<!--浮动的详细信息-->
                                		<div class="detail_info">
                                			<c:forEach items="${admin.roles}" var="r" >${r.name} </c:forEach>
                                		</div>
                            		</c:when>
                            		<c:otherwise>
		                                ${admin.roles[0].name}
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                            <td class="td_modi">
                                <input type="button" value="修改" class="btn_modify" onclick="location.href='toUpdateAdmin.do?id=${admin.admin_id}';" />
                                <input type="button" value="删除" class="btn_delete" onclick="deleteAdmin(${admin.admin_id});" />
                            </td>
                        </tr>
                        </c:forEach>                    
                       
                    </table>
                </div>
                <!--分页-->
                <div id="pages">
        	       <c:choose>
                		<c:when test="${adminPage.currentPage == 1}">
                			<a href="javascript:;" >上一页</a>
                		</c:when>
                		<c:otherwise>
                			<a href="javascript:to_page(${adminPage.currentPage-1})" >上一页</a>
                		</c:otherwise>
                	</c:choose>
        	        <c:forEach begin="1" end="${adminPage.totalPage}" var="p">
        	        <c:choose>
        	        	<c:when test="${p == adminPage.currentPage }">
		                    <a href="javascript:to_page(${p})" class="current_page">${p}</a>
        	        	</c:when>
        	        	<c:otherwise>
		                    <a href="javascript:to_page(${p})">${p}</a>
        	        	</c:otherwise>
        	        </c:choose>
        	        </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${adminPage.currentPage == adminPage.totalPage}">
		                    <a href="javascript:;">下一页</a>
                		</c:when>
                		<c:otherwise>
                			<a href="javascript:to_page(${adminPage.currentPage+1})" >下一页</a>
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
