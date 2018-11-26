{include file="templates/blocks/header.tpl"}
{include file="templates/blocks/menu.tpl"}

{if $link[1] && file_exists("templates/`$link[1]`.tpl")}
    {include file="templates/`$link[1]`.tpl"}
{else}
    {include file="templates/index.tpl"}
{/if}

{include file="templates/blocks/footer.tpl"}