<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.model.DetailProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ImageProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %><%--
  Created by IntelliJ IDEA.
  User: TranDangQuoc
  Date: 07/01/2023
  Time: 4:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Chi tiết sản phẩm</title>
  <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet"
  />
  <link rel="stylesheet" href="admin/assets/css/tailwind.output.css" />
  <script
          src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
          defer
  ></script>
  <script src="admin/assets/js/init-alpine.js"></script>
  <script src="js/product.js"></script>
  <link href="fontawesome-free-6.2.1/css/all.css" rel="stylesheet">
</head>
<body>
<div
        class="flex h-screen bg-gray-50 dark:bg-gray-900"
        :class="{ 'overflow-hidden': isSideMenuOpen}">
  <!-- Desktop sidebar -->

  <!-- Mobile sidebar -->
  <!-- Backdrop -->
  <div
          x-show="isSideMenuOpen"
          x-transition:enter="transition ease-in-out duration-150"
          x-transition:enter-start="opacity-0"
          x-transition:enter-end="opacity-100"
          x-transition:leave="transition ease-in-out duration-150"
          x-transition:leave-start="opacity-100"
          x-transition:leave-end="opacity-0"
          class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"
  ></div>
  <aside
          class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden"
          x-show="isSideMenuOpen"
          x-transition:enter="transition ease-in-out duration-150"
          x-transition:enter-start="opacity-0 transform -translate-x-20"
          x-transition:enter-end="opacity-100"
          x-transition:leave="transition ease-in-out duration-150"
          x-transition:leave-start="opacity-100"
          x-transition:leave-end="opacity-0 transform -translate-x-20"
          @click.away="closeSideMenu"
          @keydown.escape="closeSideMenu"
  >
    <div class="py-4 text-gray-500 dark:text-gray-400">
      <a
              class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
              href="#"
      >
        Windmill
      </a>
      <ul class="mt-6">
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="index.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
              ></path>
            </svg>
            <span class="ml-4">Dashboard</span>
          </a>
        </li>
      </ul>
      <ul>
        <li class="relative px-6 py-3">
              <span
                      class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                      aria-hidden="true"
              ></span>
          <a
                  class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                  href="forms.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
              ></path>
            </svg>
            <span class="ml-4">Forms</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="cards.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"
              ></path>
            </svg>
            <span class="ml-4">Cards</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="charts.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"
              ></path>
              <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
            </svg>
            <span class="ml-4">Charts</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="buttons.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"
              ></path>
            </svg>
            <span class="ml-4">Buttons</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="modals.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"
              ></path>
            </svg>
            <span class="ml-4">Modals</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <a
                  class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  href="tables.html"
          >
            <svg
                    class="w-5 h-5"
                    aria-hidden="true"
                    fill="none"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
            </svg>
            <span class="ml-4">Tables</span>
          </a>
        </li>
        <li class="relative px-6 py-3">
          <button
                  class="inline-flex items-center justify-between w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                  @click="togglePagesMenu"
                  aria-haspopup="true"
          >
                <span class="inline-flex items-center">
                  <svg
                          class="w-5 h-5"
                          aria-hidden="true"
                          fill="none"
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          stroke-width="2"
                          viewBox="0 0 24 24"
                          stroke="currentColor"
                  >
                    <path
                            d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z"
                    ></path>
                  </svg>
                  <span class="ml-4">Pages</span>
                </span>
            <svg
                    class="w-4 h-4"
                    aria-hidden="true"
                    fill="currentColor"
                    viewBox="0 0 20 20"
            >
              <path
                      fill-rule="evenodd"
                      d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                      clip-rule="evenodd"
              ></path>
            </svg>
          </button>
          <template x-if="isPagesMenuOpen">
            <ul
                    x-transition:enter="transition-all ease-in-out duration-300"
                    x-transition:enter-start="opacity-25 max-h-0"
                    x-transition:enter-end="opacity-100 max-h-xl"
                    x-transition:leave="transition-all ease-in-out duration-300"
                    x-transition:leave-start="opacity-100 max-h-xl"
                    x-transition:leave-end="opacity-0 max-h-0"
                    class="p-2 mt-2 space-y-2 overflow-hidden text-sm font-medium text-gray-500 rounded-md shadow-inner bg-gray-50 dark:text-gray-400 dark:bg-gray-900"
                    aria-label="submenu"
            >
              <li
                      class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              >
                <a class="w-full" href="pages/login.html">Login</a>
              </li>
              <li
                      class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              >
                <a class="w-full" href="pages/create-account.html">
                  Create account
                </a>
              </li>
              <li
                      class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              >
                <a class="w-full" href="pages/forgot-password.html">
                  Forgot password
                </a>
              </li>
              <li
                      class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              >
                <a class="w-full" href="pages/404.html">404</a>
              </li>
              <li
                      class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              >
                <a class="w-full" href="pages/blank.html">Blank</a>
              </li>
            </ul>
          </template>
        </li>
      </ul>
      <div class="px-6 my-6">
        <button
                class="flex items-center justify-between px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
        >
          Create account
          <span class="ml-2" aria-hidden="true">+</span>
        </button>
      </div>
    </div>
  </aside>
  <div class="flex flex-col flex-1">
    <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
      <div
              class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300"
      >
        <!-- Mobile hamburger -->
        <button
                class="p-1 -ml-1 mr-5 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
                @click="toggleSideMenu"
                aria-label="Menu"
        >
          <svg
                  class="w-6 h-6"
                  aria-hidden="true"
                  fill="currentColor"
                  viewBox="0 0 20 20"
          >
            <path
                    fill-rule="evenodd"
                    d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                    clip-rule="evenodd"
            ></path>
          </svg>
        </button>
        <!-- Search input -->
        <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct?pages=<%= request.getAttribute("pages") %>"> <button class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
         Quay lại
        </button></a>
        <ul class="flex items-center flex-shrink-0 space-x-6">

        </ul>
      </div>
    </header>
    <main class="h-full pb-16 overflow-y-auto">
      <div class="container px-6 mx-auto grid">
        <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
          Chi tiết sản phẩm
        </h2>
        <!-- CTA -->
          <% Product p = (Product) request.getAttribute("product"); %>
        <!-- General elements -->

        <input type="hidden" name="nameProduct" value="<%=p.getName()%>">
        <div
                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
          <form id="addProduct" action="/Project_CuaHangMuBaoHiem_war/UpdateProduct" method="get">
            <input name="id" type="hidden" value="<%= p.getId() %>">
            <input name="pages" type="hidden" value="<%= request.getAttribute("pages") %>">
            <label  class="block text-sm">
              <span  class="text-gray-700 dark:text-gray-400">Tên sản phẩm</span>
              <input id="name" name="name" required="required"
                     class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                     placeholder="Tên sản phẩm" value="<%= p.getName() %>"/>
            </label>
            <div style="margin-top: 10px; color: red;" id="warning_name"></div>
            <label style="margin-top: 20px;" class="block text-sm">
              <span class="text-gray-700 dark:text-gray-400">Giá</span>
              <input  type="number" id="price" name="price" required="required"
                      class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                      placeholder="Giá tiền" value="<%= p.getPrice() %>"/>
            </label>
            <div style="margin-top: 10px; color: red;" id="warning_price"></div>
            <label style="margin-top: 20px;" class="block text-sm">
              <span class="text-gray-700 dark:text-gray-400">Thương hiệu</span>
              <input id="brand" name="brand" required="required" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                     placeholder="Thương hiệu" value="<%= p.getBrand() %>"/>
            </label>
            <div style="margin-top: 10px; color: red;" id="warning_brand"></div>
            <div class="mt-4 text-sm">
                <span class="text-gray-700 dark:text-gray-400">
                  Loại nón
                </span>
              <div class="mt-2">
                <select  name="type" class="pix_text">

                  <% if(p.getType().equalsIgnoreCase("FULLFACE")){ %>
                  <option  value="FULLFACE">FULLFACE</option>
                  <option  value="3_4">3/4</option>
                  <option  value="NUADAU">NỬA ĐẦU</option>
                  <option  value="CHILDREN">TRẺ EM</option>
                  <%}else{if(p.getType().equalsIgnoreCase("3/4")){%>
                  <option  value="3_4">3/4</option>
                  <option  value="FULLFACE">FULLFACE</option>
                  <option  value="NUADAU">NỬA ĐẦU</option>
                  <option  value="CHILDREN">TRẺ EM</option>
                  <%}else{if(p.getType().equalsIgnoreCase("NUADAU")){%>
                  <option  value="NUADAU">NỬA ĐẦU</option>
                  <option  value="3_4">3/4</option>
                  <option  value="FULLFACE">FULLFACE</option>
                  <option  value="CHILDREN">TRẺ EM</option>
                  <%}else{if(p.getType().equalsIgnoreCase("CHILDREN")){%>
                  <option  value="CHILDREN">TRẺ EM</option>
                  <option  value="NUADAU">NỬA ĐẦU</option>
                  <option  value="3_4">3/4</option>
                  <option  value="FULLFACE">FULLFACE</option>
                  <%}else{if(p.getType().equalsIgnoreCase("")){%>
                  <option >Chọn loại</option>
                  <option  value="CHILDREN">TRẺ EM</option>
                  <option  value="NUADAU">NỬA ĐẦU</option>
                  <option  value="3_4">3/4</option>
                  <option  value="FULLFACE">FULLFACE</option>
                  <%}}}}}%>

                </select>
              </div>
            </div>

            <div style="margin-top: 10px; color: red;" id="warning_type"></div>
            <label style="margin-top: 20px;" class="block text-sm">
              <span class="text-gray-700 dark:text-gray-400">Chiết khấu(%)</span>
              <input id="discount" name="discount" required="required" type="number" class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                     placeholder="Chiết khấu" value="<%= p.getDiscount()*100 %>"/>
            </label>
            <div style="margin-top: 10px; color: red;" id="warning_discount"></div>
            <label style="margin-top: 20px;" class="block mt-4 text-sm">
              <span class="text-gray-700 dark:text-gray-400">Thông tin sản phẩm</span>
              <textarea id="decrispe" name="decrispe" required="required"
                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                        rows="3"
                        placeholder="Mô tả sản phẩm"
              ><%= p.getDecrispe() %></textarea>
            </label>
            <div style="margin-top: 10px; color: red;" id="warning_decrispe"></div>
            <a href="<%= "/Project_CuaHangMuBaoHiem_war/Remove?="+p.getId()+"&pages=" + request.getAttribute("pages")%>">
              <button  type="button" style="margin-top: 20px;margin-left: 20px; float: right; background: red;" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
              Xóa
              </button>
            </a>
            <button onclick="check()" type="submit" style="margin-top: 20px; float: right; background: #1c7430;" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
              Cập nhật
            </button>
          </form>
        </div>

      </div>
      <div class="container grid px-6 mx-auto">
        <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
          Danh sách kích thước, màu sắc
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
                <th class="px-4 py-3">Kích thước</th>
                <th class="px-4 py-3">Màu sắc</th>
                <th class="px-4 py-3">Số lượng</th>
                <th class="px-4 py-3">Chỉnh sửa</th>
              </tr>
              </thead>
              <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
              <%
                for(DetailProduct dp : ProductService.getfirst(p.getId())){
              %>

              <tr class="text-gray-700 dark:text-gray-400">


                <form action="/Project_CuaHangMuBaoHiem_war/UpdateDetailProduct">
                  <input type="hidden" name="id" value="<%= p.getId() %>" >
                  <input type="hidden" name="id_dp" value="<%=dp.getId()%>" >
                  <input name="pages" type="hidden" value="<%= request.getAttribute("pages") %>">
                  <td class="px-4 py-3 text-sm">
                    <div><%=dp.getSize()%></div>
                  </td>
                  <td class="px-4 py-3 text-sm">
                    <div><%=dp.getColor()%></div>
                  </td>
                  <td class="px-4 py-3 text-sm">
                    <input name="quantity"  value="<%=dp.getQuantity()%>">
                  </td>
                  <td class="px-4 py-3">
                    <div class="flex items-center space-x-4 text-sm">
                      <button type="submit" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                          <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
                        </svg>
                      </button>
                      <a href="<%="/Project_CuaHangMuBaoHiem_war/RemoveDetailProduct?id="+p.getId()+"&id_dp=" + dp.getId()+"&pages="+request.getAttribute("pages")%>">
                        <button type="button"
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
                </form>
              </tr>
              <%}%>
              </tbody>
            </table>
          </div>
          <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                <span class="flex items-center col-span-3">

                </span>
            <span class="col-span-2"></span>


          </div>
          <div style="margin-bottom: 30px; margin-left: 50px;">
            <form id="addDetailProduct" method="get" action="/Project_CuaHangMuBaoHiem_war/AddDetailProduct">
              <input id="id" name="id" type="hidden" value="<%= p.getId() %>">
              <input name="pages" type="hidden" value="<%= request.getAttribute("pages") %>">
              <input id="size" name="size" type="text" placeholder="Kích thước" required="required">
              <div style="margin-top: 10px; color: red;" id="warning_size"></div>
              <input id="color" name="color" type="text" placeholder="Màu sắc" required="required">
              <div style="margin-top: 10px; color: red;" id="warning_color"></div>
              <input id="quantity" name="quantity" type="number" placeholder="Số lượng" required="required">
              <div style="margin-top: 10px; color: red;" id="warning_quantity"></div>
              <input id="price_import" name="price" type="number" placeholder="Giá" required="required">
              <div style="margin-top: 10px; color: red;" id="warning_price_import"></div>
              <button  type="submit" onclick="checkSCQ()" style="margin-top: 20px; background: #1c7430;" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                Thêm
              </button>
            </form>
          </div>
        </div>
      </div>

      <div class="container grid px-6 mx-auto">
        <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
          Quản lý hình ảnh
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
                <th class="px-4 py-3">Hình ảnh</th>
                <th class="px-4 py-3">Hiển thị</th>
                <th class="px-4 py-3">Chỉnh sửa</th>
              </tr>
              </thead>
              <tbody
                      class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
              <%
                for(ImageProduct i : p.getImg()){
              %>
              <tr class="text-gray-700 dark:text-gray-400">

                <td class="px-4 py-3">

                    <div class="flex items-center text-sm">
                      <!-- Avatar with inset shadow -->
                      <div
                              class="relative hidden w-8 h-8 mr-3 rounded-full md:block"
                      >
                        <img

                                src="<%= i.getImg()%>"
                                alt=""
                                loading="lazy"
                        />
                        <div
                                class="absolute inset-0 rounded-full shadow-inner"
                                aria-hidden="true"
                        ></div>
                      </div>
                      <div>
                        <p class="font-semibold"></p>
                        <p class="text-xs text-gray-600 dark:text-gray-400">

                        </p>
                      </div>
                    </div>

                </td>
                <form action="/Project_CuaHangMuBaoHiem_war/UpdateImage">
                  <input type="hidden" name="id" value="<%= p.getId() %>">
                  <input type="hidden" name="id_img" value="<%= i.getId_dp() %>">
                  <input name="pages" type="hidden" value="<%= request.getAttribute("pages") %>">
                  <td class="px-4 py-3 text-sm">
                    <select id="allow2" name="allow" class="pix_text">

                      <option  value="<%= i.getIsAllow() %>"><%=i.allow(i.getIsAllow()) %></option>
                      <option value="<%= i.OppoAllow(i.getIsAllow()) %>"><%=i.OppositionAllow(i.getIsAllow()) %></option>

                    </select>

                  </td>
                  <td class="px-4 py-3">
                    <div class="flex items-center space-x-4 text-sm">
                      <button type="submit" >
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"/>
                          <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"/>
                        </svg>
                      </button>

                      <a href="<%= "/Project_CuaHangMuBaoHiem_war/RemoveImage?id="+p.getId()+"&id_img="+i.getId_dp() +"&pages="+request.getAttribute("pages")%>">
                        <button type="button"
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
                </form>
              </tr>
              <%}%>
              </tbody>
            </table>
          </div>
          <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                <span class="flex items-center col-span-3">
                </span>
            <span class="col-span-2"></span>
            <!-- Pagination -->

          </div>
        </div>
      </div>
      <div class="container px-6 mx-auto" style="margin-top: 20px;">
        <form action="<%= "/Project_CuaHangMuBaoHiem_war/UploadImageInDetailProduct?id="+p.getId() +"&pages="+request.getAttribute("pages") %>" method="post" enctype="multipart/form-data">
<%--          <input name="pages" type="hidden" value="<%= request.getAttribute("pages") %>">--%>
          Tải lên hình ảnh:
          <input type="file" name="fileName">
          <button type="submit" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
            Thêm
          </button>
        </form>

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