<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.net.*" %>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
// 変数定義
Connection conn = null;
Statement state = null;
ResultSet rs = null;
ResultSetMetaData md = null;
int colcnt = 0;

%>
<!DOCTYPE html>
<html>
<head>
<title>test</title>
</head>
<body>
<%

Class.forName("org.sqlite.JDBC");
//conn = DriverManager.getConnection("jdbc:sqlite:d.db");
conn = DriverManager.getConnection("jdbc:sqlite:/home/sys/s206215/apache-tomcat-8.0.44/webapps/a6/d.db");
state= conn.createStatement();

//String learning_id = request.getParameter("learning_id");

rs = state.executeQuery("SELECT * FROM learning"); 
colcnt = state.executeUpdate ("SELECT * FROM learning");
md = rs.getMetaData();

String name = request.getParameter("name");
String definition = request.getParameter("definition");
String explanation = request.getParameter("explanation");
String note = request.getParameter("note");
//String sql = "INSERT INTO learning(name, definition, explanation, note) VALUES ('"+name+"','"+definition+"','"+explanation+"','"+note+"');";

String sql = "INSERT INTO learning(name, definition, explanation, note) VALUES (?,?,?,?);";
PreparedStatement pstmt = conn.prepareStatement(sql);


if(name==""){
out.println("<h1>ERROR！</h1>");
out.println("名前を入力してください！");
}else{

out.println("<h1>登録完了</h1><br>");

pstmt.setString(1,name);
pstmt.setString(2,definition);
pstmt.setString(3,explanation);
pstmt.setString(4,note);
pstmt.executeUpdate();
//int learning = state.executeUpdate(sql);

out.println("名前："+name);
out.println("<BR>");
out.println("定義："+definition+"\n");
out.println("<BR>");
out.println("説明："+explanation+"\n");
out.println("<BR>");
out.println("備考："+note+"\n");

}
// DB接続終了
state.close(); state = null;
conn.close(); conn = null;
%>
<BR>
<form method="post" action="index.jsp">
<input type="submit" value="戻る">
</form>
</body>
</html>
