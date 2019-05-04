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
<h1>検索結果</h1>
<br>
<%
String name = request.getParameter("name");
out.println(name+" の検索結果");
Class.forName("org.sqlite.JDBC");
//conn = DriverManager.getConnection("jdbc:sqlite:d.db");
conn = DriverManager.getConnection("jdbc:sqlite:/home/sys/s206215/apache-tomcat-8.0.44/webapps/a6/d.db");
state= conn.createStatement();

String sql = "SELECT * FROM learning WHERE name LIKE ?";
PreparedStatement pstmt = conn.prepareStatement(sql);

//String learning_id = request.getParameter("learning_id");
pstmt.setString(1,"%"+name+"%");
rs = pstmt.executeQuery(); 
md = rs.getMetaData();
colcnt = md.getColumnCount();
//out.println(name);
int flag=0;
// 1行ずつ獲得してHTMLに

%><table border="1">
<%
while(rs.next()){
%>
<%
if(flag==0){%>
<tr>
<td>名前</td>
<td>定義</td>
<td>説明</td>
<td>備考</td>
</tr>
<%
flag++;
}
%>
<tr>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("definition")%></td>
<td><%=rs.getString("explanation")%></td>
<td><%=rs.getString("note")%></td>
</tr>
<%
}
%>
</table>
<%

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
