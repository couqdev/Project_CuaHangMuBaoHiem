<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.ImportProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" xmlns:x-transition="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Kiểm tra hàng tồn kho</title>
    <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
    />
    <link rel="stylesheet" href="admin/assets/css/tailwind.output.css"/>
    <link rel="stylesheet" href="admin/assets/css/filter.css"/>
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
    <!-- Desktop sidebar -->
    <aside
            class="z-20 flex-shrink-0 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block"
    >
        <div class="py-4 text-gray-500 dark:text-gray-400">
            <a
                    class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
                    href="/Project_CuaHangMuBaoHiem_war/ManageProduct"
            >
                Admin
            </a>
            <ul class="mt-6">
                <li class="relative px-6 py-3">
                    <a
                            class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
                            href="/Project_CuaHangMuBaoHiem_war/Home"
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
                        <span class="ml-4">Về trang bán hàng</span>
                    </a>
                </li>
            </ul>
            <ul>
                <li class="relative px-6 py-3">
                    <a
                            class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                            href="/Project_CuaHangMuBaoHiem_war/ManageProduct"
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
                        <span class="ml-4">Quản lý sản phẩm</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">

                    <a
                            class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                            href="/Project_CuaHangMuBaoHiem_war/list-bill"
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
                        <span class="ml-4">Quản lý hóa đơn</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                       href="/Project_CuaHangMuBaoHiem_war/list-customer">
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
                        <span class="ml-4">Quản lý khách hàng</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a
                            class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                            href="/Project_CuaHangMuBaoHiem_war/ManageHome"
                    >
                        <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="none"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                viewBox="0 0 24 24"
                                stroke="currentColor">
                            <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                        <span class="ml-4">Quản lý trang chủ</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                       href="/Project_CuaHangMuBaoHiem_war/list-comment">
                        <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="none"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                viewBox="0 0 24 24"
                                stroke="currentColor">
                            <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                        <span class="ml-4">Quản lý bình luận</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                       href="/Project_CuaHangMuBaoHiem_war/ManageImport">
                        <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="none"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                viewBox="0 0 24 24"
                                stroke="currentColor">
                            <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                        <span class="ml-4">Quản lý nhập hàng</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
              <span
                      class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
                      aria-hidden="true"
              ></span>
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                       href="/Project_CuaHangMuBaoHiem_war/CheckInventory">
                        <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="none"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                viewBox="0 0 24 24"
                                stroke="currentColor">
                            <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                        <span class="ml-4">Kiểm tra hàng tồn kho</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                       href="/Project_CuaHangMuBaoHiem_war/manager-permission">
                        <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="none"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                viewBox="0 0 24 24"
                                stroke="currentColor">
                            <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                        <span class="ml-4">Quản lý quyền hạn</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                       href="/Project_CuaHangMuBaoHiem_war/user_hierarchy">
                        <svg
                                class="w-5 h-5"
                                aria-hidden="true"
                                fill="none"
                                stroke-linecap="round"
                                stroke-linejoin="round"
                                stroke-width="2"
                                viewBox="0 0 24 24"
                                stroke="currentColor">
                            <path d="M4 6h16M4 10h16M4 14h16M4 18h16"></path>
                        </svg>
                        <span class="ml-4">Phân cấp tài khoản</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">

                    <a
                            class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                            href="/Project_CuaHangMuBaoHiem_war/ListLog"
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
                        <span class="ml-4">Quản lý log</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <a
                            class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
                            href="/Project_CuaHangMuBaoHiem_war/ManagerTransport"
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
                        <span class="ml-4">Thông tin vận chuyển</span>
                    </a>
                </li>
                <li class="relative px-6 py-3">
                    <button class="inline-flex items-center justify-between w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" @click="togglePagesMenu" aria-haspopup="true">
                <span class="inline-flex items-center">
                  <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                    <path d="M4 5a1 1 0 011-1h14a1 1 0 011 1v2a1 1 0 01-1 1H5a1 1 0 01-1-1V5zM4 13a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H5a1 1 0 01-1-1v-6zM16 13a1 1 0 011-1h2a1 1 0 011 1v6a1 1 0 01-1 1h-2a1 1 0 01-1-1v-6z"></path>
                  </svg>
                  <span class="ml-4">Thống kê</span>
                </span>
                        <svg class="w-4 h-4" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"></path>
                        </svg>
                    </button>
                    <template x-if="isPagesMenuOpen">
                        <ul x-transition:enter="transition-all ease-in-out duration-300" x-transition:enter-start="opacity-25 max-h-0" x-transition:enter-end="opacity-100 max-h-xl" x-transition:leave="transition-all ease-in-out duration-300" x-transition:leave-start="opacity-100 max-h-xl" x-transition:leave-end="opacity-0 max-h-0" class="p-2 mt-2 space-y-2 overflow-hidden text-sm font-medium text-gray-500 rounded-md shadow-inner bg-gray-50 dark:text-gray-400 dark:bg-gray-900" aria-label="submenu">
                            <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <a class="w-full" href="/Project_CuaHangMuBaoHiem_war/BestSeller">Bán nhiều nhất</a>
                            </li>
                            <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <a class="w-full" href="/Project_CuaHangMuBaoHiem_war/Stattistic">Doanh thu</a>
                            </li>
                            <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <a class="w-full" href="<%="/Project_CuaHangMuBaoHiem_war/SalesRate?index=" + "1"%>">Tỉ lệ bán được</a>
                            </li>
                            <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <a class="w-full" href="<%="/Project_CuaHangMuBaoHiem_war/ProductReturn?index=" + "1"%>">Tỉ lệ trả hàng</a>
                            </li>
                            <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <a class="w-full" href="<%="/Project_CuaHangMuBaoHiem_war/CheckInventory?index=" + "1"%>">Sản phẩm tồn kho</a>
                            </li>
                            <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <a class="w-full" href="<%="/Project_CuaHangMuBaoHiem_war/ProductsToBeImported?index=" + "1"%>">Sản phẩm cần nhập kho</a>
                            </li>
                            <li class="px-2 py-1 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200">
                                <a class="w-full" href="<%="/Project_CuaHangMuBaoHiem_war/LatestSale?index=" + "1"%>">Sản phẩm không bán được</a>
                            </li>
                        </ul>
                    </template>

                </li>
            </ul>

        </div>
    </aside>
    <!-- Mobile sidebar -->
    <!-- Backdrop -->
    <div class="flex flex-col flex-1 w-full">
        <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
            <div
                    class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300"
            >
                <!-- Mobile hamburger -->
                <button
                        class="p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
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
                <div class="flex justify-center flex-1 lg:mr-32">
                    <div
                            class="relative w-full max-w-xl mr-6 focus-within:text-purple-500"
                    >

                    </div>
                </div>
                <ul class="flex items-center flex-shrink-0 space-x-6">
                    <!-- Theme toggler -->
                    <li class="flex">
                        <button
                                class="rounded-md focus:outline-none focus:shadow-outline-purple"
                                @click="toggleTheme"
                                aria-label="Toggle color mode"
                        >
                            <template x-if="!dark">
                                <svg
                                        class="w-5 h-5"
                                        aria-hidden="true"
                                        fill="currentColor"
                                        viewBox="0 0 20 20"
                                >
                                    <path
                                            d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"
                                    ></path>
                                </svg>
                            </template>
                            <template x-if="dark">
                                <svg
                                        class="w-5 h-5"
                                        aria-hidden="true"
                                        fill="currentColor"
                                        viewBox="0 0 20 20"
                                >
                                    <path
                                            fill-rule="evenodd"
                                            d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                                            clip-rule="evenodd"
                                    ></path>
                                </svg>
                            </template>
                        </button>
                    </li>
                    <!-- Notifications menu -->
                    <li class="relative">

                        <a href="/Project_CuaHangMuBaoHiem_war/ManageContact">
                            <button class="relative align-middle rounded-md focus:outline-none focus:shadow-outline-purple"
                                    @click="toggleNotificationsMenu" @keydown.escape="closeNotificationsMenu"
                                    aria-label="Notifications" aria-haspopup="true">
                                <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"></path>
                                </svg>
                            </button>
                        </a>
                    </li>
                    <!-- Profile menu -->
                </ul>
            </div>
        </header>
        <main class="h-full pb-16 overflow-y-auto">

            <div class="container grid px-6 mx-auto">
                <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
                    Kiểm tra hàng tồn kho
                </h2>
                <h4 class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300">
                </h4>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto">
                        <table class="w-full whitespace-no-wrap">
                            <thead>
                            <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                                <th class="px-4 py-3">Kích thước</th>
                                <th class="px-4 py-3">Màu sắc</th>
                                <th class="px-4 py-3">Số lượng tồn kho</th>
<%--                                <th class="px-4 py-3">Chỉnh sửa</th>--%>
                            </tr>
                            </thead>
                            <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">

                            <%
                                List<ImportProduct> data = (List<ImportProduct>) request.getAttribute("list");
                                NumberFormat nf = new NumberFormat();
                                for (ImportProduct p : data) {
                            %>
                            <tr class="text-gray-700 dark:text-gray-400">
                                <td class="px-4 py-3 text-sm">
                                    <%= p.getSize()%>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    <%= p.getColor()%>
                                </td>
                                <td class="px-4 py-3 text-sm">
                                    <%= p.getQuantity()%>
                                </td>
<%--                                <td class="px-4 py-3">--%>
<%--                                    <div class="flex items-center space-x-4 text-sm">--%>

<%--                                        <a href="<%= "/Project_CuaHangMuBaoHiem_war/ImportDetail?id=" + p.getId_product()%>">--%>
<%--                                            <button--%>
<%--                                                    class="flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray"--%>
<%--                                                    aria-label="Edit">--%>
<%--                                                <svg--%>
<%--                                                        class="w-5 h-5"--%>
<%--                                                        aria-hidden="true"--%>
<%--                                                        fill="currentColor"--%>
<%--                                                        viewBox="0 0 20 20">--%>
<%--                                                    <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"></path>--%>
<%--                                                </svg>--%>
<%--                                            </button>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </td>--%>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div
                            class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
                <span class="flex items-center col-span-3">

                </span>
                        <span class="col-span-2"></span>
                        <!-- Pagination -->
                        <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
                  <nav aria-label="Table navigation">
                    <ul class="inline-flex items-center">


                      <li>
                            <button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                                    aria-label="Previous">
                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                            <path d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                                  clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg>
                        </button>
                      </li>

                      <li>
                        <button
                                class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple"
                        >
                        </button>
                      </li>
                        <li>
                        <button
                                class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
                        </button>
                      </li>
                      <li>
                        <button class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                                aria-label="Next">
                          <svg class="w-4 h-4 fill-current" aria-hidden="true" viewBox="0 0 20 20">
                            <path d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                                  clip-rule="evenodd"
                                  fill-rule="evenodd"
                            ></path>
                          </svg>
                        </button>

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
