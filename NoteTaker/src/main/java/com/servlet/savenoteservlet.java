package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Note;
import com.helper.FactoryProvider;

public class savenoteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public savenoteservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id =(request.getParameter("id"));
//			System.out.println(id);
//			hibernate save 
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			Note note;
			if (!id.equals("") && id != null) {
				note = (Note) session.get(Note.class, Integer.parseInt(id));
				note.setContent(content);
				note.setTitle(title);
				note.setId(Integer.parseInt(id));
				note.setAddedDate(new Date());
			} else {
				note = new Note(title, content, new Date());
				session.save(note);
			}
			tx.commit();
			session.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("<h1 style='text-align:center;'>Data Saved</h1>");
			out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View All Notes</a></h1>");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
