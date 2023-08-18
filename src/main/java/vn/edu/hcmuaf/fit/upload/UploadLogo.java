package vn.edu.hcmuaf.fit.upload;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.service.SlideShowService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "UploadLogo", value = "/UploadLogo")
public class UploadLogo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader = null;
    @Override
    public void init() throws ServletException{
        DiskFileItemFactory fileFactory = new DiskFileItemFactory();
        File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
        fileFactory.setRepository(filesDir);
        this.uploader = new ServletFileUpload(fileFactory);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        if(fileName == null || fileName.equals("")){
            throw new ServletException("File Name can't be null or empty");
        }
        File file = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+fileName);
        if(!file.exists()){
            throw new ServletException("File doesn't exists on server.");
        }
//        response.sendRedirect("/helmet/manage/upload/"+fileName);
        System.out.println("File location on server::"+file.getAbsolutePath());
        ServletContext ctx = getServletContext();
        InputStream fis = new FileInputStream(file);
        String mimeType = ctx.getMimeType(file.getAbsolutePath());
        response.setContentType(mimeType != null? mimeType:"application/octet-stream");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

        ServletOutputStream os = response.getOutputStream();
        byte[] bufferData = new byte[1024];
        int read=0;
        while((read = fis.read(bufferData))!= -1){
            os.write(bufferData, 0, read);
        }
        os.flush();
        os.close();
        fis.close();
        System.out.println("File downloaded at client successfully");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(!ServletFileUpload.isMultipartContent(request)){
            throw new ServletException("Content type is not multipart/form-data");
        }
//        request.getParameter("id");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.write("<html><head></head><body>");
        try {
            List<FileItem> fileItemsList = uploader.parseRequest(request);
            Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
            FileItem fileItem = null;
            while(fileItemsIterator.hasNext()){
                fileItem = fileItemsIterator.next();

                File file = new File(request.getServletContext().
                        getAttribute("FILES_DIR")+File.separator+fileItem.getName());
                fileItem.write(file);
                out.write("Thêm thành công");
                SlideShowService.getInstance().insertLogo("/Project_CuaHangMuBaoHiem_war/manage/upload/"+fileItem.getName());
                response.sendRedirect("/Project_CuaHangMuBaoHiem_war/ManageHome");
            }


        } catch (FileUploadException e) {
            out.write("Tải ảnh lên không thành công.");
        } catch (Exception e) {
            out.write("Tải ảnh lên không thành công");
        }
        out.write("</body></html>");
    }
}
