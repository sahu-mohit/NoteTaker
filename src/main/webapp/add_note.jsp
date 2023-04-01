<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<title>Add Note</title>
<%@ include file="all_js_css.jsp"%>
<%@page import="com.helper.*,com.entites.*,org.hibernate.*"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<%
String id = request.getParameter("id");
if (id == (null) || id.equals("")) {
	%>
	<script type="text/javascript">
	$( document ).ready(function(){
		$("#heading").html("Pleace Add Note");	
	})
	</script>
	<%
} else {
Session s = FactoryProvider.getFactory().openSession();
Note note = (Note) s.get(Note.class, Integer.parseInt(id));
%>
<script type="text/javascript">
	$( document ).ready(function(){
		$("#heading").html("Pleace Edit Note");	
		$("#title").val(`<%=note.getTitle()%>`);
		$("#content").val(`<%=note.getContent()%>`);
		$("#id").val(<%=note.getId()%>);
	})
	
	</script>
<%
}
%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>


		<h1 id="heading"></h1>
		<form action="savenoteservlet" method="post">
		<input type = "hidden" id="id" name="id">
			<div class="form-group">
				<label for="title">Note title</label> <input required="required"
					type="text" name="title" class="form-control" id="title"
					aria-describedby="Note" placeholder="Enter here">
			</div>
			<div class="form-group">
				<label for="content">Content</label>
				<textarea required="required" name="content" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 200px;"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

</body>
</html>