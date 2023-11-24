<script setup>
import { reactive } from 'vue';
import { router } from '@inertiajs/vue3';
import App from '@/Layouts/app-layout.vue';
import InputError from '@/Components/InputError.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import { ref, onMounted } from "vue";
import { Link, useForm, usePage } from '@inertiajs/vue3';
import { useAppStore } from "@/stores/index";
import flatPickr from "vue-flatpickr-component";
import "flatpickr/dist/flatpickr.css";

const props = defineProps({ designations: Object, departments: Object, employee: Object, errors: Object});

const basic = ref({
    dateFormat: 'd/m/Y'
});

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
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="First Name" />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.first_name"/>
                            <br>
                            <div class="mt-2 text-red-500" v-if="errors.first_name">{{ errors.first_name }}</div>
                        </div>
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Middle Name" />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.middle_name"/>
                            <br>
                            <div class="mt-2 text-red-500" v-if="errors.middle_name">{{ errors.middle_name }}</div>
                        </div>
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Last Name" />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.last_name"/>
                            <br>
                            <div class="mt-2 text-red-500" v-if="errors.last_name">{{ errors.last_name }}</div>
                        </div>
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500"
                                value="Contact No" />
                            <TextInput type="text" class="form-input" v-model="form.contact_no" />
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.contact_no">
                                {{ errors.contact_no }}
                            </div>
                        </div>
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
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Department"
                            />
                            <select class="form-select text-dark" v-model="form.department_id">
                                <template v-for="(department, id) in departments" :key="id">
                                    <option :value="id" v-text="department"></option>
                                </template>
                            </select>             
                            <div class="mt-2 text-red-500" v-if="errors.department_id">
                                {{ errors.department_id }}
                            </div>
                        </div>
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Designation"
                            />
                            <select class="form-select text-dark" v-model="form.designation_id">
                                <template v-for="(designation, id) in designations" :key="id">
                                    <option :value="id" v-text="designation"></option>
                                </template>
                            </select>                            
                            <div class="mt-2 text-red-500" v-if="errors.designation_id">
                                {{ errors.designation_id }}
                            </div>
                        </div>   
                    </div>
                </div>
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Address Detail
                        </h5>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500"
                                value="Address Line 1" />
                            <TextInput type="text" class="form-input" v-model="form.address_line_1" />
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.address_line_1">
                                {{ errors.address_line_1 }}
                            </div>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 gap-4 mb-4">
                        <div>
                            <InputLabel
                                value="Address Line 2" />
                            <TextInput type="text" class="form-input" v-model="form.address_line_2" />
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.address_line_2">
                                {{ errors.address_line_2 }}
                            </div>
                        </div>
                    </div>
                    <div class="grid grid-cols-4 gap-4 mb-4">
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Country"
                            />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.country"/>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.country">{{ errors.country }}</div>
                        </div>     
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="State"
                            />
                            <!--<select class="form-select" v-model="form.state">
                                <template v-for="(state, i) in stateList" :key="i">
                                    <option :value="state">{{ state }}</option>
                                </template>
                            </select>-->
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.state"/>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.state">{{ errors.state }}</div>
                        </div>
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="City"
                            />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.city"/>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.city">{{ errors.city }}</div>
                        </div>
                        <div>
                            <InputLabel
                                class="after:content-['*'] after:text-red-500"
                                value="Pincode"
                            />
                            <TextInput
                                type="text"
                                class="form-input"
                                v-model="form.pincode"/>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.pincode">{{ errors.pincode }}</div>
                        </div>                     
                    </div> 
                </div>
                <div class="panel">
                    <div class="flex items-center justify-between mb-5">
                        <h5 class="font-semibold text-lg dark:text-white-light">
                            Login Detail
                        </h5>
                    </div>
                    <div class="grid grid-cols-3 gap-4 mb-4">
                        <div>
                            <InputLabel class="after:content-['*'] after:text-red-500" value="Email" />
                            <TextInput type="text" class="form-input" v-model="form.email" />
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.email">
                                {{ errors.email }}
                            </div>
                        </div>
                        <div>
                            <InputLabel                  
                                value="Password"
                            />
                            <TextInput                                
                                type="password"
                                class="form-input"
                                v-model="form.password"
                            />
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.password">
                                {{ errors.password }}
                            </div>
                        </div>  
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
