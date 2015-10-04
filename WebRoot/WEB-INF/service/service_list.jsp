<%@ page pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            
         // 开通
        	function start_service(id){
            	var r = window.confirm("确定要开通此业务账号吗？");
            	if(r){
            		update_service_status("startService.do",id);
            	}
        	}
            // 暂停
            function pause_service(id){
                var r = window.confirm("确定要暂停此业务账号吗？");
                if(r){
                	update_service_status("pauseService.do",id);
                }
            }
            // 删除
            function delete_service(id){
                var r = window.confirm("确定删除此业务账号吗？");
                if(r){
                	update_service_status("deleteService.do",id);
                }
            }
            
         	// 处理返回信息
        	function update_service_status(url,id){
            	$.post(url,{"id":id},function(data){
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
            				window.location.href="findService.do";
            			} else {
            				// 失败时关闭提示信息
		            		$("#operate_result_info").hide();
            			}
            		},2000);
            	});
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
                <li><a href="../admin/findAdmin.do" class="admin_off"></a></li>
                <li><a href="../cost/findCost.do" class="fee_off"></a></li>
                <li><a href="../account/findAccount.do" class="account_off"></a></li>
                <li><a href="../service/findService.do" class="service_on"></a></li>
                <li><a href="../bill/bill_list.html" class="bill_off"></a></li>
                <li><a href="../report/report_list.html" class="report_off"></a></li>
                <li><a href="../user/user_info.html" class="information_off"></a></li>
                <li><a href="../user/user_modi_pwd.html" class="password_off"></a></li>
            </ul>            
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">
            <form action="findService.do" method="post">
            	<!-- 追加页码条件，用于翻页 -->
            	<input type="hidden" name="currentPage" id="current_page" />
            	
                <!--查询-->
                <div class="search_add">                        
                    <div>OS 账号：<input type="text" name="os_username"  value="${servicePage.os_username}" class="width100 text_search" /></div>                            
                    <div>服务器 IP：<input type="text" name="unix_host" value="${servicePage.unix_host}" class="width100 text_search" /></div>
                    <div>身份证：<input type="text"  name="idcard_no" value="${servicePage.idcard_no}" class="text_search" /></div>
                    <div>状态：
                        <select class="select_search" name="status" >
                            <option value=""  >全部</option>
                            <option value="0" <c:if test="${servicePage.status==0}">selected</c:if> >开通</option>
                            <option value="1" <c:if test="${servicePage.status==1}">selected</c:if> >暂停</option>
                            <option value="2" <c:if test="${servicePage.status==2}">selected</c:if> >删除</option>
                        </select>
                    </div>
                    <div><input type="submit" value="搜索" class="btn_search" /></div>
                    <input type="button" value="增加" class="btn_add" onclick="location.href='toAddService.do';" />
                </div>
                </form>
                <!--提示信息-->
                <div id="operate_result_info" class="operate_success">
                    <img src="../images/close.png" onclick="this.parentNode.style.display='none';" />
                  	  <span id="operate_msg" >删除成功！</span>
                </div>   
                <!--数据区域：用表格展示数据-->     
                <div id="data">            
                    <table id="datalist">
                    <tr>
                        <th class="width50">业务ID</th>
                        <th class="width70">账务账号ID</th>
                        <th class="width150">身份证</th>
                        <th class="width70">姓名</th>
                        <th>OS 账号</th>
                        <th class="width50">状态</th>
                        <th class="width100">服务器 IP</th>
                        <th class="width100">资费</th>                                                        
                        <th class="width200"></th>
                    </tr>
                    <c:forEach items="${services}" var="ser" >
                    <tr>
                        <td><a href="service_detail.html" title="查看明细">${ser.SERVICE_ID}</a></td>
                        <td>${ser.ACCOUNT_ID}</td>
                        <td>${ser.IDCARD_NO}</td>
                        <td>${ser.REAL_NAME}</td>
                        <td>${ser.OS_USERNAME}</td>
                        <c:choose>
                        	<c:when test="${ser.STATUS == 0}">
        		                <td>开通</td>
                        	</c:when>
                        	<c:when test="${ser.STATUS == 1}">
		                        <td>暂停</td>
                        	</c:when>
                        	<c:otherwise>
		                        <td>删除</td>
                        	</c:otherwise>
                        </c:choose>
                        <td>${ser.UNIX_HOST}</td>
                        <td>
                            <a class="summary"  onmouseover="showDetail(true,this);" onmouseout="showDetail(false,this);">${ser.COST_NAME}</a>
                            <!--浮动的详细信息-->
                            <div class="detail_info">
                                ${ser.DESCR}
                            </div>
                        </td>
                        <td class="td_modi">
                        <c:choose>
                        	<c:when test="${ser.STATUS == 0}">
	                            <input type="button" value="暂停" class="btn_pause" onclick="pause_service(${ser.SERVICE_ID});" />
    	                        <input type="button" value="修改" class="btn_modify" onclick="location.href='toUpdateService.do?id=${ser.SERVICE_ID}';" />
        	                    <input type="button" value="删除" class="btn_delete" onclick="delete_service(${ser.SERVICE_ID});" />
                        	</c:when>
                        	<c:when test="${ser.STATUS == 1}">
	                            <input type="button" value="开通" class="btn_start" onclick="start_service(${ser.SERVICE_ID});" />
    	                        <input type="button" value="修改" class="btn_modify" onclick="location.href='toUpdateService.do?id=${ser.SERVICE_ID}';" />
        	                    <input type="button" value="删除" class="btn_delete" onclick="delete_service(${ser.SERVICE_ID});" />
                        	</c:when>
                        	<c:otherwise>
                        	</c:otherwise>
                        </c:choose>
                        </td>
                    </tr>
                	</c:forEach>                                               
                </table>                
                <p>业务说明：<br />
                1、创建即开通，记载创建时间；<br />
                2、暂停后，记载暂停时间；<br />
                3、重新开通后，删除暂停时间；<br />
                4、删除后，记载删除时间，标示为删除，不能再开通、修改、删除；<br />
                5、业务账号不设计修改密码功能，由用户自服务功能实现；<br />
                6、暂停和删除状态的账务账号下属的业务账号不能被开通。</p>
                </div>                    
                <!--分页-->
                <div id="pages">
                    <a href="javascript:to_page(1)">首页</a>
                    <c:choose>
                    	<c:when test="${servicePage.currentPage == 1}">
		        	        <a href="javascript:;">上一页</a>
                    	</c:when>
                    	<c:otherwise>
		        	        <a href="javascript:to_page(${servicePage.currentPage-1})">上一页</a>
                    	</c:otherwise>
                    </c:choose>
        	        <c:forEach begin="1" end="${servicePage.totalPage}" var="p">
        	        	<c:choose>
        	        		<c:when test="${servicePage.currentPage == p}">
			                    <a href="javascript:to_page(${servicePage.currentPage})" class="current_page">${p}</a>
        	        		</c:when>
        	        		<c:otherwise>
			                    <a href="javascript:to_page(${p})" >${p}</a>
        	        		</c:otherwise>
        	        	</c:choose>
        	        </c:forEach>
                    <c:choose>
                    	<c:when test="${servicePage.totalPage == servicePage.currentPage}">
		                    <a href="javascript:;">下一页</a>
                    	</c:when>
                    	<c:otherwise>
		                    <a href="javascript:to_page(${servicePage.currentPage+1})">下一页</a>
                    	</c:otherwise>
                    </c:choose>
                    <a href="javascript:to_page(${servicePage.totalPage})">末页</a>
                </div>                    
        </div>
        <!--主要区域结束-->
        <div id="footer">
            <p>[源自北美的技术，最优秀的师资，最真实的企业环境，最适用的实战项目]</p>
            <p>版权所有(C)加拿大达内IT培训集团公司 </p>
        </div>
    </body>
</html>
