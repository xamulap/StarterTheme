{if $field.type === 'select'}

  <label class='select-field {if $field.required}required{/if}'>
    <span>{$field.label}</span>
    <select name="{$field.name}" {if $field.required}required{/if}>
      <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
      {foreach from=$field.availableValues item="label" key="value"}
        <option value="{$value}" {if $value eq $field.value}selected{/if}>{$label}</option>
      {/foreach}
    </select>
  </label>

{elseif $field.type === 'countrySelect'}

  <label class='select-field {if $field.required}required{/if}'>
    <span>{$field.label}</span>
    <select class="js-country" name="{$field.name}" {if $field.required}required{/if}>
      <option value disabled selected>{l s='-- please choose --' d='Shop.Forms.Labels'}</option>
      {foreach from=$field.availableValues item="label" key="value"}
        <option value="{$value}" {if $value eq $field.value} selected {/if}>{$label}</option>
      {/foreach}
    </select>
  </label>

{elseif $field.type === 'radio-buttons'}

  <label class='radio-field {if $field.required}required{/if}'>
    <span>{$field.label}</span>
    {foreach from=$field.availableValues item="label" key="value"}
      <label>
        <input
          name="{$field.name}"
          type="radio"
          value="{$value}"
          {if $field.required}required{/if}
          {if $value eq $field.value}checked{/if}
        >
        {$label}
      </label>
    {/foreach}
  </label>

{elseif $field.type === 'checkbox'}

  <label class='checkbox-field {if $field.required}required{/if}'>
    <input
      name="{$field.name}"
      type="checkbox"
      value="1"
      {if $field.required}required{/if}
      {if $field.value}checked{/if}
    >
    <span>{$field.label}</span>
  </label>

{elseif $field.type === 'password'}

  <label {if $field.required}class="required"{/if}>
    <span>{$field.label}</span>
    <input
      name="{$field.name}"
      type="password"
      value=""
      pattern=".{literal}{{/literal}5,{literal}}{/literal}"
      {if $field.required}required{/if}
    >
  </label>

{elseif $field.type === 'hidden'}

  <input type="hidden" name="{$field.name}" value="{$field.value}">

{else}

  <label {if $field.required}class="required"{/if}>
    <span>{$field.label}</span>
    <input name="{$field.name}" type="{$field.type}" value="{$field.value}" {if $field.required}required{/if}>
  </label>

{/if}

{include file='_partials/form-errors.tpl' errors=$field.errors}
