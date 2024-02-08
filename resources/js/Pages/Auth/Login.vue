<script setup>
import TextInput from '@/Components/TextInput.vue';
import {  Link, useForm } from '@inertiajs/vue3';

import { useRouter } from 'vue-router';

const router = useRouter();

defineProps({
    canResetPassword: {
        type: Boolean,
    },
    status: {
        type: String,
    },
});

const form = useForm({
    email: '',
    password: '',
    remember: false,
});

const submit = () => {
    form.post(route('login'), {
        onFinish: () => form.reset('password'),
    });
};
</script>

<template>
<div class="flex min-h-screen">
    <div class="bg-gradient-to-t from-[#ff1361bf] to-[#44107A] w-1/2 min-h-screen hidden lg:flex flex-col items-center justify-center text-white dark:text-black p-4">
        <div class="w-full mx-auto mb-5">
            <img src="/public/assets/images/auth-cover.svg" alt="coming_soon" class="lg:max-w-[370px] xl:max-w-[500px] mx-auto" />
        </div>
        <h3 class="text-3xl font-bold mb-4 text-center">Join the community of expert developers</h3>
        <p>It is easy to setup with great customer experience. Start your 7-day free trial</p>
    </div>
    <div class="w-full lg:w-1/2 relative flex justify-center items-center">
        <div class="max-w-[480px] p-5 md:p-10">                
            <h2 class="font-bold text-2xl mb-3">Sign In</h2>
            <p class="mb-7">Enter your email and password to login</p>
            <form class="space-y-5" @submit.prevent="submit">
                <div>
                    <TextInput type="text" label="Email" :error="form.errors.email" v-model="form.email"/>
                </div>
                <div>
                    <TextInput type="password" label="Password" :error="form.errors.password" v-model="form.password"/>
                </div>                
                <div class="flex justify-end mt-4">
                    <button type="submit" class="btn btn-primary w-full">Log In</button>
                </div>
            </form>
            <!-- <div
                class="relative my-7 h-5 text-center before:w-full before:h-[1px] before:absolute before:inset-0 before:m-auto before:bg-[#ebedf2] dark:before:bg-[#253b5c]">
                <div class="font-bold text-white-dark bg-white dark:bg-[#0e1726] px-2 relative z-[1] inline-block">
                    <span>OR</span></div>
            </div>
            <p class="text-center">
                <Link v-if="canResetPassword"
                    :href="route('password.request')"
                    class="text-primary hover:underline">
                    Forgot your password?
                </Link>    
            </p> -->
        </div>
    </div>
</div>
</template>
