<h2>Miejsca</h2>

{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if $link[2] == 'edit'}
<form class="smallCenter" id="edit" action="" method="POST">

    <label class="elementLabel">Nazwa: </label> <input value="{$smarty.post.nazwa}" name="nazwa" class="inputElement" type="text" required> <br><br>
    <label class="elementLabel">Adres: </label> <input value="{$smarty.post.adres}" name="adres" class="inputElement" type="text" required> <br><br>
    <label class="elementLabel">Miejscowość: </label>
    <select name="id_miejscowosci">
        <option value="0">Wybierz miejscowość...</option>
        {if $cities}
            {foreach from=$cities key=k item=v}
                <option value="{$v.id}" {if $smarty.post.id_miejscowosci == $v.id}selected="selected"{/if}>{$v.nazwa}</option>
            {/foreach}
        {/if}
    </select>
    <br><br>

    <input type="hidden" name="action" value="edit"/>

    <input type="submit" name="edit" value="Zapisz"/><br><br>

</form>
{elseif $link.2 == 'del'}
<form action="" method="POST" id="del">
    <input type="checkbox" name="confirm"> &nbsp;Potwiedź usunięcie...<br><br>
    <input type="hidden" name="action" value="del"/>
    <input type="submit" value="Usuń"/>
</form>
{elseif $link.2 == 'add'}
    <h3>Wypełnij pola:</h3><br><br>
    <form action="" method="post" id="add">
        <label class="elementLabel">Nazwa: </label> <input name="name" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Adres: </label> <input name="address" class="inputElement" type="text" required> <br><br>
        <label class="elementLabel">Miejscowość: </label>
        <select name="city">
            <option value="0">Wybierz miejscowość...</option>
            {if $cities}
                {foreach from=$cities key=k item=v}
                    <option value="{$v.id}">{$v.nazwa}</option>
                {/foreach}
            {/if}
        </select>
        <br><br>
        <input type="hidden" name="action" value="add">
        <input class="submitButton" type="submit" value="Dodaj">
    </form>
{else}
    <a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj miejsce</div></a>
    
    {if $places}
        <div class="table-responsive">
        <table id="places" class="table">
            <thead>
            <tr>
            <th>Nr</th>
            <th>Nazwa</th>
            <th>Adres</th>
            <th>Miejscowość</th>
            <th>Opcje</th>
            </tr>
            </thead>
                {assign var='i' value=1}
                {foreach from=$places item=v key=k}
            <tr>
                <td>{$i}</td>
                <td>{$v.nazwa}</td>
                <td>{$v.adres}</td>
                <td>{$v.miejscowosc}</td>
                <td>
                    <a href="{$config.url}{$link.1}/edit/{$v.id}" title="edytuj"><img
                                src="{$config.url}resources/images/edit.png" alt="edytuj"/></a>
                    &nbsp;
                    <a href="{$config.url}{$link.1}/del/{$v.id}" title="usuń"><img
                                src="{$config.url}resources/images/remove.png" alt="usuń"/></a>
                </td>
            </tr>
            {assign var='i' value=$i+1}
            {/foreach}
        </table>
        </div>
        <script>
        $(document).ready(function(){
            $('#places').DataTable();
        })
        </script>
    {else}

    {/if}
{/if}