<script module lang="ts">
    export type RadioProps<T extends unknown = string> = {
        options: {
            label: string;
            value: T;
            inputClass?: string;
            labelClass?: string;
        }[];

        selected?: T;
        class?: string;
    };
</script>

<script lang="ts">
    let {
        options,
        selected = $bindable(options[0].value),
        class: classExtra,
    }: RadioProps = $props();

    const id = $props.id();
</script>

<div class={`${classExtra}`}>
    {#each options as { label, value, inputClass, labelClass }}
        <input
            type="radio"
            class={inputClass}
            bind:group={selected}
            id={`${id}-${label}`}
            {value}
        />
        <label class={`label ${labelClass}`} for={`${id}-${label}`}
            >{label}</label
        >
    {/each}
</div>
