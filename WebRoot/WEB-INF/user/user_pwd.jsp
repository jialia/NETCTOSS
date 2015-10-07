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
        <script language="javascript" type="text/javascript" >
			function check_update(){
				//验证原密码
				var passwordPatt = new RegExp(/^[\u4E00-\u9FA5A-Za-z0-9_]{1,30}$/);
				var old_password = $("#old_password").val();
				if(!passwordPatt.test(old_password)){
					$("#old_password_msg").addClass("error_msg");
					return;
				}
				
				//验证新密码
				var password = $("#password").val();
				if(!passwordPatt.test(password)){
					$("#password_msg").addClass("error_msg");
					return;
				}
				
				//重复输入
				var repeat_password = $("#repeat_password").val();
				if(repeat_password != password){
					$("#repeat_password_msg").addClass("error_msg");
					return;
				}
			
				$.post(
                	"updateUserPassword.do",
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
			function set_msg(txt_id){
				$("#"+txt_id).removeClass();
				$("#"+txt_id).addClass("validate_msg_medium");
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
        <div id="main">      
            <!--保存操作后的提示信息：成功或者失败-->      
            <div id="save_result_info" class="save_success">保存成功！</div>
            <form id="myform" class="main_form">
                <div class="text_info clearfix"><span>旧密码：</span></div>
                <div class="input_info">
                    <input id="old_password" name="old_password" type="password" class="width200" onfocus="set_msg('old_password_msg')" /><span class="required">*</span>
                    <div id="old_password_msg" class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>新密码：</span></div>
                <div class="input_info">
                    <input type="password" id="password" name="password"  class="width200" onfocus="set_msg('password_msg')" /><span class="required">*</span>
                    <div id="password_msg" class="validate_msg_medium">30长度以内的字母、数字和下划线的组合</div>
                </div>
                <div class="text_info clearfix"><span>重复新密码：</span></div>
                <div class="input_info">
                    <input type="password" class="width200" id="repeat_password" onfocus="set_msg('repeat_password_msg')" /><span class="required">*</span>
                    <div id="repeat_password_msg" class="validate_msg_medium">两次新密码必须相同</div>
                </div>
                <div class="button_info clearfix">
                    <input type="button" value="保存" class="btn_save" onclick="check_update();" />
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
