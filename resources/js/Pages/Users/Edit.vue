<script setup>
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import SelectInput from "@/Components/SelectInput.vue";
import { Link, useForm, usePage } from "@inertiajs/vue3";
const props = defineProps({ errors: Object, user: Object , roles: Object, userRole: Object});
console.log(props.userRole)



const form = useForm({
    name: props.user.name,
    email: props.user.email,
    password: null,
    active: props.user.active,
    role: props.userRole,
});


</script>

<template>
    <App>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Users
            </h2>
        </template>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link
                    href="/users"
                    :class="{ active: $page.component === 'Users/Index' }"
                    >Users</Link
                >
            </li>
        </ul>
        <br />
        <div class="panel lg:row-start-3 lg:col-start-2">
            <div class="flex items-center justify-between mb-5">
                <h5 class="font-semibold text-lg dark:text-white-light">
                    Create Users
                </h5>
            </div>
            <div class="mb-5">
                <form class="space-y-5" @submit.prevent="form.patch(route('users.update', props.user.id))">
                    <div class="grid grid-cols-3 gap-4">
                        <TextInput type="text" label=" Name" :error="errors.name" :required="true" v-model="form.name"/>
                        <TextInput type="text" label=" Email" :error="errors.email" :required="true" v-model="form.email"/>
                        <TextInput type="password" label=" Password" :error="errors.password" :required="true" v-model="form.password"/>
                        <!--<SelectInput  label="Role" :required="true" v-model="form.role" :data="roles" :error="errors.role" />-->
                        <div>
                            <InputLabel
                                for="role"
                                class="after:content-['*'] after:text-red-500"
                                value="Role"
                            />
                           
                            <select class="form-select " v-model="form.role">
                                  <option>Please Select</option>
                                <template v-for="(role, id) in roles" :key="id" >
                                    <option :value="role">
                                        {{ role }}
                                    </option>
                                </template>
                            </select>
                            
                            <div class="mt-2 text-red-500" v-if="errors.role">
                                {{ errors.role }}
                            </div>
                        </div>
                        <div>
                            <InputLabel
                                for="active"
                                class="after:content-['*'] after:text-red-500"
                                value="Active"
                            />
                            <select class="form-select " v-model="form.active">
                                  <option value="0">Deactive</option>
                                  <option value="1">Active</option>
                                
                            </select>
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.active">
                                {{ errors.active }}
                            </div>
                        </div>
                       
                    </div>
                    <div class="flex justify-end mt-4">
                        <button type="submit" class="btn btn-success">
                            Submit</button
                        >&nbsp;&nbsp;
                        <Link
                            href="/users"
                            class="btn btn-danger"
                            :class="{
                                active: $page.component === 'users/Index',
                            }"
                            >Cancel</Link
                        >
                    </div>
                </form>
            </div>
        </div>
    </App>
</template>
