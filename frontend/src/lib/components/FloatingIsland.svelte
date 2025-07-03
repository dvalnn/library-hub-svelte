<script lang="ts">
    let { children } = $props();
</script>

<div class="w-full max-w-2xl bg-white shadow-lg rounded-xl p-6 space-y-6">
    {@render children()}
</div>
