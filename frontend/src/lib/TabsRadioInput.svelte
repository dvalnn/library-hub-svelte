<script lang="ts">
    const {
        name,
        id,
        checked,
        onchange,
        inputClassExtra = "",
        labelClassExtra = "",
    } = $props();
</script>

<input
    class={`TabsRadioInput hidden ${inputClassExtra}`}
    type="radio"
    {id}
    {checked}
    {onchange}
/>
<label
    class={`
        TabRadioLabel
        flex items-center justify-center grow basis-0
        py-[10px] px-[3vw]
        font-poppins text-dark-blue
        border-b-2 border-t-2 border-transparent
        cursor-pointer transition-colors duration-300 opacity-60
        relative z-10 whitespace-nowrap
        ${labelClassExtra}
    `}
    for={id}
    id={`${id}Label`}
>
    {name}
</label>

<style>
    .TabRadioLabel {
        font-size: calc(1rem + 0.4vw);
    }

    .TabRadioLabel:hover {
        color: var(--light-blue);
        opacity: 90%;
    }

    .TabsRadioInput:checked + label {
        background-color: var(--white);
        color: var(--dark-blue);
        border-bottom: 2px solid var(--light-blue);
        border-top: 2px solid var(--light-blue);
        opacity: 100%;
    }
</style>
