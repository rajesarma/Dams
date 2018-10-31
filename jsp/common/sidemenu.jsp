<%@page import="in.gov.cgg.struts.chat.Message"%>
<%@page import="in.gov.cgg.struts.chat.Chatter"%>
<%@page import="in.gov.cgg.struts.chat.ChatRoom"%>
<%@page import="in.gov.cgg.struts.chat.ChatRoomList"%>
<%@ page language="java" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <!-- Bootstrap core CSS -->
   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link type="text/css" href="css/jquery.ui.chatbox.css" rel="stylesheet" />
	
	<script type="text/javascript" src="js/jquery.ui.chatbox.js"></script>
	<script type="text/javascript" src="js/chatboxManager.js"></script>
	
	<!-- <link rel="stylesheet" href="css/jquery.sidr.light.min.css"> -->
	
	<script type="text/javascript">
	
		var counter=0;
	    var idList = new Array();
	    //var fromUser = "";
	    //var toUser = "";
	    //var boxId = "";
	    //var loggedInUsers = new Array();
	    
	    function logout()
		{
			//if(window.performance.navigation.type!=0 || window.performance.navigation.type!=1)
			{
				var url = '<%=basePath%>/updateSession';
				$.ajax(
				{
					type: "POST",
					url:url,
					data: { },
					cache: false,
					success: function(response)
					{ },
				});
			}
		}
	
		$(document).ready(function()
		{
		    var url = '<%=basePath%>/updateSession';
		    
		    $("body").keydown(function (e)
			{
				if (e.which == 116 || e.which == 17 || e.which == 117) 
			   	{
			   		if (event.preventDefault) 
			   			event.preventDefault();
			   			
			   		event.cancelBubble = true;
			     	event.returnValue = false;
			     	event.keyCode = 0;
			     	
			     	return false;
			   	}
			});
			
			var broadcastMessageCallback = function(to, msg) 
	      	{
	        	for(var i = 0; i < idList.length; i ++) 
	          	{
	            	chatboxManager.addBox(idList[i]);
	              	//$("#" + idList[i]).chatbox("option", "boxManager").addMsg(to, msg);
	              	//sendMessage(fromUser, toUser, msg, boxId );
	              	//sendMessage("${userName}", msg, boxId, idList[i] );
	          	}
	       	}; 
	
	     	// chatboxManager is excerpt from the original project the code is not very clean, I just want to reuse it to manage multiple chatboxes
	     	chatboxManager.init({messageSent : broadcastMessageCallback});
	    });
	   
		function openChatBox(userName, realName, loginUserName)
	    {
			counter ++;
			//fromUser = loginUserName;
			var fromUser = "${userName}";
			var toUser = userName;
			
	        var id = "box_" + userName;
	        idList.push(id);
	        chatboxManager.addBox(id, {
          								dest:"dest_" + userName, // not used in demo
                                   		title:"box_" +userName,
                                   		//first_name: realName,
                                   		first_name: loginUserName+ " ("+new Date().toLocaleTimeString()+")",	// toLocaleString, 	toLocaleDateString, toLocaleTimeString
                                   		last_name: "",
                                   		user: userName,
                                   		//you can add your own options too
                                  	});
          	//boxId = id;
          	//event.preventDefault();
          	testGetMessages(id);
		}
		
		//function sendMessage(fromUser, toUser, msg, boxId )
		//function sendMessage(fromUser, msg, boxId, i )
		function sendMessage(boxId, msg )
		{
			//var kids = $("#"+boxId+"").children()[0];
			var kids = $("#"+boxId+"")[0];
			var to_user = boxId.split("_")[1];
			
			var url = '<%=basePath%>messageService.do?mode=setMessage';
			$.ajax(
			{
				type: "POST",
				url:url,
				data: 
				{
	   				'property(fromUser)': fromUser,
	   				//'property(toUser)': toUser,
	   				'property(toUser)': to_user,
	   				'property(msg)': msg,
				},
				cache: false,
				success: function(response)
				{
					//var chatList=jQuery.parseJSON(response).chatList;
					
					///$('#"+boxId+"').find('div .ui-chatbox-msg').html("Test");
					//var kids = $("#"+boxId+"").children()[0];
					
					//$(kids).html(chatList);
					//alert(response);
					//var insert_status=jQuery.parseJSON(response).insert_status;
					//getMessages(fromUser, toUser );
				},
				error: function() 
				{
					//alert("No data");
				},
				beforeSend: function( event, ui ) 
				{
					//$("#wait").html("<center style='font-size: 14' ><span id='loading' style='font-size: 14; color:red'><i class='fa fa-spinner fa-spin' style='font-size:24px'></i> <b>Loading... </b></span></center>");
					//$(kids).empty();
				}
			});
		}
		
		function getMessages(fromUser, toUser )
		{
			//var kids = $("#"+boxId+"").children()[0];
			var kids = $("#"+boxId+"")[0];
			
			var url = '<%=basePath%>messageService.do?mode=getMessages';
			$.ajax(
			{
				type: "POST",
				url:url,
				data: 
				{
	   				'property(fromUser)': fromUser,
	   				'property(toUser)': toUser,
	   			},
				cache: false,
				success: function(response)
				{
					var chatList=jQuery.parseJSON(response).chatList;
					var chatData = chatList.split("<br>");
					var cd = chatData.join('');
					
					var existingText = $("#"+boxId).text();
					if(existingText != cd && typeof(kids)!='undefined')
					{
						//console.log("Matches data so not refreshing");
						
						console.log(existingText.length);
						
						if(existingText.length >0)
						{
							$(kids).empty();
							var wtf    = $("#"+boxId);
							var height = wtf[0].scrollHeight;
							wtf.scrollTop(height);
						}
						$(kids).html(chatList);
					}
				},
				error: function() 
				{
					//alert("No data");
				},
				beforeSend: function( event, ui ) 
				{ }
			});
		}
		
		function getLoggedInUsers()
		{
			fromUser = '${userName}';
			
			var url = '<%=basePath%>messageService.do?mode=getLoggedInUsers';
			$.ajax(
			{
				type: "POST",
				url:url,
				data: 
				{
	   				'property(fromUser)': '${userName }',
				},
				cache: false,
				success: function(response)
				{
					var users_count = jQuery.parseJSON(response).users_count;
					//alert(users_count);
					//if(users_count != "same")
					{
						var chat_users_list=jQuery.parseJSON(response).chat_users_list;
						var msg="";
						if(typeof(chat_users_list)!='undefined')
						{
							msg+="<ul class='nav nav-sidebar' style='margin-bottom:10px;'>";
							
							$.each(chat_users_list, function(i, item)
							{
								//msg+="<li><a onclick='openChatBox(\""+item.username+"\", \""+item.real_name+"\", \""+item.login_user+"\"); getMessages(\""+item.login_user+"\", \""+item.username+"\")' style='cursor: pointer;'><img data-name='"+item.real_name+"' class='profile'/> "+item.real_name+"</a></li>";
								msg+="<li><a onclick='openChatBox(\""+item.username+"\", \""+item.real_name+"\", \""+item.login_user+"\");' style='cursor: pointer;'><img data-name='"+item.real_name+"' class='profile'/> "+item.real_name+"</a></li>";
								
								//if( !(loggedInUsers.indexOf(item.username) > -1))
									//loggedInUsers.push(item.username);
							});
							
							msg+="</ul>";
						}
					}
					
					$("#chatUsersDiv").html(msg);
				},
				error: function() 
				{
					//alert("No data");
				},
				beforeSend: function( event, ui ) 
				{
					//$("#wait").html("<center style='font-size: 14' ><span id='loading' style='font-size: 14; color:red'><i class='fa fa-spinner fa-spin' style='font-size:24px'></i> <b>Loading... </b></span></center>");
				}
			});
		}
		
		
		window.setInterval(function()
		{
		  getLoggedInUsers();
		}, 10000);
		
		/* window.setInterval(function()
		{
		  
		  //alert(boxList);
		  //console.log(chatboxManager);
		  for(var i = 0; i < loggedInUsers.length; i ++)
		  {
		  
		  	getMessages(fromUser, loggedInUsers[i]);
		  	//getMessages(fromUser, toUser);
		  }
		}, 10000); */
		
		//function testGetMessages(id)
		function testGetMessages(id) 
        {
            var userName = id.split("_")[1];
            var loginUserName = "${userName}";
            var eventSource = new EventSource("<%=basePath%>ChatSSEServlet?userName="+userName+"&loginUserName="+loginUserName+"&boxId="+id);
            
			eventSource.addEventListener('chat_data', function(event) 
			{
				//document.getElementById('chatData').innerHTML = event.data;
				
				//alert(event.data);
				var data =event.data;
				//alert(data.split("#")[2]);
				
				/* var loginUser = data.split("#")[0];
				var boxId = data.split("#")[1];
				var retrievedData = data.split("#")[2]; */
				
				//var loginUser = data.split("__")[0];
				//var boxId = data.split("__")[1];
				//var retrievedData = data.split("__")[2];
				
				//var boxId= data.boxId;
				var loginUser=jQuery.parseJSON(data).loginUser;
				var boxId=jQuery.parseJSON(data).boxId;
				var chat_list=jQuery.parseJSON(data).chat_list;
				//alert(chat_list);
				
				var str="";
				$.each(chat_list, function(i, item)
				{
					if(item.from_username == loginUserName)
						//str+= "<div style='color: red; background-color: #FAAC9C; padding-right: 10px; border-top-right-radius: 1em; border-bottom-left-radius: 1em;'>"+item.from_username+" ("+item.sent_time+") : "+item.message+"</div><br>";
						//str+= "<div style='color: red; background-color: #90FCFC; padding: 10px; border-top-right-radius: 1em; border-bottom-left-radius: 1em; border: 1px solid black;'>"+item.message+"</div><div class='clear'></div>";
						str+= "<div class='bubble'>"+item.message+"</div>";
					else
						//str+= "<div style='color: blue; background-color: #D9FC90; padding-left: 10px; text-align: right; border-top-left-radius: 1em; border-bottom-right-radius: 1em;'>"+item.from_username+" ("+item.sent_time+") : "+item.message+"</div><br>";
						//str+= "<div style='color: blue; background-color: #D9FC90; padding: 10px; text-align: right; border-top-left-radius: 1em; border-bottom-right-radius: 1em; border: 1px solid black;'>"+item.message+"</div><div class='clear'></div>";
						str+= "<div class='bubble bubble-alt yellow'>"+item.message+"</div>";
						
				});
				
				//var kids = $("#"+id+"")[0];
				var kids = $("#"+boxId+"")[0];
				
				$(kids).empty();
				//$(kids).html(event.data);
				$(kids).html(str);
				var wtf = $("#"+id);
				var height = wtf[0].scrollHeight;
				wtf.scrollTop(height);
				
				//console.log = event.data;
			}, false);
		}
		
		//window.addEventListener("load", testGetMessages);
	</script>
	
	<style type="text/css">
		.datestamp 
		{
		  display: block;
		  text-align: center;
		  font-weight: bold;
		  margin-bottom: 6px;
		  color: #8b91a0;
		  text-shadow: 1px 1px 0 rgba(255,255,255,0.6);
		}
		 
		.bubble {
		  box-sizing: border-box;
		  float: left;
		  width: auto;
		  max-width: 90%;
		  position: relative;
		  clear: both;
		 
		  background: #95c2fd;
		  background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0.15, #bee2ff), color-stop(1, #95c2fd));
		  background-image: -webkit-linear-gradient(bottom, #bee2ff 15%, #95c2fd 100%);
		  background-image: -moz-linear-gradient(bottom, #bee2ff 15%, #95c2fd 100%);
		  background-image: -ms-linear-gradient(bottom, #bee2ff 15%, #95c2fd 100%);
		  background-image: -o-linear-gradient(bottom, #bee2ff 15%, #95c2fd 100%);
		  background-image: linear-gradient(bottom, #bee2ff 15%, #95c2fd 100%);
		  filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#95c2fd', endColorstr='#bee2ff');
		 
		  border: solid 1px rgba(0,0,0,0.5);
		  -webkit-border-radius: 20px;
		  -moz-border-radius: 20px;
		  border-radius: 20px;
		 
		  -webkit-box-shadow: inset 0 8px 5px rgba(255,255,255,0.65), 0 1px 2px rgba(0,0,0,0.2);
		  -moz-box-shadow: inset 0 8px 5px rgba(255,255,255,0.65), 0 1px 2px rgba(0,0,0,0.2);
		  box-shadow: inset 0 8px 5px rgba(255,255,255,0.65), 0 1px 2px rgba(0,0,0,0.2);
		  margin-bottom: 10px;
		  padding: 6px 10px;
		  color: #000;
		  text-shadow: 0 1px 1px rgba(255,255,255,0.8);
		  word-wrap: break-word;
		  font-size: 10px;
		  font-weight: bold;
		}
        
        .bubble:before, .bubble:after {
		  border-radius: 20px / 5px;
		  content: '';
		  display: block;
		  position: absolute;
		}
		
		.bubble:before 
		{
		  border: 10px solid transparent;
		  border-bottom-color: rgba(0,0,0,0.5);
		  bottom: 0px;
		  left: -7px;
		  z-index: -2;
		}
		
		.bubble:after 
		{
		  border: 8px solid transparent;
		  border-bottom-color: #bee2ff;
		  bottom: 1px;
		  left: -5px;
		}
        
        .bubble-alt 
        {
		  float: right;
		}
		
		.bubble-alt:before 
		{
		  left: auto;
		  right: -7px;
		}
		
		.bubble-alt:after 
		{
		  left: auto;
		  right: -5px;
		}
		 
		.bubble p {
		  font-size: 1.4em;
		}
		
		.yellow 
		{
		  background: #7acd47;
		  background-image: -webkit-gradient(linear,left bottom,left top,color-stop(0.15, #fcf3c3),color-stop(1, #f4e371));
		  background-image: -webkit-linear-gradient(bottom, #fcf3c3 15%, #f4e371 100%);
		  background-image: -moz-linear-gradient(bottom, #fcf3c3 15%, #f4e371 100%);
		  background-image: -ms-linear-gradient(bottom, #fcf3c3 15%, #f4e371 100%);
		  background-image: -o-linear-gradient(bottom, #fcf3c3 15%, #f4e371 100%);
		  background-image: linear-gradient(bottom, #fcf3c3 15%, #f4e371 100%);
		  filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#f4e371', endColorstr='#fcf3c3');
		}
		
		.yellow:after 
		{
		  border-bottom-color: #fcf3c3;
		}
		
	</style>
	
  </head>
  
  <body onload="getLoggedInUsers()" >
  	<html:form action="/messageService" enctype="multipart/form-data">
		<html:hidden property="mode" name="dynaForm"/>
		
		   <logic:notEmpty name="services" scope="session"> 
			    <div id="sidebar-wrapper">
					<div class="chat-people-div">
						<div class="sidenav-title">
							<input id="search-people" type="text" class="form-control" placeholder="Search People" style="margin: 10px 0px; border-radius: 10px"/>
						</div>
						
							<div id="chatData" style="color: red; background-color: #FAAC9C;padding-left: 10px; text-align: right; border-radius:10px">
								
							</div>
							
							<div id="chatUsersDiv">
								
							</div>
							
							<%-- <ul class="nav nav-sidebar" style="margin-bottom:10px;">
								<logic:present name="chatUsers" scope="session">
									<logic:iterate id="user" name="chatUsers">
									
										<li><a onclick="openChatBox('${user.username}', '${user.username}','${userName }')" style="cursor: pointer;"><img data-name="${user.real_name}" class="profile"/> ${user.real_name}</a></li>
										
									<!-- <li style="text-align: center; background: #fc7658; color:#fff; padding:5px 5px; font-weight:bold;">Team People</li> -->
						  			
						  			</logic:iterate>
						  		</logic:present>
							</ul> --%>
						
					<div id="chat_div"></div>
						
						<!-- <input type="button" name="toggle" value="toggle" /> -->
						
				  	</div>
				  <!-- 	<div class="chat-box-div" style="background-color: white">
				  	
				  	</div> -->
				
				</div>
			</logic:notEmpty>
		</html:form>
		
		
		<!-- <script type="text/javascript" src="js/onready.js"></script>
		<script type="text/javascript" src="js/browserclosurenotice.js"></script> -->
	
		<script type="text/javascript">
		
		<%-- <%
			String roonName = null;
			String nickname = (String)session.getAttribute("nickname");
			ChatRoomList roomList = null;
			ChatRoom chatRoom = null;
			Chatter chatter = null;
			Message[] messages = null;
		
				try
				{
					roomList = (ChatRoomList) application.getAttribute("chatroomlist");
					roonName = roomList.getRoomOfChatter(nickname).getName();
					if (roonName != null && roonName != "")
					{
						chatRoom = roomList.getRoom(roonName);
						chatter = chatRoom.getChatter(nickname);
						if (chatRoom != null)
						{
							long enteredAt = chatter.getEnteredInRoomAt();
							if (enteredAt != -1)
							{
								messages = chatRoom.getMessages(enteredAt);					
							}
							else
							{
								messages = chatRoom.getMessages(chatter.getLoginTime());
							}
		
						}
						else
						{
							out.write("<b>Room " + roonName + " not found</b>");
							out.close();
						}
					}
				}
				catch(Exception e)
				{
					System.out.println("Exception: "+ e.getMessage());
					throw new ServletException("Unable to get handle to ServletContext");
				}	
		%> --%>
			/* Removed Code */
			
			//window.onbeforeunload = function (e) 
		   // {
		    	/* var args = { callback:function(){ logout(); }, maxTimes:0, stepsTakenToClose:20, distanceNearClose:100 };
		    	var pcb = new BrowserClosureNotice( args );
				pcb.detect(); */
		   // }
	        
			
			//$('body').click(function() 
		//	{
			   /* 	$(window).bind("beforeunload", function() 
				{ 
			        //logout();
			    }); */
			    
			   // alert(window.performance.navigation.type);
			    
			    /* var logoutFlag = false;
			        
		        if ( window.performance.navigation.type == 0 || window.performance.navigation.type == 1 || window.performance.navigation.type == 2 || window.performance.navigation.type == 255)
		        	logoutFlag = false;
		        else
		        	logoutFlag = true; */
			    
			    <%-- window.onbeforeunload = function (e) 
			    {
			        //console.log(window.performance.navigation.type);
			        if(logoutFlag)
			        {
				        var url = '<%=basePath%>/updateSession';
						$.ajax(
						{
							type: "POST",
							url:url,
							data: { },
							cache: false,
							success: function(response)
							{ },
						});
					}
			    }; --%>
			    
			    //document.onclick = handleMouseClick;
			   
		//	});
			
			
			<%-- function handleMouseClick(event) 
		    {
		      var eventDoc, doc, body, pageX, pageY;
		      
		      event = event || window.event; // IE-ism
		      
		      // If pageX/Y aren't available and clientX/Y  // are, calculate pageX/Y - logic taken from jQuery // Calculate pageX/Y if missing and clientX/Y available
					
		      if (event.pageX == null && event.clientX != null) 
		      {
		        eventDoc = (event.target && event.target.ownerDocument) || document;
		        doc = eventDoc.documentElement;
		        body = eventDoc.body;
		
		        event.pageX = event.clientX + (doc && doc.scrollLeft || body && body.scrollLeft || 0) - (doc && doc.clientLeft || body && body.clientLeft || 0);
		        event.pageY = event.clientY + (doc && doc.scrollTop  || body && body.scrollTop  || 0) - (doc && doc.clientTop  || body && body.clientTop  || 0 );
		      }
			
			alert(event.pageX);
			alert(event.pageY);
			var logoutFlag = true;
	       	//var href = location.href;
	       	//var hrefLength = href.length;
	       
	       	//if(hrefLength > 0)
	       		//logoutFlag = false;
		    
			    if(logoutFlag == true)
		        //if(logoutFlag)
		        {
			        var url = '<%=basePath%>/updateSession';
					$.ajax(
					{
						type: "POST",
						url:url,
						data: { },
						cache: false,
						success: function(response)
						{ },
					});
				}
		      
		    } --%>
			
			/* window.onbeforeunload = function (e) 
		    {
		       	document.onmousemove = handleMouseMove;
		       	
		       
		    };	 */		   	
		    
		    
		     /* window.onbeforeunload = function (e) 
		     {
		        //if (window.performance.navigation.type == 1) 
			    	//sessionStorage.setItem("is_reloaded", "1");
			    //else
		        	//sessionStorage.setItem("is_reloaded", "0");	
			    	
			    //if(sessionStorage.getItem("is_reloaded") == "0")
			    alert(window.performance.navigation.type);
			    
			    if (window.performance.navigation.type != 0)
			    {	
			        $.ajax({
			            type: "POST",
			            url: url,
			            cache: false,
			            data: { isRefresh: 'Close', navigation : window.performance.navigation.type  }
			        });
			    }
		    };
		
		    window.onload = function (e) 
		    {
		        //if (window.performance.navigation.type == 1)
		        	//sessionStorage.setItem("is_reloaded", "1");
		        //else
		        	//sessionStorage.setItem("is_reloaded", "0");
		        
		        $.ajax({
		            type: "POST",
		            url: url,
		            cache: false,
		            data: {isRefresh:'Load'}
		        });
		    }; */
		    
		    /* function checkClose()
			{
				logout();
			} */
		    
		    <%-- function checkClose()
			{
			    if (self.closed == true)
			    {
					var url = '<%=basePath%>/updateSession';
					$.ajax(
					{
						type: "POST",
						url:url,
						data: { },
						cache: false,
						success: function(response)
						{ },
					});
			    }
			    setTimeOut("checkClose()" , 1000);
			} --%>
			
			<%-- {
			    if(sessionStorage.getItem("is_reloaded") == false)
			    {
				    var url = '<%=basePath%>/updateSession';
			        $.ajax({
			            type: 'GET',
			            async: false,
			            url: url,
			            data: {isRefresh:'Close'}
			        });
			    }
			} --%>
		    
		   /*  if ((window.event.clientX < 0) || (window.event.clientY<0)) // close button
			{
				logout();
			}
			else if (window.event.altKey == true) // ALT + F4
			{
				logout();
			} */
		
		</script>
  </body>
  
</html>
