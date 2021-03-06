<h2>Miejscowości</h2>

{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if $link[2] == 'edit' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
<form class="smallCenter" id="edit" action="" method="POST">

    Nazwa: <input value="{$smarty.post.nazwa}" name="nazwa" type="text" required><br><br>

    <input type="hidden" name="action" value="edit"/>

    <input type="submit" name="edit" value="Zapisz"/><br><br>

</form>
{elseif $link.2 == 'del' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
<form action="" method="POST" id="del">
    <input type="checkbox" name="confirm"> &nbsp;Potwiedź usunięcie...<br><br>
    <input type="hidden" name="action" value="del"/>
    <input type="submit" value="Usuń"/>
</form>
{elseif $link.2 == 'add' && in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
    <h3>Wypełnij pola:</h3><br><br>
    <form action="" method="post" id="add">
        <label class="elementLabel">Nazwa: </label> <input name="nazwa" class="inputElement" type="text" required>
        <br><br>
        <input type="hidden" name="action" value="add">
        <input class="submitButton" type="submit" value="Dodaj">
    </form>
{else}
{if $smarty.session.user.role == 'kierownik'} <a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj miejscowość</div></a> {/if}
    <br><br>
    {if $cities}
        <div class="table-responsive">
        <table id="cities" class="table">
            <thead>
            <tr>
            <th data-field="id">Nr</th>
            <th data-field="name">Nazwa</th>
                {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}<th >Opcje</th>{/if}
            </tr>
            </thead>
                {assign var='i' value=1}
                {foreach from=$cities item=v key=k}
            <tr>
                <td>{$i}</td>
                <td>{$v.nazwa}</td>
                {if in_array($link.1, $config.permissions.edit[$smarty.session.user.role])}
                <td>
                    {if $smarty.session.user.role == 'kierownik'}    <a href="{$config.url}{$link.1}/edit/{$v.id}" title="edytuj"><img
                                src="{$config.url}resources/images/edit.png" alt="edytuj"/></a> {/if}
                    &nbsp;
                    {if $smarty.session.user.role == 'kierownik'} <a href="{$config.url}{$link.1}/del/{$v.id}" title="usuń"><img
                                src="{$config.url}resources/images/remove.png" alt="usuń"/></a> {/if}
                </td>
                {/if}
            </tr>
            {assign var='i' value=$i+1}
            {/foreach}
        </table>
        </div>
        <script>
        $(document).ready(function(){
            $('#cities').DataTable();
        })
        </script>
    {else}

    {/if}
{/if}