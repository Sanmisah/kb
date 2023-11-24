<script setup>
import { reactive } from 'vue';
import { router } from '@inertiajs/vue3';
import App from '@/Layouts/app-layout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import DateInput from "@/Components/DateInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { ref, onMounted } from "vue";
import { Link, useForm, usePage } from '@inertiajs/vue3';
import { useAppStore } from "@/stores/index";


const props = defineProps({ designations: Object, departments: Object, employee: Object, errors: Object});



const form = useForm({
    first_name: props.employee.first_name,
    middle_name: props.employee.middle_name,
    last_name: props.employee.last_name,
    email: props.employee.email,
    contact_no: props.employee.contact_no,
    address_line_1: props.employee.address_line_1,
    address_line_2: props.employee.address_line_2,
    department_id: props.employee.department_id,
    designation_id: props.employee.designation_id,
    date_of_joining: props.employee.date_of_joining,
    country: props.employee.country,
    state: props.employee.state,
    city: props.employee.city,
    pincode: props.employee.pincode,
    dob: props.employee.dob,
});

</script>
<template>    
    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/employees" :class="{ 'active': $page.component === 'Employees/Index' }">Employee</Link>
            </li>
            <li class="before:content-['/'] ltr:before:mr-1 rtl:before:ml-1">
                <span>Edit</span>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="form.patch(route('employees.update', props.employee.id))">
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Personal Detail
                        </h5>
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <TextInput
                            type="text"
                            label="First Name"
                            :error="errors.first_name"
                            :required="true"
                            v-model="form.first_name"/>
                        <TextInput
                            type="text"
                            label="Middle Name"
                            :error="errors.middle_name"
                            :required="true"
                            v-model="form.middle_name"/>
                       
                        <TextInput
                            type="text"
                            label="Last Name"
                            :required="true"
                            :error="errors.last_name"
                            v-model="form.last_name"/>
                        
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <TextInput type="text"  label="Contact No"  :required="true" v-model="form.contact_no" :error="errors.contact_no" />
                        <DateInput label="Date Of Birth" v-model="form.dob" :error="errors.dob" />
                        <DateInput label="Date Of Joining" v-model="form.date_of_joining" :error="errors.date_of_joining" />
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <SelectInput  label="Department"  :required="true" v-model="form.department_id" :data="departments" :error="errors.department_id" />
                        <SelectInput  label="Designation"  :required="true" v-model="form.designation_id" :data="designations" :error="errors.designation_id" />
                    </div>
                </div>
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Address Detail
                        </h5>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">                       
                        <TextInput type="text"  label="Address Line 1" :error="errors.address_line_1" v-model="form.address_line_1" />
                        
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <TextInput type="text"  label="Address Line 2" :error="errors.address_line_2" v-model="form.address_line_2" />
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <TextInput type="text"  label="Country" :error="errors.country" v-model="form.country" />
                        <TextInput type="text"  label="State" :error="errors.state" v-model="form.state" />
                        <TextInput type="text"  label="City" :error="errors.city" v-model="form.city" />
                                                             
                    </div>  
                </div>
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Login Detail
                        </h5>
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <TextInput type="email"  label="Email" :error="errors.email" v-model="form.email" />  
                        <TextInput type="password"  label="Password" :error="errors.password" v-model="form.password" />  
                    </div>                                        
                    <div class="flex justify-end mt-4">
                        <button type="submit" class="btn btn-success">Submit</button
                        >&nbsp;&nbsp;
                        <Link
                          href="/employees"
                          class="btn btn-danger"
                          :class="{
                              active: $page.component === 'Employees/Index',
                          }"
                          >Cancel</Link>
                    </div>
                </div>
            </form>
        </div>
    </App>
</template>
