<script setup>
import App from '@/Layouts/app-layout.vue';
import { Link } from '@inertiajs/vue3';

const props = defineProps({
    employee: {
        type: Object,
        default: () => ({}),
    }
});

console.log(props.employee)

</script>
<template>
    <App>
      <div class="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
          <header>
              <h5 class="font-semibold text-lg dark:text-white-light">Employee</h5>
          </header> <br>
          <div class="grid ">
            
            <div class="justify-self-start">
              <Link :href="'/employees'" class="btn btn-primary btn-sm ">
               

                Back</Link>
            </div> <br>
          </div>
          <div class="table-responsive">
            <table>
              <thead>
                <tr>
                  <th>#</th>
                  <th>IP Address</th>
                  <th>Browser </th>
                  <th>System </th>
                  <th>Login Time</th>
                  <th>Login Time</th>   
                </tr>
              </thead>
              <tbody v-for="(login,index) in employee.user_logins">
                <tr>
                  <td>{{ index+1 }}</td>
                  <td>{{ login.ip_address }}</td>
                  <td>{{ login.browser }}</td>
                  <td>{{ login.platform }}</td>
                  <td>{{ login.logged_in }}</td>
                  <td>{{ login.logged_out }}</td>
                 
                </tr>       
              </tbody>
            </table>
          </div>
      </div>
    </App>
</template>