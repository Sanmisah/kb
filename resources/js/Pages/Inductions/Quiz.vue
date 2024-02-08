<script lang="ts" setup>
import { ref } from 'vue';
import Employee from '@/Layouts/EmployeeLayout.vue';
import DLink from '@/Components/DashboardLink1.vue';
import { useForm } from '@inertiajs/vue3';
import { router } from "@inertiajs/vue3";

const props = defineProps({        
    quiz: Object, 
    last_id: Object,      
});
const selectedTab = ref('');
const tabChanged = (type: any = null) => {
    let className = 'row_'+ type;
    selectedTab.value = className;
    console.log(props.quiz[type]);
};

const form = useForm({
    answer: null,
    quiz_id: null,
    induction_id: props.quiz[0].induction_id,  
    last_quiz_id: props.last_id[0].id,   
});

function submit() {  
    router.post("/employee_dashboard", form);
}
</script>

<template>
    <Employee>
    <DLink></DLink>
    <br />
    <div>
        <div class="flex gap-5 relative sm:h-[calc(100vh_-_150px)] h-full">
            <div class="panel p-4 flex-none w-[240px] max-w-full absolute xl:relative z-10 space-y-4 xl:h-auto h-full xl:block ltr:xl:rounded-r-md ltr:rounded-r-none rtl:xl:rounded-l-md rtl:rounded-l-none hidden">
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
            <div class="overlay bg-black/60 z-[5] w-full h-full rounded-md absolute hidden"></div>
            <div class="panel p-0 flex-1 overflow-auto h-full">
                <div class="flex flex-col h-full">
                    <div class="table-responsive grow  sm:min-h-[300px] min-h-[400px]">
                        <table class="table-hover">
                            <tbody>                       
                                <template v-for="(val, index) in quiz"> 
                                    <div v-bind:id="'row_' + (index+1)">   
                                        <div v-if="selectedTab === 'row_' + (index+1)"> 
                                            <form @submit.prevent="submit">
                                                <tr class="group">      
                                                    <td>
                                                        <div class="font-semibold text-base whitespace-nowrap">
                                                            <span class="text-white-dark">
                                                                {{ index+1 }}
                                                            </span> &nbsp;&nbsp;
                                                            {{ val.question }}
                                                            <input type="hidden" class="form-input" v-model="form.induction_id"/>
                                                            
                                                        </div>
                                                    </td> 
                                                </tr>
                                                <tr class="group">
                                                    <td>
                                                        <template v-for="(vals, i) in val.quiz_details" >
                                                            <div class="font-semibold text-base whitespace-nowrap">
                                                                <label>
                                                                    <input type="radio" name="answer" v-model="form.answer" class="form-radio" :value="vals.answer"/>
                                                                    <span class="text-white-dark">{{ vals.answer }}</span> 
                                                                </label>
                                                            </div>
                                                        </template>
                                                    </td>
                                                </tr>
                                                <div v-if="form.last_quiz_id == val.id">
                                                    <div class="flex justify-end mt-4">
                                                        <button class="btn btn-dark">Submit</button>
                                                    </div>
                                                </div>
                                                <div v-else>
                                                    <div class="flex justify-end mt-4">
                                                        <button class="btn btn-dark">Next</button>
                                                    </div>
                                                </div>                                                
                                            </form>
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

