<script setup>
import App from '@/Layouts/app-layout.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm } from '@inertiajs/vue3';

const props = defineProps({ induction: Object, errors: Object, departments: Object});

const form = useForm({
   induction_name: props.induction.induction_name,
   department_id: props.induction.department_id,
});

</script>
<template>    
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/inductions" :class="{ 'active': $page.component === 'Inductions/Index' }">Induction</Link>
            </li>
        </ul>
        <br>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="form.patch(route('inductions.update', props.induction.id))">
            <div class="panel">
                <div class="flex items-center justify-between mb-5">
                  <h5 class="font-semibold text-lg dark:text-white-light">Edit Inductions</h5>
                </div>
                <div class="grid grid-cols-4 gap-4 mb-4">
                    <TextInput type="text" label="Name" :error="errors.induction_name" :required="true" v-model="form.induction_name"/>
                    <SelectInput  label="Department"  :required="true" v-model="form.department_id" :data="departments" :error="errors.department_id" />
                </div>
                <div class="flex justify-end mt-4">
                    <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;
                    <Link href="/inductions" class="btn btn-danger" :class="{ 'active': $page.component === 'Inductions/Index' }">Cancel</Link>
                </div>
            </div>
            </form>
        </div>
    </App>
</template>
