<#import "common/page.ftlh" as c>
    <#import "common/navbar.ftlh" as nav>

        <@c.page>

            <@nav.nav>
            </@nav.nav>

            <div style="width: 96%; margin: auto; padding: 10px;">
                <h3 class="card-text">${tour.tour_name}</h3>
                <div class="list" style="display: flex; flex-wrap: wrap; justify-content: center; width: fit-content">
                    <#if reservations??>
                        <#list reservations as reservation>
                            <div class="card" style="width: 16rem; margin-top: 10px; margin-right: 10px; padding-bottom: 0px;">
                                <p class="card-text">Start Date: ${reservation.startDate}</p>
                                <p class="card-text">End Date: ${reservation.endDate}</p>

                                <button type="button" class="modal-button btn btn-primary" data-toggle="modal"
                                        data-id="${reservation.id}" data-time="${reservation.startDate}"
                                        data-end-time="${reservation.endDate}"
                                        data-target="#exampleModalCenter" style="width: fit-content;">Book tour
                                </button>
                            </div>
                        </#list>
                    <#else>
                        <h3>Reservations not found</h3>
                    </#if>
                </div>
            </div>




            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Create an order</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div style="margin-bottom: 15px" id="timeText"></div>

                            <form action="/orders/create" id="add" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="hidden" id='reservationid' name="reservationId" value="">
                                <button type="submit" class="btn btn-primary">Make a reservation</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                const cardWrapper = document.querySelector(".list");
                const cardTitles = document.querySelectorAll(".card");

                cardWrapper.style = 'display: block;'

                cardWrapper.innerHTML = '';

                const dates = [];
                cardTitles.forEach(item => {
                console.log(dates);
                    const date = item.querySelector('.card-text').textContent.substr(0, 10);
                    if (dates.includes(date)) {
                        cardWrapper.lastElementChild.appendChild(item);
                    }
                    else {
                        dates.push(date);

                        const child = document.createElement("div");
                        cardWrapper.innerHTML += "<h4>" + date + "</h4>";
                        child.style = 'display: flex; flex-wrap: wrap; margin-bottom: 20px;';

                        cardWrapper.appendChild(child);

                        cardWrapper.lastElementChild.appendChild(item);
                    }

                })



                var exampleModal = document.getElementById('exampleModalCenter')
                var buttons = document.querySelectorAll('.modal-button')


                buttons.forEach(button => {
                    button.addEventListener('click', function (event) {
                        var recipient = button.getAttribute('data-id')
                        var time = button.getAttribute('data-time')
                        var end = button.getAttribute('data-end-time')

                        var modalTitle = exampleModal.querySelector('.modal-title')
                        var modalBodyInput = exampleModal.querySelector('#reservationid')
                        var timeText = document.querySelector('#timeText')

                        modalTitle.textContent = 'New reservation'
                        modalBodyInput.value = recipient
                        timeText.innerHTML =
                            "Are you sure you want to make an order with a tour that starts at " + time + " and ends at " + end + "?"
                    })
                })

            </script>



        </@c.page>