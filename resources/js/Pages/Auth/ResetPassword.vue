<script setup>
import TextInput from '@/Components/TextInput.vue';
import {  useForm } from '@inertiajs/vue3';

const props = defineProps({
    email: {
        type: String,
        required: true,
    },
    token: {
        type: String,
        required: true,
    },
});

const form = useForm({
    token: props.token,
    email: props.email,
    password: '',
    password_confirmation: '',
});

const submit = () => {
    form.post(route('password.store'), {
        onFinish: () => form.reset('password', 'password_confirmation'),
    });
};
</script>

<template>
    <div class="flex justify-center items-center min-h-screen bg-[url('/public/assets/images/map.svg')] dark:bg-[url('/assets/images/map-dark.svg')] bg-cover bg-center"
    >
        <div class="panel sm:w-[480px] m-6 max-w-lg w-full">
            <h2 class="font-bold text-2xl mb-3">Password Reset</h2>
            <form class="space-y-5" @submit.prevent="submit">
                <TextInput type="email" label="Email" :error="form.errors.email" v-model="form.email"/>
                <TextInput type="password" label="Password" :error="form.errors.password" v-model="form.password"/>
                <TextInput type="password" label="Confirm Password" :error="form.errors.password_confirmation" v-model="form.password_confirmation"/>
                <button type="submit" class="btn btn-primary w-full">RECOVER</button>
            </form>
        </div>
    </div>
</template>
