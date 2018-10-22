<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <html>
  <head>
   <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
    </head> 
  <body>
   <meta charset="utf-8"> 
   <title> web socket funcionando </title>
    <script language="javascript" type="text/javascript">
     var wsUri = getRootUri() + "/ws01/hello";
      function getRootUri() {
           return "ws://" + (document.location.hostname == "" ? "localhost" 
                   : document.location.hostname) 
                   + ":" + (document.location.port == "" ? "8080" 
                           : document.location.port);  
           }
       function init() {
            output = document.getElementById("output");

            }
        function send_message() { 
            websocket = new WebSocket(wsUri);
            websocket.onopen = function(evt) {
                 onOpen(evt)
            };
            websocket.onmessage = function(evt) {
                 onMessage(evt)
            };
            websocket.onerror = function(evt) { 
                onError(evt) 
            };
        }
     	function onOpen(evt) {
         	  writeToScreen("Connected to Endpoint!");
         	   doSend(textID.value);
       	}
       	function onMessage(evt) {
           	 writeToScreen("Mensaje recibido: " + evt.data);
      	}
       	function onError(evt) {
            writeToScreen('<span style="color: red;">ERROR:</span> ' + evt.data); 
      	} 
      	function doSend(message) {
          	 writeToScreen("Mensaje enviado: " + message);
          	 websocket.send(message);
     	} 
     	function writeToScreen(message) {
         	 var pre = document.createElement("p");
         	 pre.style.wordWrap = "break-word";
         	 pre.innerHTML = message; output.appendChild(pre);
       }
         window.addEventListener("load", init, false);
 </script>
  <h2 style="text-align: center;"> Proyecto Iris </h2>
   <br>
    <div style="text-align: center;"> 
    <form action="">
     <input onclick="send_message()" value="Send" type="button">
      <input id="textID" name="message" value="Hello WebSocket!" type="text">
      <br>
   	</form>
    </div> 
    <div id="output"></div>
  </body> 
  </html>