<script setup>
import { ref } from 'vue'
import App from '@/Layouts/app-layout.vue';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import { Link, useForm, usePage } from '@inertiajs/vue3';


const props = defineProps({ errors: Object, role: Object, permissions: Object, rolePermissions: Object })

const form = useForm({
    name: props.role.name,
    guard_name: props.role.guard_name,
    permissions :[],
})
 
/*function isChecked(){
    console.log('hi');
    if(form.permissions.id === rolePermissions){ 
        console.log('true')
        return 'checked'
    }else{
        console.log('false')
        return ''
    }
}*/

function submit() {
   form.patch(route('roles.update', props.role.id));
}
</script>

<template>
    <App>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">Roles</h2>
        </template>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/roles" :class="{ 'active': $page.component === 'Roles/Index' }">Roles</Link>
            </li>
        </ul>
        <br>
        <div class="panel lg:row-start-3 lg:col-start-2">
            <div class="flex items-center justify-between mb-5">
                <h5 class="font-semibold text-lg dark:text-white-light">Create Roles</h5>
            </div>
            <div class="mb-5">
                <form class="space-y-5" @submit.prevent="submit">
                    <div class="grid grid-cols-6 gap-4">
                        <div class="col-start-1 col-end-3">
                            <TextInput type="text" label="Name" :error="errors.name" :required="true" v-model="form.name"/>
                        </div>
                        <div class="col-start-3 col-end-6">
                            <TextInput type="text" label="Gaurd Name" :error="errors.guard_name" :required="true" v-model="form.guard_name"/>
                        </div>
                        <div class="col-start-1 col-end-7">
                            <ul >
                                <li style="width:19%;display: inline-block;">
                                    <input type="checkbox" class="form-checkbox text-success myCheck"
                                        v-model="form.permissions" v-bind:value="All" v-bind:id="all" v-bind:name="all" />
                                        All 
                                </li>
                                <li v-for="permission in permissions" :key="permission.id" style="width:19%;display: inline-block;">
                                    <input type="checkbox" class="form-checkbox text-success permission"
                                        v-model="form.permissions"
 v-bind:id="permission.name" v-bind:value="permission.name" :name="permission.name" />
                                        {{  permission.name  }}
                                        
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="flex justify-end mt-4">
                        <button type="submit" class="btn btn-success">Submit</button>&nbsp;&nbsp;
                        <Link href="/roles" class="btn btn-danger" :class="{ 'active': $page.component === 'Roles/Index' }">
                        Cancel</Link>
                    </div>
                </form>
            </div>
        </div>
    </App>
</template>
