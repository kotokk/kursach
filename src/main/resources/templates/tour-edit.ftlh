<#import "common/admin.ftlh" as c>
<#import "common/navbar.ftlh" as nav>

<@c.admin>
    <#assign locations = ['Mountains', 'Sea', 'Ocean', 'Lake', 'City', 'Village', 'River']>
    <h1 style="text-align: center; margin-top: 15px">Item ID: ${tour.id?c}</h1>
    <div style="margin: 20px; max-width: 1200px; margin: auto; padding: 20px; margin-top: 30px;
                -webkit-box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11);
                -moz-box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11);
                box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11); border-radius: 15px">
        <form action="/tour/edit" method="post" id="change" enctype="multipart/form-data">
            <div class="form-group">
                <label for="tour_name">Name</label>
                <input type="text" class="form-control" id="tour_name" name="name" value="${tour.tour_name}" required>
            </div>
            <div class="form-group">
                <label for="tour_price">Price</label>
                <input name="price" type="number" min="1" class="form-control" id="tour_price" value="${tour.tour_price?c}" required>
            </div>

            <div class="form-group">
                <label for="location">Location</label>
                <select class="form-control" id="location" name="tour_location">
                    <#list locations as s>
                        <option value="${s}" <#if (s == tour.location)> selected="selected"</#if>>${s}</option>
                    </#list>
                </select>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="hidden" name="tourId" value="${tour.id?c}">
        </form>
        <button type="submit" class="btn btn-primary" form="change">Save</button>
        <input class="btn btn-danger" type="submit" value="delete" form="del">
        <form action="/tour/delete/${tour.id?c}" id="del" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
    </div>
</@c.admin>
