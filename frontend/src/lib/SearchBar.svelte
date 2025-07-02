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
	class="flex items-center w-3/4 border border-blue-500 rounded-lg overflow-hidden bg-white shadow-sm"
	onsubmit={() => {
		handleSearch(userInput);
		userInput = "";
	}}
>
	<input
		type="text"
		bind:value={userInput}
		class="flex-1 px-4 py-3 text-lg bg-transparent outline-none text-gray-800 placeholder-gray-400"
		{placeholder}
	/>

	<button
		type="submit"
		class="px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white text-sm font-semibold transition"
	>
		Search
	</button>
</form>

<style>
    form {
        transition: box-shadow 0.3s ease;
    }

    form:hover {
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }

    input {
        font-family: "Poppins", sans-serif;
    }
</style>

