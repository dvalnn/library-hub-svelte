<script lang="ts">
    let userInput = $state("");
    const {
        handleSearch,
        placeholder,
    }: {
        handleSearch: (input: string) => void;
        placeholder: string;
    } = $props();
</script>

<form
    class="flex items-center gap-3 w-full max-w-xl px-4 py-2 bg-white border border-gray-300 rounded-md shadow-sm focus-within:ring-2 focus-within:ring-blue-400"
    onsubmit={() => {
        handleSearch(userInput);
        userInput = ""; // Clear input after search
    }}
>
    <input
        type="text"
        bind:value={userInput}
        class="flex-1 bg-transparent outline-none text-gray-800 placeholder-gray-400"
        {placeholder}
    />

    <button
        type="submit"
        class="text-sm text-white bg-blue-600 hover:bg-blue-700 px-4 py-1.5 rounded-md transition"
    >
        Search
    </button>
</form>
