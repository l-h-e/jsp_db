<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
</head>
<body>
<h1>test</h1>
<br>
<%


				out.println("<form method=\"post\" action=\"update.jsp\">");
				out.println("<table border=\"0\">");
				out.println("<tr>");
				out.println("<td>");
				out.println("<textarea name=\"name\" rows=\"1\" cols=\"30\" placeholder=\"アルゴリズム名\"></textarea>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<td>");
				out.println("<textarea name=\"definition\" rows=\"2\" cols=\"30\" placeholder=\"定義\"></textarea>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<td>");
				out.println("<textarea name=\"explanation\" rows=\"4\" cols=\"30\" placeholder=\"説明\"></textarea>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<td>");
				out.println("<textarea name=\"note\" rows=\"2\" cols=\"30\" placeholder=\"備考\"></textarea>");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>");
				out.println("<input type=\"submit\" value=\"登録\">");
				out.println("</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td>");
				out.println("<hr>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</form>");

				out.println("<form method=\"post\" action=\"search.jsp\">");
				out.println("<input type=\"text\" name=\"name\" size=\"20\" maxlength=\"50\" placeholder=\"\">");
				out.println("<input type=\"submit\" value=\"検索\">");
				out.println("</form>");

				out.println("<form method=\"post\" action=\"list.jsp\">");
				out.println("<input type=\"submit\" value=\"一覧\">");
				out.println("</form>");



//int learning = state.executeUpdate("INSERT INTO learning(name, definition, explanation, note) VALUES (name,definition,explanation,explanation,note);");

%>

</body>
</html>
