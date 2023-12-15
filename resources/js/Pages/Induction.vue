<script setup>
import Search from "@/Components/SearchFilter.vue";
import { watch } from "vue";
import Pagination from "@/Components/Pagination.vue";
import { ref , onMounted} from 'vue';
import { router } from '@inertiajs/vue3';
import Employee from '@/Layouts/EmployeeLayout.vue';
import { Head } from '@inertiajs/vue3';
import DLink from '@/Components/DashboardLink.vue';

const props = defineProps({
  inductions: {
    type: Object,
    default: () => ({}),
  },
  filters: {
    type: Object,
    default: () => ({}),
  },
});
const tabMainChanged = (tabType) => {
    tabMain.value = tabType;
};
const tabMain = ref('notice');

let search = ref(props.filters.search);

watch(search, (value) => {
  router.get(
    "induction",
    { search: value },
    {
      preserveState: true,
      replace: true,
    }
  );
});
</script>

<template>
    <Employee>
    <DLink></DLink>
    <div class="panel">
            <div class="mb-5">
                <div class="mb-4 flex items-center sm:flex-row flex-col sm:justify-between justify-center">
                    <div class="sm:mb-0 mb-4">
                        <div class="text-lg font-semibold ltr:sm:text-left rtl:sm:text-right text-center">
                            Inductions
                        </div>
                    </div>
                    <div class="grid justify-items-stretch">
                        <div>
                            <Search v-model="search" class="mr-4 w-full max-w-md">
                            </Search>
                        </div>
                    </div>
                </div>
                <div>
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Induction Name</th>
                                <th>Department</th>
                                <th style="float:right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <template v-for="(induction, index) in inductions.data">
                                <tr>
                                    <td>
                                        {{ index + 1 }}
                                    </td>
                                    <td>
                                        <span class="'text-gray-800 dark:text-gray-300 font-semibold'">
                                            {{ induction.induction_name }}
                                        </span>
                                    </td>
                                    <td>
                                        <span class="'text-gray-800 dark:text-gray-300 font-semibold'">
                                            {{ induction.department }}
                                        </span>
                                    </td>
                                    <td class="whitespace-nowrap font-medium ltr:text-right rtl:text-left">
                                        <a :href="'/induction/' + induction.id" class="inline-flex items-center btn btn-info rounded-md px-2 py-2 text-xs">Quiz
                                            <svg width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="w-4 h-4 rtl:rotate-180 ltr:ml-1.5 rtl:mr-1.5">
                                                <path d="M11 19L17 12L11 5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                                <path
                                                    opacity="0.5"
                                                    d="M6.99976 19L12.9998 12L6.99976 5"
                                                    stroke="currentColor"
                                                    stroke-width="1.5"
                                                    stroke-linecap="round"
                                                    stroke-linejoin="round"
                                                />
                                            </svg>
                                        </a>
                                    </td>
                                </tr>
                            </template>
                        </tbody>
                    </table>
                </div>
            </div>
            <Pagination :data="inductions" />
        </div>
</Employee>
</template>