<script lang="ts" setup>
import { ref, onMounted } from 'vue';
import { useAppStore } from '@/stores/index';
import Employee from '@/Layouts/EmployeeLayout.vue';
import DLink from '@/Components/DashboardLink.vue';

const props = defineProps({
    filters: {
        type: Object,
        default: () => ({}),
    },
    articles: {
        type: Array,
        default: () => ({}),
    },
    quiz: {
        type: Object,
        default: () => ({}),
    },
});
const store = useAppStore();
const defaultParams = ref({
    id: null,
    question: '',
    answer: '',
    tag: '',
    priority: 'low',
});
const selectedTab = ref('');
const isShowTaskMenu = ref(false);
const viewTaskModal = ref(false);
const params = ref(JSON.parse(JSON.stringify(defaultParams.value)));
const allTasks = ref([]);
let maxId = 1;
props.quiz.map(function (value) {
    allTasks.value.push({
        id: maxId,
        question: value.question,
        answer: value.answer,        
        tag: 'row_'+ maxId,
        priority: 'medium',
    });
    maxId++;      
});
const filteredTasks: any = ref([]);
const pagedTasks: any = ref([]);
const searchTask = ref('');
const selectedTask: any = ref(defaultParams.value);
const isPriorityMenu: any = ref(null);
const isTagMenu: any = ref(null);
const pager = ref({
    currentPage: 1,
    totalPages: 0,
    pageSize: 10,
    startIndex: 0,
    endIndex: 0,
});
onMounted(() => {
    searchTasks();
});
const searchTasks = (isResetPage = true) => {
    if (isResetPage) {
        pager.value.currentPage = 1;
    }
    console.log(selectedTab.value)
    let res;
    
    res = allTasks.value.filter((d) => d.tag === selectedTab.value);
    if(selectedTab.value == ''){
        res = allTasks.value.filter((d) => d.tag?.toLowerCase(selectedTab.value));
    }    
    filteredTasks.value = res.filter((d) => d.title?.includes(searchTask.value));
    getPager();
};
const getPager = () => {
    setTimeout(() => {
        if (filteredTasks.value.length) {
            pager.value.totalPages = pager.value.pageSize < 1 ? 1 : Math.ceil(filteredTasks.value.length / pager.value.pageSize);
            if (pager.value.currentPage > pager.value.totalPages) {
                pager.value.currentPage = 1;
            }
            pager.value.startIndex = (pager.value.currentPage - 1) * pager.value.pageSize;
            pager.value.endIndex = Math.min(pager.value.startIndex + pager.value.pageSize - 1, filteredTasks.value.length - 1);
            pagedTasks.value = filteredTasks.value.slice(pager.value.startIndex, pager.value.endIndex + 1);
        } else {
            pagedTasks.value = [];
            pager.value.startIndex = -1;
            pager.value.endIndex = -1;
        }
    });
};
const setPriority = (task: any, name: string = '') => {
    let item = filteredTasks.value.find((d) => d.id === task.id);
    item.priority = name;
    searchTasks(false);
};
const setTag = (task: any, name: string = '') => {
    let item = filteredTasks.value.find((d) => d.id === task.id);
    item.tag = name;
    searchTasks(false);
};
const tabChanged = (type: any = null) => {
    let className = 'row_'+ type;
    selectedTab.value = className;
    searchTasks();
    isShowTaskMenu.value = false;
};
const viewTask = (item: any = null) => {
    selectedTask.value = item;
    setTimeout(() => {
        viewTaskModal.value = true;
    });
};
</script>

<template>
    <Employee>
    <DLink></DLink>
    <br />
    <div>
        <div class="flex gap-5 relative sm:h-[calc(100vh_-_150px)] h-full">
            <div class="panel p-4 flex-none w-[240px] max-w-full absolute xl:relative z-10 space-y-4 xl:h-auto h-full xl:block ltr:xl:rounded-r-md ltr:rounded-r-none rtl:xl:rounded-l-md rtl:rounded-l-none hidden"
                :class="{ '!block': isShowTaskMenu }">
                <div class="flex flex-col h-full pb-16">
                    <div class="pb-5">
                        <div class="flex text-center items-center">
                            <div class=" shrink-0">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-5 h-5">
                                    <path opacity="0.5" d="M16 4.00195C18.175 4.01406 19.3529 4.11051 20.1213 4.87889C21 5.75757 21 7.17179 21 10.0002V16.0002C21 18.8286 21 20.2429 20.1213 21.1215C19.2426 22.0002 17.8284 22.0002 15 22.0002H9C6.17157 22.0002 4.75736 22.0002 3.87868 21.1215C3 20.2429 3 18.8286 3 16.0002V10.0002C3 7.17179 3 5.75757 3.87868 4.87889C4.64706 4.11051 5.82497 4.01406 8 4.00195" stroke="currentColor" stroke-width="1.5"/>
                                    <path d="M8 14H16" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path d="M7 10.5H17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path d="M9 17.5H15" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                    <path d="M8 3.5C8 2.67157 8.67157 2 9.5 2H14.5C15.3284 2 16 2.67157 16 3.5V4.5C16 5.32843 15.3284 6 14.5 6H9.5C8.67157 6 8 5.32843 8 4.5V3.5Z" stroke="currentColor"
                                    stroke-width="1.5"/>
                                </svg>
                            </div>
                            <h3 class="text-lg font-semibold ltr:ml-3 rtl:mr-3">Inductions</h3>
                        </div>
                    </div>
                    <div class="h-px w-full border-b border-[#e0e6ed] dark:border-[#1b2e4b] mb-2"></div>
                    <perfect-scrollbar :options="{ swipeEasing: true,
                        wheelPropagation: false,}" class="relative ltr:pr-3.5 rtl:pl-3.5 ltr:-mr-3.5 rtl:-ml-3.5 h-full grow">
                        <div class="space-y-1">  
                            <div class="text-md font-semibold px-1 py-3">Quiz</div>
                                <button type="button" class="w-full flex justify-between items-center p-2 hover:bg-white-dark/10 rounded-md dark:hover:text-primary hover:text-primary dark:hover:bg-[#181F32] font-medium h-10"
                                :class="{ 'bg-gray-100 dark:text-primary text-primary dark:bg-[#181F32]': selectedTab === '' }" @click="tabChanged('')">
                                    <div class="flex items-center">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="w-4.5 h-4.5 shrink-0">
                                            <path d="M2 5.5L3.21429 7L7.5 3" stroke="currentColor" stroke-width="1.5"
                                                stroke-linecap="round" stroke-linejoin="round"/>
                                            <path opacity="0.5" d="M2 12.5L3.21429 14L7.5 10" stroke="currentColor"
                                                stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                            <path d="M2 19.5L3.21429 21L7.5 17" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                                            <path d="M22 19L12 19" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                            <path opacity="0.5" d="M22 12L12 12" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                            <path d="M22 5L12 5" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" />
                                        </svg>
                                        <div class="ltr:ml-3 rtl:mr-3">All</div>
                                    </div>
                                </button>
                                <template v-for="(val, index) in quiz">
                                    <button type="button" class="items-center h-10 p-1 hover:bg-white-dark/10 rounded-md dark:hover:bg-[#181F32] font-medium text-success ltr:hover:pl-3 rtl:hover:pr-3 duration-300"
                                    @click="tabChanged(index+1)">
                                        <span class="badge badge-outline-primary hover:badge badge-outline-success">{{ index+1 }}</span>
                                    </button>
                                </template>
                        </div>
                    </perfect-scrollbar>
                </div>
            </div>
            <div class="overlay bg-black/60 z-[5] w-full h-full rounded-md absolute hidden" :class="{ '!block xl:!hidden': isShowTaskMenu }" @click="isShowTaskMenu = !isShowTaskMenu"></div>
            <div class="panel p-0 flex-1 overflow-auto h-full">
                <div class="flex flex-col h-full">
                    <div class="table-responsive grow  sm:min-h-[300px] min-h-[400px]">
                        <table class="table-hover">
                            <tbody>                                 
                                <template v-for="(val, index) in quiz"> 
                                    <div v-bind:id="'row_' + (index+1)">   
                                        <div v-if="selectedTab === 'row_' + (index+1)"> 
                                            <tr class="group">      
                                                <td>
                                                    <div class="font-semibold text-base whitespace-nowrap">
                                                        <span class="text-white-dark">
                                                            {{ index+1 }}
                                                        </span> &nbsp;&nbsp;
                                                        {{ val.question }}
                                                    </div>
                                                </td> 
                                            </tr>
                                            <tr class="group">
                                                <td>
                                                    <template v-for="(vals, i) in val.quiz_details" >
                                                        <div class="font-semibold text-base whitespace-nowrap">
                                                            <label>
                                                                <input type="radio" name="answer" class="form-radio" :value="vals.answer"/>
                                                                <span class="text-white-dark">{{ vals.answer }}</span>
                                                            </label>
                                                        </div>
                                                    </template>
                                                </td>
                                            </tr>
                                        </div> 
                                    </div>
                                </template>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>         
        </div>
    </div>
</Employee>
</template>

