// import store from '/III_Project_war_exploded/assets/a592070/js/Store.js';

Vue.use(httpVueLoader);
var App = new Vue({
    el: '#app',
    components: {
        'index': httpVueLoader(context+'/assets/a592070/js/components/main.vue')
    },
    store: context + '/assets/a592070/js/Store.js'
})
export default App;