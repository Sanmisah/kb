<script setup>
import { router } from "@inertiajs/vue3";
import { ref } from 'vue';
import App from "@/Layouts/app-layout.vue";
import InputLabel from "@/Components/InputLabel.vue";
import TextInput from "@/Components/TextInput.vue";
import Multiselect from '@suadelabs/vue3-multiselect';
import '@suadelabs/vue3-multiselect/dist/vue3-multiselect.css';
import { Link, useForm, usePage } from "@inertiajs/vue3";
const props = defineProps({ errors: Object, permissions: Object });


const form = useForm({
    name: null,
    guard_name: null,
    permissions: [],
});

function submit() {
   
    router.post("/roles", form);
}
</script>

<template>
    <App>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Roles
            </h2>
        </template>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <Link href="/roles" :class="{ active: $page.component === 'Roles/Index' }">Roles</Link>
            </li>
        </ul>
        <br />
        <div class="panel lg:row-start-3 lg:col-start-2">
            <div class="flex items-center justify-between mb-5">
                <h5 class="font-semibold text-lg dark:text-white-light">
                    Create Roles
                </h5>
            </div>
            <div class="mb-5">
                <form class="space-y-5" @submit.prevent="submit">
                    <div class="grid grid-cols-6 gap-4">
                        <div class="col-start-1 col-end-3">
                            <InputLabel for="name" value="Name" class="after:content-['*'] after:text-red-500" />
                            <TextInput id="name" type="text" class="form-input" v-model="form.name" />
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.name">
                                {{ errors.name }}
                            </div>
                        </div>
                        <div class="col-start-3 col-end-6">
                            <InputLabel for="guard_name" value="Gaurd Name"
                                class="after:content-['*'] after:text-red-500" />
                            <TextInput id="guard-name" type="text" class="form-input" v-model="form.guard_name" />
                            <br />
                            <div class="mt-2 text-red-500" v-if="errors.guard_name">
                                {{ errors.guard_name }}
                            </div>
                        </div>
                        <div class="col-start-1 col-end-7">
                            <ul >
                                <li style="width:19%;display: inline-block;">
                                    <input type="checkbox" class="form-checkbox text-success myCheck"
                                        v-model="form.permissions" :value="All" :id="all" :name="all" />
                                        All 
                                </li>
                                <li v-for="permission in permissions" :key="permission.id" style="width:19%;display: inline-block;">
                                    <input type="checkbox" class="form-checkbox text-success myCheck"
                                        v-model="form.permissions" :value="permission.name" :id="permission.name" :name="permission.name" />
                                        {{  permission.name  }}

                                </li>

                            </ul>


                        </div>
                       
                    </div>
                    <div class="flex justify-end mt-4">
                        <button type="submit" class="btn btn-success">
                            Submit</button>&nbsp;&nbsp;
                        <Link href="/roles" class="btn btn-danger" :class="{
                            active: $page.component === 'Roles/Index',
                        }">Cancel</Link>
                    </div>
                </form>
            </div>
        </div>
    </App>
</template>
