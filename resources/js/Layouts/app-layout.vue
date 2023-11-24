<template>
<div
        class="main-section antialiased relative font-nunito text-sm font-normal"
        :class="[store.sidebar ? 'toggle-sidebar' : '', store.menu, store.layout, store.rtlClass]"
    >
    <!--  BEGIN MAIN CONTAINER  -->
    <div class="relative">
        <!-- sidebar menu overlay -->
        <div class="fixed inset-0 bg-[black]/60 z-50 lg:hidden" :class="{ hidden: !store.sidebar }" @click="store.toggleSidebar()"></div>

       

        <div class="fixed bottom-6 ltr:right-6 rtl:left-6 z-50">
            <template v-if="showTopButton">
                <button
                    type="button"
                    class="btn btn-outline-primary rounded-full p-2 animate-pulse bg-[#fafafa] dark:bg-[#060818] dark:hover:bg-primary"
                    @click="goToTop"
                >
                    <svg width="24" height="24" class="h-4 w-4" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            opacity="0.5"
                            fill-rule="evenodd"
                            clip-rule="evenodd"
                            d="M12 20.75C12.4142 20.75 12.75 20.4142 12.75 20L12.75 10.75L11.25 10.75L11.25 20C11.25 20.4142 11.5858 20.75 12 20.75Z"
                            fill="currentColor"
                        />
                        <path
                            d="M6.00002 10.75C5.69667 10.75 5.4232 10.5673 5.30711 10.287C5.19103 10.0068 5.25519 9.68417 5.46969 9.46967L11.4697 3.46967C11.6103 3.32902 11.8011 3.25 12 3.25C12.1989 3.25 12.3897 3.32902 12.5304 3.46967L18.5304 9.46967C18.7449 9.68417 18.809 10.0068 18.6929 10.287C18.5768 10.5673 18.3034 10.75 18 10.75L6.00002 10.75Z"
                            fill="currentColor"
                        />
                    </svg>
                </button>
            </template>
        </div>

       

        <div class="main-container text-black dark:text-white-dark min-h-screen" :class="[store.navbar]">
            <!--  BEGIN SIDEBAR  -->
            <Sidebar />
            <!--  END SIDEBAR  -->
             
            <!--  BEGIN CONTENT AREA  -->
            <div class="main-content">
                <!--  BEGIN TOP NAVBAR  -->
                <Header />
                <!--  END TOP NAVBAR  -->
                <div v-if="$page.props.flash.success" class="m-4">
                    <Alert :data="$page.props.flash.success" :flag="true"/>
                </div>
                <div v-if="$page.props.flash.error" >
                    <Alert :data="$page.props.flash.error" :flag="false"/>
                </div>
                <div class="p-6 animation">
                     <main>
                        <slot />
                    </main>
                    <!-- BEGIN FOOTER -->
                    <Footer />
                    <!-- END FOOTER -->
                </div>
            </div>
            <!--  END CONTENT AREA  -->
        </div>
    </div>
</div>
</template>
<script setup lang="ts">
    import { ref, onMounted } from 'vue';
    import Header from '@/Components/layout/Header.vue';
    import Alert from '@/Components/Alert.vue';
    import Sidebar from '@/Components/layout/Sidebar.vue';
    import Footer from '@/Components/layout/Footer.vue';
    import Setting from '@/Components/ThemeCustomizer.vue';
    import appSetting from '@/app-setting';

    import { useAppStore } from '@/stores/index';
    appSetting.init();
    const store = useAppStore();
    const showTopButton = ref(false);
    onMounted(() => {
        window.onscroll = () => {
            if (document.body.scrollTop > 50 || document.documentElement.scrollTop > 50) {
                showTopButton.value = true;
            } else {
                showTopButton.value = false;
            }
        };

        const eleanimation: any = document.querySelector('.animation');
        eleanimation.addEventListener('animationend', function () {
            appSetting.changeAnimation('remove');
        });
        store.toggleMainLoader();
    });

    const goToTop = () => {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    };
</script>
