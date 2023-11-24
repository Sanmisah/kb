<script setup>
import Pagination from "@/Components/Pagination.vue";
import App from '@/Layouts/app-layout.vue';
import { Link } from '@inertiajs/vue3'
import index from "vue3-json-excel";


defineProps({ permissions: Object })



</script>
<template>
    <App>
      <ul class="flex space-x-2 rtl:space-x-reverse">
        <li>
            <Link :href="'/permissions/create'" class="btn btn-primary btn-sm float-end">
            <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24px"
                height="24px"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="w-5 h-5"
            >
                <line x1="12" y1="5" x2="12" y2="19"></line>
                <line x1="5" y1="12" x2="19" y2="12"></line>
            </svg>
            Generate</Link>
        </li>
      </ul>
      <br>
      <div class="p-4 sm:p-8 bg-white shadow sm:rounded-lg">
          <header>
              <h5 class="font-semibold text-lg dark:text-white-light">Permissions Information</h5>
          </header> <br>
          <div class="table-responsive">
            <table>
              <thead>
                <tr>
                  <th>#</th>
                  <th>Permission</th>
                  <th>Gaurd Name</th>
                </tr>
              </thead>
              <tbody v-for="(permission, index) in permissions.data">
                <tr>
                  <td>{{ index+1 }}</td>
                  <td align="right">{{ permission.name }}</td>
                  <td align="right">{{ permission.guard_name }}</td>
                
                </tr>       
              </tbody>
            </table>
          </div>
      </div>
      <Pagination :data="permissions"/>
    </App>
</template>