<h2>Klasy</h2>


{if $link.2 == 'add'}
    <form>
        <label class="elementLabel">Symbol Klasy: </label> <input type="text">
        <br>
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