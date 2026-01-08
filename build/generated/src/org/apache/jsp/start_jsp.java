package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class start_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Roadside Vehicle Breakdown Assistant Locator</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("             background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);\n");
      out.write("            min-height: 100vh;\n");
      out.write("            overflow: hidden;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Header Styles */\n");
      out.write("        .header {\n");
      out.write("            text-align: center;\n");
      out.write("            padding: 1.5rem;\n");
      out.write("            color: white;\n");
      out.write("            background-color: #5a9bd5;\n");
      out.write("            animation: fadeIn 2s ease-in-out;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .header h1 {\n");
      out.write("            font-size: 2.5rem;\n");
      out.write("            margin: 0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Container Flexbox to center elements horizontally */\n");
      out.write("        .container {\n");
      out.write("            display: flex;\n");
      out.write("            justify-content: center;\n");
      out.write("            align-items: flex-start; /* Keep container below the header */\n");
      out.write("            padding-top: 50px; /* Space between the header and the box */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Flux Box Styles */\n");
      out.write("        .flux-box {\n");
      out.write("            background-color: rgba(255, 255, 255, 0.9);\n");
      out.write("            border-radius: 1rem;\n");
      out.write("            padding: 2rem;\n");
      out.write("            width: 400px;\n");
      out.write("            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);\n");
      out.write("            text-align: center;\n");
      out.write("            animation: slideIn 1.5s ease-in-out;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .flux-box h2 {\n");
      out.write("            margin-bottom: 1.5rem;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Button Styles */\n");
      out.write("        button {\n");
      out.write("            padding: 15px 25px;\n");
      out.write("            border: none;\n");
      out.write("            font-size: 18px;\n");
      out.write("            margin: 8px 0;\n");
      out.write("            cursor: pointer;\n");
      out.write("            border-radius: 30px;\n");
      out.write("            width: 100%;\n");
      out.write("            background-color: #5a9bd5;\n");
      out.write("            color: white;\n");
      out.write("            transition: background-color 0.3s ease, transform 0.3s ease;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button:hover {\n");
      out.write("            background-color: #357ABD;\n");
      out.write("            transform: translateY(-5px);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        button:active {\n");
      out.write("            background-color: #285a8d;\n");
      out.write("            transform: translateY(-2px);\n");
      out.write("        }\n");
      out.write("        .img1 {\n");
      out.write("            width: 500px;\n");
      out.write("            height: 500px; \n");
      out.write("            position: absolute;\n");
      out.write("            right: -100px;\n");
      out.write("            bottom: 20px; \n");
      out.write("            opacity: 0;\n");
      out.write("            animation: img1 2s forwards; \n");
      out.write("            animation-delay: 0.5s; \n");
      out.write("          \n");
      out.write("        \n");
      out.write("        }\n");
      out.write("        .img2 {\n");
      out.write("            width: 500px;\n");
      out.write("            height: 500px; \n");
      out.write("            position: absolute;\n");
      out.write("            right: -100px;\n");
      out.write("            bottom: 20px; \n");
      out.write("            opacity: 0;\n");
      out.write("            animation: img2 2s forwards; \n");
      out.write("            animation-delay: 0.5s; \n");
      out.write("          \n");
      out.write("        \n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Link Styles */\n");
      out.write("        a {\n");
      out.write("            text-decoration: none;\n");
      out.write("            display: block;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Animations */\n");
      out.write("        @keyframes fadeIn {\n");
      out.write("            from { opacity: 0; }\n");
      out.write("            to { opacity: 1; }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        @keyframes slideIn {\n");
      out.write("            from { transform: translateY(-50px); opacity: 0; }\n");
      out.write("            to { transform: translateY(0); opacity: 1; }\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        @keyframes img1 {\n");
      out.write("            0% {\n");
      out.write("                right: -600px; \n");
      out.write("                opacity: 0; \n");
      out.write("            }\n");
      out.write("            100% {\n");
      out.write("                right: -40px;\n");
      out.write("                opacity: 1;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        @keyframes img2 {\n");
      out.write("            0% {\n");
      out.write("                left: -600px; \n");
      out.write("                opacity: 0; \n");
      out.write("            }\n");
      out.write("            100% {\n");
      out.write("                left: -40px;\n");
      out.write("                opacity: 1;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("        \n");
      out.write("\n");
      out.write("        \n");
      out.write("        @media (max-width: 480px) {\n");
      out.write("            .flux-box {\n");
      out.write("                width: 90%;\n");
      out.write("                padding: 1.5rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .header h1 {\n");
      out.write("                font-size: 2rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            button {\n");
      out.write("                font-size: 16px;\n");
      out.write("                padding: 12px 20px;\n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"header\">\n");
      out.write("        <h1>Roadside Vehicle Breakdown Assistant Locator</h1>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <!-- Container for the centered flux-box under the header -->\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <div class=\"flux-box\">\n");
      out.write("            <h2>Join our services</h2>\n");
      out.write("            <a href=\"nearbyMechanic.jsp\"><button>Find Shop</button></a>\n");
      out.write("            <a href=\"mecLog.jsp\"><button>Mechanic Login</button></a>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <img src=\"java1 .png\" alt=\"Image Description\" class=\"img1\">\n");
      out.write("      <img src=\"java2.png\" alt=\"Image Description\" class=\"img2\">\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
