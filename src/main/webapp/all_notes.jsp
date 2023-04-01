<!doctype html>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.entites.Note"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="java.text.SimpleDateFormat"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%@ include file="all_js_css.jsp"%>
<title>All Notes</title>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>ALL NOTES:</h1>
		<div class="row">
			<div class="col-12">
				<%
				String fts = request.getParameter("fts");
				Session s = FactoryProvider.getFactory().openSession();
				Query query;
				if(fts != null && !fts.equals("")){
					query = s.createQuery("From Note as n where n.title like ?1 or n.content like ?1 ");
					query.setString(1, "%"+fts+"%");
				}else{
				query = s.createQuery("from Note");
				}
				List<Note> list = query.list(); 
				for (Note note : list) {
					Date date = note.getAddedDate();
					SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
					String format = formatter.format(date);
				%>
				<div class="card mt-3 pl-4 pt-4">
					<img class="card-img-top" style="height: 50px; width: 50px;"
						src="images/notepad1.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle()%><h6><b><%=" "+format%></b></h6></h5>
						<p class="card-text"><%=note.getContent()%>.
						</p>
						<div class="container" style="text-align: center;">
							<div class="row">
								<a href="DeleteServlet?note_id=<%=note.getId()%>"><button
										type="button" class="btn btn-danger mt-2 mr-2"
										style="height: 40px; width: 80px;">Delete</button></a>
								<form action="add_note.jsp" method="get">
									<input type="hidden" id="id" name="id" value=<%=note.getId()%>>
									<button type="submit" class="btn btn-primary mt-2"
										style="height: 40px; width: 80px;">Update</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				s.close();
				%>
			</div>
		</div>

	</div>
</body>
</html>