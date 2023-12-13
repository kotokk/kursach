<#import "common/admin.ftlh" as c>
<#import "common/navbar.ftlh" as nav>

<@c.admin>
    <table class="table" style="width: 100%;   ">
        <thead class="thead-dark" style="border-radius: 12px">
        <tr>
            <th scope="col"></th>
            <th scope="col">ID</th>
            <th scope="col">tour</th>
            <th scope="col">Start Date</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list reservations as reservation>
            <tr>
                <td></td>
                <td>${reservation.id}</td>
                <td>${tour.getTour_name()}</td>
                    <td></td>
                <td>${reservation.getStartDate()}</td>
                <td>

                    <form action="/reservation/delete/${reservation.id?c}" id="del" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="tourId" value="${tour.id}">
                        <input class="btn btn-danger" type="submit" value="delete">
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>


      <form class="form-inline my-2 my-lg-0">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter" style="width: fit-content; margin: auto">Add new reservation</button>
                    </form>

                      <!-- Modal -->
                                <div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Create a reservation</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="post" action="/reservation/add/">

                                                    <div class="mb-3">
                                                        <label for="startDate" class="form-label">Start Date</label>
                                                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="endDate" class="form-label">End Date</label>
                                                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                                                    </div>
                                                    <input type="hidden" name="tourId" value="${tour.id}">
                                                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                                                    <button type="submit" class="btn btn-primary">Create</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>

<script>




</script>
</@c.admin>