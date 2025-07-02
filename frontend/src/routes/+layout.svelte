<script lang="ts">
	import "../app.css"; // Ensure this imports your global Tailwind CSS
	import TabsRadio from "./TabsRadio.svelte";
	import { goto } from "$app/navigation";
	import { page } from "$app/stores";

	// Initialize activeTab based on the current route, or default to 'records'
	let activeTab = $state($page.url.pathname.split("/")[1] || "records");

	$effect(() => {
		goto(`/${activeTab}`);
	});

	let { children } = $props(); // Svelte 5+ way to get children slot
</script>

<div class="min-h-screen flex flex-col bg-gray-50 font-inter">
	<header
		class="fixed top-0 left-0 w-full bg-white shadow-md p-4 z-10 flex justify-center items-center h-16"
	>
		<TabsRadio bind:selected={activeTab} />
	</header>

	<main class="flex-1 pt-16 bg-white">
		{@render children()}
	</main>
</div>

<style>
	/* You can add any global styles here if needed, but Tailwind is preferred */
	/* Ensure the font is loaded or available */
	@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap");

	.font-inter {
		font-family: "Poppins", sans-serif;
	}

	html {
		font-size: 10px;
		scroll-behavior: smooth;
		-webkit-user-select: none;
		-moz-user-select: none;
		user-select: none;
		overflow-x: hidden;
		background-color: var(--white);
	}
</style>
