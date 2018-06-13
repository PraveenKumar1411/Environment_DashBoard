<%-- 
    Document   : index
    Created on : Jun 12, 2018, 11:37:43 PM
    Author     : PraveenKumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.net.*,java.io.*,java.lang.*,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DashBoard</title>
    </head>
    <body>
    <center>  <h1>Development Environment Status</h1> </center>
       <!-- <form name="dash" action="./DashBoardServlet_1" method="get">
            <input type="submit" value="click me"/>
        </form>
        -->
        <center>
        <% 
            response.setIntHeader("Refresh", 10);
        %>
         Time : <%=new java.util.Date()%> </center>
        
        
       <!-- <%
            //try {
              //      URL oracle=new URL("http://www.google.com/");
                //    BufferedReader in= new BufferedReader(new InputStreamReader(oracle.openStream()));
                  //  
                    //String inputline;
                      // while((inputline = in.readLine()) != null){
                        //   System.out.println(inputline);
                          // in.close();
                       //}
          //  }
            //catch(Exception ex){
             //   System.out.println(ex);
           // }
        %> -->
        
        <h2><font color="blue"><u>DT_01 Server's Instance Status</u></font></h2>
        
        <%
            char instance[]={'A','B','C','M'};
            String arr_DT01[]={"http://localhost:8081/Instance_A/","http://localhost:8081/Instance_B/",
           "http://localhost:8081/Instance_C/","http://localhost:8081/Instance_M/"};
            for(int i=0;i<arr_DT01.length;i++){
                
            try{
            URL uri= new URL(arr_DT01[i]);
        URLConnection ec = uri.openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(
                ec.getInputStream(), "UTF-8"));
        String inputLine;
        //StringBuilder a = new StringBuilder();
        //while ((inputLine = in.readLine()) != null){
            //a.append(inputLine);
        //}
            inputLine=in.readLine();
        in.close();
        
        
        
        //out.println(a.toString()); 
        %> 
        <div>
        <%
        if (inputLine.equalsIgnoreCase("serverup")){ 
        %>
        <h3><font color ="green" >DT01 Instance <%=instance[i]%> is Up...!</font></h3>
        <%}
else{
    %>
        <h3><font color ="red">DT01 Instance <%=instance[i]%> is  Down...!</font></h3>
    <%
}    
       %> </div> <%
        

}
catch (Exception ex){
    //out.println(ex);
    String m_url=arr_DT01[i];
    %>
        <h3><font color ="red">DT01 Physical Machine Down / DT01 instance <%=instance[i]%> is Down...! </font></h3> 
        
    <%
        out.print("Heart Beat URL:"+m_url);
}
}
        %> 
    </body>
</html>
