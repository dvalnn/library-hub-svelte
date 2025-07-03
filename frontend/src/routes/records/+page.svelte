<script>
	import AgentFilterRadio from "./AgentFilterRadio.svelte";
	import SearchBar from "$lib/SearchBar.svelte";

	let selected = $state("student");
	let searchInput = $state("");
	const handleSearch = (input) => {
		searchInput = input;
	};
	$effect(() => {
		console.log(`Searching for: ${searchInput} in ${selected}`);
	});
</script>

<!-- Container below the tabs bar -->
<div class="flex flex-col gap-6">
	<!-- Radio + Search Row -->
	<div class="flex flex-row items-center justify-between gap-6 w-full">
		<!-- Left: Radio Buttons -->
		<AgentFilterRadio bind:selected />

		<!-- Right: Search Bar -->
		<div class="flex-1 max-w-4xl">
			<SearchBar
				{handleSearch}
				placeholder={`Search for ${selected}...`}
			/>
		</div>
	</div>
</div>
