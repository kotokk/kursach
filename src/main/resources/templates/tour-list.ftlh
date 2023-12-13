<#import "common/admin.ftlh" as c>
<#import "common/navbar.ftlh" as nav>

<@c.admin>
    <table class="table" style="width: 100%;   ">
        <thead class="thead-dark" style="border-radius: 12px">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">ID</th>
            <th scope="col">Location</th>
            <th scope="col">Price</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list tours as tour>
            <tr>
                <td><a href="/reservation/list/${tour.id}">${tour.tour_name}</a></td>
                <td>${tour.id}</td>
                <td>${tour.location}</td>
                <td>${tour.tour_price}</td>
                <td><a class="btn btn-primary" role="button" href="/tour/list/${tour.id?c}">edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.admin>