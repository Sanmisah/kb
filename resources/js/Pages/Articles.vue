<script setup>
import { watch } from "vue";
import { ref , onMounted} from 'vue';
import { router } from '@inertiajs/vue3';
import Employee from '@/Layouts/EmployeeLayout.vue';
import { Head } from '@inertiajs/vue3';
import DLink from '@/Components/DashboardLink1.vue';

const props = defineProps({
  articles: {
    type: Object,
    default: () => ({}),
  },
  filters: {
    type: Object,
    default: () => ({}),
  }
});
console.table(props.sections);
const tabMainChanged = (tabType) => {
    tabMain.value = tabType;
};
const tabMain = ref('notice');
let search = ref(props.filters.search);

watch(search, (value) => {
  router.get(
    "articles",
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
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Employee</h2>
        </template>
        <DLink></DLink>
        <br />        
        <div class="panel">
            <div class="mb-5">
                <div class="mb-4 flex items-center sm:flex-row flex-col sm:justify-between justify-center">
                    <div class="sm:mb-0 mb-4">
                        <div class="text-lg font-semibold ltr:sm:text-left rtl:sm:text-right text-center">
                            Articles
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
                        <tbody>
                            <template v-for="(article, index) in articles">
                                <tr>
                                    <a :href="'/article-detail/' + article.id">
                                    <td>
                                        <div
                                            class="group-hover:text-primary font-semibold text-base whitespace-nowrap">
                                            {{ article.topic }}
                                        </div>
                                        <div style="word-break:break-all;white-space: normal;" 
                                            class="text-white-dark overflow-hidden min-w-[300px] line-clamp-1"
                                            >
                                            {{ article.description }}
                                        </div>
                                    </td>
                                    <td>                                    
                                        <div>                                                           
                                            <a href="#"
                                                class="text-center whitespace-nowrap badge badge-outline-primary rounded-full" >
                                                {{ article.section.section_name }}
                                            </a>
                                        </div>                                       
                                    </td>  
                                    </a>                                  
                                </tr>
                            </template>
                        </tbody>
                    </table>
                </div>
            </div>            
        </div>
    </Employee>
</template>
