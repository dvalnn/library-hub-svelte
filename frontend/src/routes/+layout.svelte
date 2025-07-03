<script lang="ts">
	import "../app.css";
	import { page } from "$app/stores";
	import { goto } from "$app/navigation";

	import { BottomNav, BottomNavItem } from "flowbite-svelte";
	import {
		HomeSolid,
		ArchiveSolid,
		CalendarMonthSolid,
		ChartPieSolid,
		BookOpenSolid,
		AdjustmentsHorizontalSolid,
	} from "flowbite-svelte-icons";

	let { children } = $props();
	let activeUrl = $derived($page.url.pathname);

	const buttonClass =
		"mx-auto group-hover:text-primary-600 dark:group-hover:text-primary-500 mb-1 h-6 w-6 text-gray-500 dark:text-gray-400";

	const activeClass = "font-bold text-primary-600 dark:text-primary-500";

	const nav = (path: string) => {
		goto(path);
	};

	const buttons = [
		{ name: "Home", icon: HomeSolid, path: "/" },
		{ name: "Records", icon: ArchiveSolid, path: "/records" },
		{ name: "History", icon: CalendarMonthSolid, path: "/history" },
		{ name: "Requisitions", icon: BookOpenSolid, path: "/requisitions" },
		{ name: "Statistics", icon: ChartPieSolid, path: "/statistics" },
		{
			name: "Settings",
			icon: AdjustmentsHorizontalSolid,
			path: "/settings",
		},
	];
</script>

<main>
	<div class="flex-1">
		{@render children()}
	</div>

	<BottomNav
		position="absolute"
		innerClass={`flex justify-evenly items-center w-1/2`}
	>
		{#each buttons as button}
			<BottomNavItem
				active={activeUrl === button.path}
				{activeClass}
				onclick={() => nav(button.path)}
			>
				<button.icon
					class={`${buttonClass} ${activeUrl === button.path ? activeClass : ""}`}
				/>
			</BottomNavItem>
		{/each}
	</BottomNav>
</main>
