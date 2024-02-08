<script setup>
import { router } from "@inertiajs/vue3";
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
import { ref, onMounted } from "vue";

defineProps({ errors: Object, open: false, inductions: Object});

const form = useForm({
    question: null,
    choice_1: null,
    choice_2: null,
    choice_3: null,
    choice_4: null,
    answer: null,
    type: null,
    induction_id: null,
});

function questionType(){
    if (form.type == 'Multiple Choice'){
        console.log(form.type)
    }else{
        console.log(form.type)
    }
}

function submit() {
    router.post("/quiz", form);
}
</script>

<template>
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/quiz"
                    :class="{ active: $page.component === 'Quiz/Index' }"
                    >Quiz</Link>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="submit">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Create Quiz
                        </h5>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">                       
                        <TextInput type="text" label="Question" v-model="form.question" :required="true" :error="errors.question"/>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <SelectInput label="Induction" v-model="form.induction_id" :data="inductions" :error="errors.induction_id" />
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Question Type"
                            />
                            <select class="form-select " v-model="form.type" v-on:change="questionType()">    
                                <option>Select</option>                            
                                <option value="Single Choice">Single Choice</option>
                                <option value="Multiple Choice">Multiple Choice</option>                                
                            </select>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.type">
                                {{ errors.type }}
                            </div>
                        </div>
                    </div>
                    <!-- <div class="grid grid-cols-4 gap-4 mb-4" v-if="form.type == 'Multiple Choice'"> -->
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <TextInput type="text" label="Option 1" :error="errors.choice_1" v-model="form.choice_1"/>
                    
                        <TextInput type="text" label="Option 2" :error="errors.choice_2" v-model="form.choice_2"/>
                    
                        <TextInput type="text" label="Option 3" :error="errors.choice_3" v-model="form.choice_3"/>
                    
                        <TextInput type="text" label="Option 4" :error="errors.choice_4" v-model="form.choice_4"/>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">                       
                        <TextInput type="text" label="Answer" v-model="form.answer" :error="errors.answer"/>
                    </div>
                    <div class="flex justify-end mt-4">
                      <button type="submit" class="btn btn-success">Submit</button
                      >&nbsp;&nbsp;
                      <Link
                          href="/quiz"
                          class="btn btn-danger"
                          :class="{
                              active: $page.component === 'Quiz/Index',
                          }"
                          >Cancel</Link>
                    </div>
                </div>
            </form>
        </div>
    </App>
</template>
