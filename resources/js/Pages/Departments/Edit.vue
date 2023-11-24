<script setup>
import { reactive } from 'vue';
import { router } from '@inertiajs/vue3';
import App from '@/Layouts/app-layout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import TextInput from '@/Components/TextInput.vue';
import { ref, onMounted } from "vue";
import { Link, useForm, usePage } from '@inertiajs/vue3';
import { useAppStore } from "@/stores/index";

const props = defineProps({ department: Object, errors: Object});

const form = useForm({
   department_name: props.department.department_name,
});

</script>
<template>    
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/departments" :class="{ 'active': $page.component === 'Departments/Index' }">Department</Link>
            </li>
        </ul>
        <br>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="form.patch(route('departments.update', props.department.id))">
            <div class="panel">
                <div class="flex items-center justify-between mb-5">
                  <h5 class="font-semibold text-lg dark:text-white-light">Edit Departments</h5>
                </div>
                <div class="grid grid-cols-4 gap-4 mb-4">
                    <TextInput type="text" label="Name" :error="errors.department_name" :required="true" v-model="form.department_name"/>
                </div>
                <div class="flex justify-end mt-4">
                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;
                    <Link href="/departments" class="btn btn-danger" :class="{ 'active': $page.component === 'Departments/Index' }">Cancel</Link>
                </div>
            </div>
            </form>
        </div>
    </App>
</template>
