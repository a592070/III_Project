import store from './Store.js';

Vue.use(httpVueLoader);
const App = new Vue({
    el: '#app',
    components: {
        'index': httpVueLoader(context+'/assets/a592070/js/components/travelSet/main.vue')
    },
    store
})
export default App;