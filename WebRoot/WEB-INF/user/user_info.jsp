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
        <script language="javascript" type="text/javascript" >
			function check_login(){
				//验证用户姓名
				var namePatt = new RegExp(/^[\u4E00-\u9FA5A-Za-z0-9]{1,20}$/);
				var name = $("#name").val();
				if(!namePatt.test(name)){
					$("#name_msg").addClass("error_msg");
					return;
				}
				
				//验证手机号
				var telephonePatt = new RegExp(/^\d{7,11}$/);
				var telephone = $("#telephone").val();
				if(!telephonePatt.test(telephone)){
					$("#telephone_msg").addClass("error_msg");
					return;
				}
				
				//验证邮箱
				var emailPatt = new RegExp(/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/);
				var email = $("#email").val();
				if(!emailPatt.test(email)){
					$("#email_msg").addClass("error_msg");
					return;
				}
				
				$.post(
                	"updateUserInfo.do",
                	$("#myform").serialize(),
                	function(data){
    	            	$("#save_result_info").removeClass();
                		if(data.success){
                			//修改提示框样式
    	            		$("#save_result_info").addClass("save_success");
                		} else {
    	            		$("#save_result_info").addClass("save_fail");
                		}
                		$("#save_result_info").text(data.message);
                		$("#save_result_info").show();
                		//推迟一段时间之后，关闭提示信息
                		setTimeout(function(){
                			if(data.success){
                				//成功时，刷新页面，自动关闭提示信息
                				window.location.href="../login/toIndex.do";
                			} else {
                				// 失败时关闭提示信息
    		            		$("#save_result_info").hide();
                			}
                		},2000);
                });
				
			}
			
			//光标切入文本框时，重置其提示信息
			function set_msg(txt_id,className){
				$("#"+txt_id).removeClass();
				$("#"+txt_id).addClass(className);;
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
            <jsp:include page="/WEB-INF/main/menu.jsp" />       
        </div>
        <!--导航区域结束-->
        <!--主要区域开始-->
        <div id="main">            
            <!--保存操作后的提示信息：成功或者失败-->
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form id="myform" action="updateUserInfo.do" method="post" class="main_form">
            	<input type="hidden" name="admin_id" value="${admin.admin_id}" />
                <div class="text_info clearfix"><span>管理员账号：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="${user.admin_id}" /></div>
                <div class="text_info clearfix"><span>角色：</span></div>
                <div class="input_info">
                    <input type="text" readonly="readonly" class="readonly width400" value="<c:forEach items="${user.roles}" var="r" >${r.name},</c:forEach>" />
                </div>
                <div class="text_info clearfix"><span>姓名：</span></div>
                <div class="input_info">
                    <input type="text" id="name" name="name" value="${user.name}" onfocus="set_msg('name_msg','validate_msg_long')" />
                    <span class="required">*</span>
                    <div id="name_msg" class="validate_msg_long">20长度以内的汉字、字母的组合</div>
                </div>
                <div class="text_info clearfix"><span>电话：</span></div>
                <div class="input_info">
                    <input type="text" id="telephone" name="telephone" class="width200" value="${user.telephone}" onfocus="set_msg('telephone_msg','validate_msg_medium')" />
                    <div id="telephone_msg" class="validate_msg_medium">电话号码格式：手机或固话</div>
                </div>
                <div class="text_info clearfix"><span>Email：</span></div>
                <div class="input_info">
                    <input type="text" id="email" name="email" class="width200" value="${user.email}" onfocus="set_msg('email_msg','validate_msg_medium')" />
                    <div id="email_msg" class="validate_msg_medium">50长度以内，符合 email 格式</div>
                </div>
                <div class="text_info clearfix"><span>创建时间：</span></div>
                <div class="input_info"><input type="text" readonly="readonly" class="readonly" value="<fmt:formatDate value="${user.enrolldate}" pattern="yyyy-MM-dd" />"/></div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="check_login()" />
                    <input type="button" value="取消" class="btn_save" />
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
