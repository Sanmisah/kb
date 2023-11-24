<!-- primary -->


<script setup>

defineProps({
    data: Object,
    flag: Boolean,  
     open: {
        type: Boolean,
        default: true
    },
});
</script>


<template>
    
    <div class="flex items-center p-3.5 rounded "
        :class="flag ? 'text-success bg-success-light dark:bg-success-dark-light' : 'text-danger bg-danger-light dark:bg-danger-dark-light'" v-show="open">
        <span class="ltr:pr-2 rtl:pl-2"><strong class="ltr:mr-1 rtl:ml-1">{{ data }}!</strong> </span>
        <button type="button" class="ltr:ml-auto rtl:mr-auto hover:opacity-80"  v-on:click="open = ! open">
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24px"
                height="24px"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="w-5 h-5"
            >
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
        </button>
       
    </div>
</template>