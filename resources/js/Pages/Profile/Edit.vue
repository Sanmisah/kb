<script setup>
import { router } from '@inertiajs/vue3';
import App from '@/Layouts/app-layout.vue';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import DeleteUserForm from './Partials/DeleteUserForm.vue';
import UpdatePasswordForm from './Partials/UpdatePasswordForm.vue';
import UpdateProfileInformationForm from './Partials/UpdateProfileInformationForm.vue';
import { Head } from '@inertiajs/vue3';
import { ref, onMounted } from "vue";
import { Link, useForm, usePage } from '@inertiajs/vue3';
import { useAppStore } from "@/stores/index";

defineProps({
    mustVerifyEmail: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});
</script>

<template>
    <Head title="Profile" />

    <App>
        <ul class="flex space-x-2 rtl:space-x-reverse">
            <li>
                <h2 class="font-semibold text-xl text-gray-800 leading-tight">Profile</h2>
            </li>
        </ul>
        <div class="pt-5">
            <div>                
                <UpdateProfileInformationForm
                    :must-verify-email="mustVerifyEmail"
                    :status="status"
                    class="max-w-xl"/>
            </div>
            <br/>
            <div>
                <UpdatePasswordForm class="max-w-xl" />
            </div>
        </div>
    </App>
</template>
