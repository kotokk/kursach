<#import "common/admin.ftlh" as c>
<#import "common/navbar.ftlh" as nav>

<@c.admin>
    <table class="table" style="width: 100%;   ">
        <thead class="thead-dark" style="border-radius: 12px">
        <tr>
            <th scope="col">User's name</th>
            <th scope="col">Tour name</th>
            <th scope="col">Location</th>
            <th scope="col">Price</th>
            <th scope="col">Reservation start date</th>
            <th scope="col">Reservation end date</th>
            <th scope="col">User's phone number</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list orders as order>
            <tr>
                <td>${order.user.fullName}</td>
                <td>${order.reservation.tour.tour_name}</td>
                <td>${order.reservation.tour.location}</td>
                <td>${order.reservation.tour.tour_price}</td>
                <td>${order.reservation.startDate}</td>
                <td>${order.reservation.endDate}</td>
                <td>${order.contactPhoneNumber}</td>
                <td><button class="btn btn-primary" role="button" onclick="cancelOrder(${order.id})">Contacted</button></td>
            </tr>
        </#list>
        </tbody>
    </table>

    <script>
        function cancelOrder(orderId) {
            var confirmation = confirm("Are you sure you want to mark this order as contacted? This will remove the order from list.");

            if (confirmation) {
                window.location.href = "/order/confirm?orderId=" + orderId;
            }
        }
    </script>
</@c.admin>