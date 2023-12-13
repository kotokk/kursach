<#import "common/admin.ftlh" as c>
<#import "common/navbar.ftlh" as nav>
 <#assign tourlocations = ['Mountains', 'Sea', 'Ocean', 'Lake', 'City',
     'Village', 'River']>
<@c.admin>


    <div style="margin: 20px; max-width: 1200px; margin: auto; padding: 20px; margin-top: 30px;
-webkit-box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11);
-moz-box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11);
box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11); border-radius: 15px">
        <form action="/tour/create" method="post" id="change" enctype="multipart/form-data">

            <div class="form-group">
                <label for="tour_name">Name</label>
                <input type="text" class="form-control" id="tour_name" name="tour_name" placeholder="tour_name" required>
            </div>

            <div class="form-group">
                <label for="tour_price">Price</label>
                <input name="tour_price" type="number" min=1 class="form-control" id="tour_price" name="tour_price"placeholder="tour_price"
                       required>
            </div>

            <div class="form-group">
                <label for="location">Tour Locations</label>
                <select class="form-control" id="location" name="location">
                    <#list tourlocations as tourlocation>
                        <option value="${tourlocation}">${tourlocation}</option>
                    </#list>
                </select>
            </div>



            <input type="hidden" name="_csrf" value="${_csrf.token}">
        </form>
        <button type="submit" class="btn btn-primary" form="change">Save</button>
    </div>
</@c.admin>