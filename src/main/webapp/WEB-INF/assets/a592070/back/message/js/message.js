import store from './store.js';

Vue.use(httpVueLoader);
Vue.use(ELEMENT);
const Message = new Vue({
    el: '#app',
    components: {
        'message': httpVueLoader(context + '/assets/a592070/back/message/components/main.vue'),
    },
    vuetify: new Vuetify(),
});
export default Message;