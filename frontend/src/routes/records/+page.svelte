<script>
    import AgentFilterRadio from "./AgentFilterRadio.svelte";

    let selected = $state("student");
</script>

<div class="flex flex-col items-center justify-center min-h-screen bg-gray-50">
    <h1 class="text-2xl font-bold mb-4">Agent Filter Example</h1>
    <AgentFilterRadio bind:selected />
    <p class="mt-4 text-gray-600">Select an agent type to filter:</p>
    <div class="mt-2">
        <p class="text-gray-800">
            Selected Agent: {selected}
        </p>
    </div>
</div>
