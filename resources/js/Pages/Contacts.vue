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
  employees: {
    type: Object,
    default: () => ({}),
  },
  filters: {
    type: Object,
    default: () => ({}),
  },
  articles: {
    type: Object,
    default: () => ({}),
  }
});

const tabMain = ref('contacts');
let search = ref(props.filters.search);

watch(search, (value) => {
  router.get(
    "contacts",
    { search: value },
    {
      preserveState: true,
      replace: true,
    }
  );
});
</script>

<template>
    <Head title="Dashboard" />

    <Employee>       
        <DLink ></DLink>
        <br />        
        <div class="panel">
            <div class="mb-5">
                <div class="mb-4 flex items-center sm:flex-row flex-col sm:justify-between justify-center">
                    <div class="sm:mb-0 mb-4">
                        <div class="text-lg font-semibold ltr:sm:text-left rtl:sm:text-right text-center">
                            Contacts
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
                    <!--<div class="table-responsive grow overflow-y-auto min-h-[300px]">-->
                        <table>
                            <tbody>
                                <template v-for="(employee, index) in employees.data">
                                    <tr>
                                        <td>
                                            {{ index + 1 }}
                                        </td>
                                        <td>{{ employee.first_name }}&nbsp;{{ employee.middle_name }}&nbsp;{{ employee.last_name }}</td>
                                        <td>{{ employee.email }}</td>
                                        <td>{{ employee.contact_no }}</td>
                                        <td>{{ employee.department_name }}</td>
                                        <td>{{ employee.designation_name }}</td>
                                      
                                    </tr>
                                </template>
                            </tbody>
                        </table>
                    <!--</div>-->
                </div>
            </div>
            <Pagination :data="employees" />
        </div>
        <br />
        <!--<div class="panel flex-1 overflow-auto h-full">
            <div class="mb-5">
                <div class="mb-4 flex items-center sm:flex-row flex-col sm:justify-between justify-center">
                    <div class="sm:mb-0 mb-4">
                        <div class="text-lg font-semibold ltr:sm:text-left rtl:sm:text-right text-center">
                            <h3>Article</h3>
                        </div>
                    </div>
                    <div class="grid justify-items-stretch">
                        <div>
                            <Search v-model="search" class="mr-4 w-full max-w-md">
                            </Search>
                        </div>
                    </div>
                </div>
            </div>
            <div class="grid md:grid-cols-1 xl:grid-cols-3 gap-6">
                <template v-for="(article, index) in articles.data">
                <div class="panel h-full dark:shadow-dark">
                <section class="text-gray-600 body-font">
                    <div class="container mx-auto">
                        <div class="-my-8 divide-y-2 divide-gray-100">
                            <div class="py-8 flex flex-wrap md:flex-nowrap">                        
                                <div class="md:flex-grow">
                                    <span class="font-semibold title-font text-gray-700">
                                        {{article.section_name}}
                                    </span>
                                    <br />
                                    <span class="mt-1 text-gray-500 text-sm">
                                        {{article.created_at}}
                                    </span>
                                    <h2 class="text-xl font-medium text-gray-900 title-font mb-2">
                                        {{article.topic}}
                                    </h2>
                                    <p class="leading-relaxed">
                                        {{article.description}}
                                    </p>
                                </div>
                                <div class="md:w-30 md:mb-0 mb-6 flex-shrink-0 flex flex-col">
                                    <a
                                        href="javascript:;"
                                        class="flex items-center bg-success/30 text-success rounded-md px-1.5 py-1 text-xs hover:shadow-[0_10px_20px_-10px] hover:shadow-success"
                                        >Read More
                                        <svg
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                            class="w-4 h-4 rtl:rotate-180 ltr:ml-1.5 rtl:mr-1.5"
                                        >
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
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                </div>
                </template>
            </div>
        </div>-->
    </Employee>
</template>
