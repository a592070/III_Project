Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        storeData: "HHHHello",
        travelSetDialog: false,
        travelSetSelectDialog: false,
        travelSetDetail: {
            info: {
                sn: 0,
                createdUser: '',
                name: '',
                description: '',
                createdTime: '',
                updateTime: '',
                priority: 0,
                status: false,
            },
            travelEleAttractions: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ],
            travelEleRestaurants: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ],
            travelEleHotels: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ],
            travelEleCars: [
                {
                    sn: 0,
                    id: 0,
                    name: '',
                    time: ''
                }
            ]
        }
    },
    getters: {
        getTravelSetDialog: (state) => state.travelSetDialog,
        getTravelSetSelectDialog: (state) => state.travelSetSelectDialog,
        getTravelSetDetail: (state) => state.travelSetDetail
    },
    mutations: {
        toggleTravelSetDialog(state){
            state.travelSetDialog = !state.travelSetDialog;
        },
        toggleTravelSetSelectDialog(state){
            state.travelSetSelectDialog = !state.travelSetSelectDialog;
        },
        setTravelSetDetail(state, newTravelSetDetail){
            state.travelSetDetail = newTravelSetDetail;
        }
    }
})
export default store;