import {createRouter, createWebHashHistory} from 'vue-router';
import Home from './components/Home.vue';

const history = createWebHashHistory();
export const router = createRouter({
  history: history,
  routes: [
    {
      path: '/',
      component: Home
    },
  ]
});
