<#import "common/page.ftlh" as c>
<#import "common/navbar.ftlh" as nav>

<@c.page>

    <@nav.nav>
    </@nav.nav>
    <div style="width: 96%; margin: auto; padding: 10px;">

        <div class="list" style="display: flex; flex-wrap: wrap; justify-content: center; width: fit-content">

            <#if orders?size == 0>
                <!-- Message for no orders -->
                <div class="alert alert-info" role="alert">
                    No orders yet.
                </div>
            <#else>
                <#list orders as order>
                    <div class="card"
                         style="width: 20rem;  margin-top: 10px; margin-right: 10px; padding-bottom: 0px;">

                        <div class="card-body">

                            <h5 class="card-title">${order.reservation.tour.getTour_name()}</h5>
                            <p class="card-text font-weight-light">Tour location: ${order.reservation.tour.getLocation()}</p>
                            <p class="card-text font-weight-light">Tour's start date: ${order.reservation.startDate}</p>
                            <p class="card-text font-weight-light">Tour's end date: ${order.reservation.endDate}</p>
                            <p class="card-text font-weight-light">User name: ${order.user.getFullName()}</p>
                            <p class="card-text font-weight-light">Price: ${order.reservation.tour.getTour_price()}$</p>
                            <form action="/order/cancel" id="cancelForm${order.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="hidden" name="orderId" value="${order.id}">
                            </form>

                            <!-- Button to cancel order with confirmation -->
                            <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#cancelOrderModal${order.id}">
                                Cancel an order
                            </button>

                            <!-- Modal for canceling order with confirmation -->
                            <div class="modal fade" id="cancelOrderModal${order.id}" tabindex="-1" role="dialog"
                                 aria-labelledby="cancelOrderModalLabel${order.id}" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="cancelOrderModalLabel${order.id}">Confirm Cancellation</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Are you sure you want to cancel this order?</p>
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-danger" onclick="document.getElementById('cancelForm${order.id}').submit()">Confirm</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <#if !order.completed>
                                <!-- Button to complete order -->
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#completeOrderModal${order.id}">
                                    Complete order
                                </button>

                                <!-- Modal for completing order -->
                                <div class="modal fade" id="completeOrderModal${order.id}" tabindex="-1" role="dialog"
                                     aria-labelledby="completeOrderModalLabel${order.id}" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="completeOrderModalLabel${order.id}">Complete Order</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="/order/complete" method="post">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <input type="hidden" name="orderId" value="${order.id}">
                                                    <div class="form-group">
                                                        <label for="phoneNumber">Phone Number:</label>
                                                        <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <#else>
                                <!-- Message indicating order is completed -->
                                <p class="font-weight-bold text-success">Order is completed. Please wait for a phone call.</p>
                            </#if>
                        </div>
                    </div>
                </#list>
            </#if>
        </div>
    </div>

</@c.page>
