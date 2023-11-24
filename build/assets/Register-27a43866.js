import{T as p,f as c,a as s,u as o,b as a,e as f,w as _,d as m,o as g,Z as w,i as v}from"./app-ba0ee086.js";import{_ as l}from"./InputError-df0f842d.js";import{a as i,_ as n}from"./TextInput-7cfc6ab3.js";const b={class:"flex justify-center items-center min-h-screen bg-[url('/assets/images/map.svg')] dark:bg-[url('/assets/images/map-dark.svg')] bg-cover bg-center"},V={class:"panel sm:w-[480px] m-6 max-w-lg w-full"},x=a("h2",{class:"font-bold text-2xl mb-3"},"Sign Up",-1),y=a("p",{class:"mb-7"},"Enter your email and password to register",-1),h=["onSubmit"],U={class:"mt-4"},k={class:"mt-4"},q={class:"mt-4"},N={class:"flex items-center justify-end mt-4"},B=a("button",{type:"submit",class:"btn btn-primary"},"Register",-1),j={__name:"Register",setup(E){const e=p({name:"",email:"",password:"",password_confirmation:""}),d=()=>{e.post(route("register"),{onFinish:()=>e.reset("password","password_confirmation")})};return(u,t)=>(g(),c("div",b,[s(o(w),{title:"Register"}),a("div",V,[x,y,a("form",{class:"space-y-5",onSubmit:f(d,["prevent"])},[a("div",null,[s(n,{for:"name",value:"Name"}),s(i,{id:"name",type:"text",class:"form-input",modelValue:o(e).name,"onUpdate:modelValue":t[0]||(t[0]=r=>o(e).name=r),required:"",autofocus:"",autocomplete:"name"},null,8,["modelValue"]),s(l,{class:"mt-2",message:o(e).errors.name},null,8,["message"])]),a("div",U,[s(n,{for:"email",value:"Email"}),s(i,{id:"email",type:"email",class:"form-input",modelValue:o(e).email,"onUpdate:modelValue":t[1]||(t[1]=r=>o(e).email=r),required:"",autocomplete:"username"},null,8,["modelValue"]),s(l,{class:"mt-2",message:o(e).errors.email},null,8,["message"])]),a("div",k,[s(n,{for:"password",value:"Password"}),s(i,{id:"password",type:"password",class:"form-input",modelValue:o(e).password,"onUpdate:modelValue":t[2]||(t[2]=r=>o(e).password=r),required:"",autocomplete:"new-password"},null,8,["modelValue"]),s(l,{class:"mt-2",message:o(e).errors.password},null,8,["message"])]),a("div",q,[s(n,{for:"password_confirmation",value:"Confirm Password"}),s(i,{id:"password_confirmation",type:"password",class:"form-input",modelValue:o(e).password_confirmation,"onUpdate:modelValue":t[3]||(t[3]=r=>o(e).password_confirmation=r),required:"",autocomplete:"new-password"},null,8,["modelValue"]),s(l,{class:"mt-2",message:o(e).errors.password_confirmation},null,8,["message"])]),a("div",N,[s(o(v),{href:u.route("login"),class:"underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"},{default:_(()=>[m(" Already registered? ")]),_:1},8,["href"]),m("   "),B])],40,h)])]))}};export{j as default};
