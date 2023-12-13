<#import "common/page.ftlh" as c>
<#import "common/navbar.ftlh" as nav>

<@c.page>
  <@nav.nav>
    </@nav.nav>


    <h1 style="text-align: center; margin-top: 15px">User: ${user.username}</h1>
    <div style="margin: 20px; max-width: 1200px; margin: auto; padding: 20px; margin-top: 30px;
-webkit-box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11);
-moz-box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11);
box-shadow: 1px 0px 14px -4px rgba(70, 81, 90, 0.11); border-radius: 15px">
        <form action="/users/edit" method="post" id="change" enctype="multipart/form-data">
            <div class="form-group">
                <label for="fullname">Fullname</label>
                <input type="text" class="form-control" id="fullname" name="fullname" value="${user.fullName}" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email" value="${user.email}" required>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="hidden" name="userId" value="${user.id?c}">

        </form>
                <button type="submit" class="btn btn-primary" form="change">Save</button>

    </div>
</@c.page>