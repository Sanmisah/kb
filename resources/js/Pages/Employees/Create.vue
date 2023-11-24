<script setup>
import { router } from "@inertiajs/vue3";
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm } from "@inertiajs/vue3";
import { ref } from "vue";
import flatPickr from "vue-flatpickr-component";
import "flatpickr/dist/flatpickr.css";

defineProps({ errors: Object,  designations: Object, departments: Object, employees: Object });

const form = useForm({
    first_name: null,
    middle_name: null,
    last_name: null,
    email: null,
    contact_no: null,
    address_line_1: null,
    address_line_2: null,
    department_id: null,
    designation_id: null,
    date_of_joining: null,
    country: null,
    state: null,
    city: null,
    pincode: null,
    dob: null,
});

const basic = ref({
    dateFormat: 'd/m/Y'
});

/*const selectedState = ref('Maharashtra');*/

const stateList = ref([
    'Andaman and Nicobar Islands',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Chhattisgarh',
    
    'Dadra and Nagar Haveli',
    'Daman and Diu',
    'Delhi',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',

    'Jammu and Kashmir',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Ladakh',
    'Lakshadweep',
    'Madhya Pradesh',
    
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Puducherry',
    
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal'
]);

function submit() {
    router.post("/employees", form);
}
</script>

<template>
    <App>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Employee
            </h2>
        </template>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/employees"
                    :class="{ active: $page.component === 'Employees/Index' }"
                    >Employee</Link>
            </li>
            <li class="before:content-['/'] ltr:before:mr-1 rtl:before:ml-1">
                <span>Create</span>
            </li>
        </ul>
        <div class="pt-5">
            <form class="space-y-5" @submit.prevent="submit">
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
                        <br />
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                       
                            <TextInput type="text"  label="Contact No"  :required="true" v-model="form.contact_no" :error="errors.contact_no" />
                          
                        <div>
                            <InputLabel value="Date Of Birth" />
                            <flat-pickr class="form-input" :config="basic" v-model="form.dob"></flat-pickr>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.dob">
                                {{ errors.dob }}
                            </div>
                        </div>
                        <div>
                            <InputLabel value="Date Of Joining" />
                            <flat-pickr class="form-input" :config="basic" v-model="form.date_of_joining"></flat-pickr>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.date_of_joining">
                                {{ errors.date_of_joining }}
                            </div>
                        </div>
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
                        <br />
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
