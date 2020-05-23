package tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

// classe SimpleTagSupport é utilizada com Servelet
public class TagCursoJSP extends SimpleTagSupport {
	
	//Sobrescrevendo o metodo doTag
	@Override
	public void doTag() throws JspException, IOException {
		
		JspWriter out = getJspContext().getOut();
		out.println("Tag JSP customizada gerada na mão");
	}

}
