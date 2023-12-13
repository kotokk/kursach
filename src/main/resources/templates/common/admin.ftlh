<#macro admin>
<#import "page.ftlh" as c>

<@c.page>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="/tours">ADMIN</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">


                <ul class="navbar-nav mr-auto">

                    <li class="nav-item active">
                        <a class="nav-link" href="/tours">Main page</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/tour/new">Add tour</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/tour/list">Edit tour</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/users">User management </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/order/list">Orders to contact </a>
                    </li>
                </ul>
        </div>
    </nav>
<#nested>

</@c.page>
</#macro>