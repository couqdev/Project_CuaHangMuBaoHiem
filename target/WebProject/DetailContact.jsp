<%--
  Created by IntelliJ IDEA.
  User: TranDangQuoc
  Date: 02/01/2023
  Time: 9:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" xmlns:x-transition="http://www.w3.org/1999/xhtml">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tables - Windmill Dashboard</title>
  <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet"
  />
  <link rel="stylesheet" href="admin/assets/css/tailwind.output.css" />
  <link rel="stylesheet" href="admin/assets/css/filter.css" />
  <script
          src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
          defer
  ></script>
  <script src="admin/assets/js/init-alpine.js"></script>
</head>
<body>
<div
        class="flex h-screen bg-gray-50 dark:bg-gray-900"
        :class="{ 'overflow-hidden': isSideMenuOpen}"
>

  <!-- Mobile sidebar -->
  <!-- Backdrop -->
  <div class="flex flex-col flex-1 w-full">
    <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
      <div class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">

        <a href="/Project_CuaHangMuBaoHiem_war/ManageContact?pages=<%= request.getAttribute("pages") %>"> <button class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
          Quay lại
        </button></a>
        <!-- Search input -->
        <ul class="flex items-center flex-shrink-0 space-x-6">
        </ul>
      </div>
    </header>
    <% Contact c= (Contact) request.getAttribute("contact"); %>
    <main class="h-full pb-16 overflow-y-auto">
      <div class="container grid px-6 mx-auto">
        <h2
                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200" >
          Tiêu đề:
          <%= c.getSubject() %>
        </h2>
        <h2
                class="text-3xl" >

        </h2>

        <!-- With actions -->
        <h4
                class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
        >

        </h4>
        <div class="w-full overflow-hidden rounded-lg shadow-xs">
          <div class="w-full overflow-x-auto" style="background: #d5d6d7;color: #24262d;padding-left: 20px;padding-right: 20px;padding-top: 20px">
            <%= c.getDate() %><br>
            Email: <%= c.getEmail() %><br>Tên người gửi: <%= c.getName() %>
          </div>
          <div style="background: #d5d6d7;color: #24262d; padding: 20px;">
            <%= c.getContent() %>

          </div>
        </div>
        <%
          String message = (String)session.getAttribute("message"); // Lấy thông báo từ session
          session.removeAttribute("message"); // Xóa thông báo khỏi session

          if (message != null) { // Nếu thông báo có giá trị
        %>
        <script>
          alert("<%=message%>"); // Hiển thị alert với thông báo được truyền từ Servlet
        </script>
        <%
          }
        %>
      </div>
    </main>
  </div>
</div>
</body>
</html>

