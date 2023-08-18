<%--
  Created by IntelliJ IDEA.
  User: TranDangQuoc
  Date: 02/01/2023
  Time: 8:39 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ContactService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" xmlns:x-transition="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý liên hệ</title>
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
    <link href="fontawesome-free-6.2.1/css/all.css" rel="stylesheet">
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

               <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct"> <button class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                   Quay lại
               </button></a>
                <!-- Search input -->

                <ul class="flex items-center flex-shrink-0 space-x-6">
                </ul>
            </div>
        </header>
        <main class="h-full pb-16 overflow-y-auto">
            <div class="container grid px-6 mx-auto">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                    Quản lý liên hệ
                </h2>
                <!-- Filter-->
                <!-- With actions -->
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                </h4>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                <div class="w-full overflow-x-auto">
                    <table class="w-full whitespace-no-wrap">
                        <thead>
                        <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                            <th class="px-4 py-3">Tên</th>
                            <th class="px-4 py-3">Tiêu đề</th>
                            <th class="px-4 py-3">Thời gian</th>
                            <th class="px-4 py-3">Chỉnh sửa</th>
                        </tr>
                        </thead>
                        <tbody
                                class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                        <%
                            List<Contact> data = (List<Contact>) request.getAttribute("list");

                            int first = 0, last = 0, pages = 1;

                            if (request.getParameter("pages") != null) {
                                pages = (int) Integer.parseInt(request.getParameter("pages"));
                            }
                            //Lấy tổng sản phẩm trong data bằng query select count(id) from name_table với JDBC Connect
                            int total = new ContactService().quantity();


                            if (total <= 6) {
                                first = 0;
                                last = total;
                            } else {
                                first = (pages - 1) * 6;
                                last = 6;
                            }
                            //Lấy ra danh sách sản phẩm
                            List<Contact> list = new ContactService().pagination(first,last,data);
                            for (Contact c : list) {
                        %>
                        <%--                            <%--%>
                        <%--                                List<Contact> list = (List<Contact>) request.getAttribute("list");--%>
                        <%--                                for(Contact c : list){--%>
                        <%--                            %>--%>
                        <tr class="text-gray-700 dark:text-gray-400">

                            <td class="px-4 py-3">

                                <div class="flex items-center text-sm">
                                    <!-- Avatar with inset shadow -->

                                    <div>
                                        <p class="font-semibold"><%= c.getName()%></p>

                                    </div>
                                </div>

                            </td>

                            <td class="px-4 py-3 text-sm">

                                <%= c.getSubject()%>

                            </td>
                            <td class="px-4 py-3 text-sm">

                                <%= c.getDate()%>

                            </td>

                            <td class="px-4 py-3">
                                <div class="flex items-center space-x-4 text-sm">

                                    <a href="<%="/Project_CuaHangMuBaoHiem_war/DetailContact?id="+c.getId()+"&pages="+pages%>">
                                        <i class="fa fa-eye" ></i>
                                    </a>

                                    <a href="<%="/Project_CuaHangMuBaoHiem_war/RemoveContact?id="+c.getId()%>">
                                        <button
                                                class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"
                                                aria-label="Delete">
                                            <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                                <path
                                                        fill-rule="evenodd"
                                                        d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                                                        clip-rule="evenodd"
                                                ></path>
                                            </svg>
                                        </button>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
                <div
                        class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
                >
                <span class="flex items-center col-span-3">
                    <% int f;
                        if(first+last>total){
                            f= total;
                        }else{
                            f = first+last;
                        }
                    %>
                  Hiển thị <%= first+1%>-<%=f%> của <%=total%>
                </span>
                    <span class="col-span-2"></span>
                    <!-- Pagination -->
                    <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    <ul class="inline-flex items-center">
                        <%   //Button Previous
                            int back = 0;
                            if (pages == 0 || pages == 1) {
                                back = 1;//Luon la page 1
                            } else {
                                back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
                            }
                        %>

                      <li>
                        <a href="/Project_CuaHangMuBaoHiem_war/ManageContact?pages=<%=back%>">
                            <button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                                    aria-label="Previous">
                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                            <path d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg>
                        </button>
                      </a>
                      </li>
                        <%
                            //Button Number pages
                            int loop = 0, num = 0;
                            if ((total / 6) % 2 == 0) {
                                num = total / 6;
                            } else {
                                num = (total + 1) / 6;
                            }
                            //Nếu total lẻ thêm 1
                            if (total % 2 != 0) {
                                loop = (total / 6) + 1;

                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                                if (total < (num * 6) + 6 && total != num * 6) {
                                    loop = (total / 6) + 1;
                                } else {
                                    //Nếu bằng fullPage thì không thêm
                                    loop = (total / 6);
                                }
                            }
                            //Lap so pages
                            for (int i = 1; i <= loop; i++) {%>
                <% if (pages == i) {%>

                      <li>
                          <a href="/Project_CuaHangMuBaoHiem_war/ManageContact?pages=<%=i%>">
                        <button
                                class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                          <%= i %>
                        </button>
                          </a>
                      </li>
                        <%} else {%>

                        <li>
                          <a href="/Project_CuaHangMuBaoHiem_war/ManageContact?pages=<%=i%>">
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
                          <%= i %>
                        </button>
                          </a>
                      </li>
                        <%}
                        }%>
                        <%
                            //Button Next
                            int next = 0;
                            //Nếu total lẻ
                            if (total % 2 != 0) {
                                if (pages == (total / 6) + 1) {
                                    next = pages;//Khong next
                                } else {
                                    next = pages + 1;//Co next
                                }
                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage
                                //Và không fullPage thì thêm 1
                                if (total < (num * 6) + 6 && total != num * 6) {
                                    if (pages == (total / 6) + 1) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                } else {
                                    //Nếu fullPage đến trang cuối dừng
                                    //Chưa tới trang cuối thì được next
                                    if (pages == (total / 6)) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                }
                            }
                        %>
                      <li>
                          <a href="/Project_CuaHangMuBaoHiem_war/ManageContact?pages=<%=next%>">
                        <button class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                                aria-label="Next">
                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                            <path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                  clip-rule="evenodd"
                                  fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>
                      </a>
                      </li>
                    </ul>
                  </nav>
                </span>
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

