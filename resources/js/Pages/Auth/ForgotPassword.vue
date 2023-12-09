<script setup>
import TextInput from '@/Components/TextInput.vue';
import { Head, useForm } from '@inertiajs/vue3';

defineProps({
    status: {
        type: String,
    },
});

const form = useForm({
    email: '',
});

const submit = () => {
    form.post(route('password.email'));
};
</script>

<template>
        <div class="flex justify-center items-center min-h-screen bg-[url('/public/assets/images/map.svg')] dark:bg-[url('/assets/images/map-dark.svg')] bg-cover bg-center">
            <Head title="Forgot Password" />
            <div class="panel sm:w-[480px] m-6 max-w-lg w-full">
                <p class="mb-7">
                    Forgot your password? No problem. <br>Just let us know your email address and we will email you a password reset link that will allow you to choose a new one.
                </p>

                <div v-if="status" class="mb-4 font-medium text-sm text-green-600">
                    {{ status }}
                </div>
                
                <form class="space-y-5" @submit.prevent="submit">
                    <div class="mt-4">
                        <TextInput type="text" label="Email" :error="form.errors.email" v-model="form.email"/>
                        
                    </div>                    
                    <div class="flex items-center justify-end mt-4">
                        <button type="submit" class="btn btn-primary">Email Password Reset Link</button>
                    </div>
                </form>
            </div>
        </div>
</template>
