<#import "common/page.ftlh" as c>
<#import "common/navbar.ftlh" as nav>

<@c.page>

    <@nav.nav>
    </@nav.nav>
    <#assign locations = ['Mountains', 'Sea', 'Ocean', 'Lake', 'City',
    'Village', 'River']>
    <#if !location??>
        <#assign location = "">
    </#if>
    <div style="width: 96%; margin: auto; padding: 10px;">
        <form action="/tours" class="form-inline my-2 my-lg-0" style="width: fit-content; margin: auto">
            <select class="form-control" id="tourlocation" name="tourlocation">
                <#list locations as s>
                    <option value="${s}" <#if ( location == s)>selected="selected"</#if>>${s}</option>
                </#list>
                <option value="" <#if (location == "")>selected="selected"</#if>>Show all</option>
            </select>
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <div class="list" style="display: flex; flex-wrap: wrap; justify-content: center; width: fit-content">

            <#list tours as tour>
                <div class="card"
                     style="width: 16rem;  margin-top: 10px; margin-right: 10px; padding-bottom: 40px;">

                    <div class="card-body">
                        <h5 class="card-title">${tour.tour_name}</h5>
                        <p class="card-text">${tour.location}</p>
                        <p class="card-text font-weight-light">${tour.tour_price}$</p>
                        <a href="/tour/${tour.id?c}" class="btn btn-primary"
                           style="position:absolute; bottom:20px;">Available reservations</a>
                    </div>
                </div>
            <#else>
                <h3>tours not found</h3>
            </#list>
        </div>
    </div>


</@c.page>