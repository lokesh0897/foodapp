<%-- Note: This file should be placed in src/main/webapp/WEB-INF/jsp/ --%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${appName}</title>
    <!-- Tailwind CSS CDN for modern styling -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f7f9; }
        .status-pill { padding: 4px 10px; border-radius: 9999px; font-size: 0.75rem; font-weight: 600; }
        .pending { background-color: #fef3c7; color: #92400e; }
        .in-preparation { background-color: #dbeafe; color: #1e40af; }
        .ready-for-delivery { background-color: #d1fae5; color: #065f46; }
    </style>
</head>
<body class="p-4 sm:p-8">

    <div class="max-w-4xl mx-auto bg-white shadow-xl rounded-xl p-6 sm:p-10">
        <header class="mb-8 border-b pb-4">
            <h1 class="text-3xl font-extrabold text-gray-900">${appName}</h1>
            <p class="text-gray-500 mt-1">Real-time catering order tracking and delivery status.</p>
        </header>

        <section class="mb-10">
            <h2 class="text-2xl font-semibold text-gray-800 mb-4">Current Orders (${orderList.size()})</h2>

            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Order ID</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Customer</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Details</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <!-- Iterates over the 'orderList' data passed from the Java Controller -->
                        <c:forEach var="order" items="${orderList}">
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${order.id}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${order.customerName}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${order.details}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    <%-- JSTL conditional logic to style the status pill --%>
                                    <c:choose>
                                        <c:when test="${order.status == 'Pending'}">
                                            <span class="status-pill pending">${order.status}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'In Preparation'}">
                                            <span class="status-pill in-preparation">${order.status}</span>
                                        </c:when>
                                        <c:when test="${order.status == 'Ready for Delivery'}">
                                            <span class="status-pill ready-for-delivery">${order.status}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status-pill bg-gray-200 text-gray-700">${order.status}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <footer class="pt-6 border-t mt-8 text-center text-sm text-gray-400">
            <p>&copy; 2024 Catering App. Data displayed is mock data.</p>
        </footer>
    </div>
</body>
</html>
