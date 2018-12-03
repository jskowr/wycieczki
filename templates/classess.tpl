<h2>Klasy</h2>

{if $smarty.session.msg.m1.title}
    <div class="{if $smarty.session.msg.m1.err}err{else}ok{/if}">{$smarty.session.msg.m1.title}</div> <br><br>
{/if}

{if $link[2] == 'edit'}
<form class="smallCenter" id="edit" action="" method="POST">

    Symbol: <input value="{$smarty.post.symbol}" name="symbol" type="text" required><br><br>

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
        <label class="elementLabel">Symbol Klasy: </label> <input name="symbol" style="width: 100px;" class="inputElement" type="text" required>
        <br><br>
        <input type="hidden" name="action" value="add">
        <input class="submitButton" type="submit" value="Dodaj">
    </form>
{else}

<a href="{$config.url}{$link.1}/add"><div class="addElement">Dodaj klasę</div></a>
<br><br>

{if $classess}
<table class="tableList">
    <tr><th>Nr</th><th>Symbol</th><th>Opcje</th>
    {assign var='i' value=1}
    {foreach from=$classess item=v key=k}
            <tr>
                <td>{$i}</td>
                <td>{$v.symbol}</td>
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

{else}

{/if}
{/if}