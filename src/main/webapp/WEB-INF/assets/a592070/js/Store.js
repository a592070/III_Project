Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        storeData: "HHHHello",
        travelSetDialog: false,
        travelSetSelectDialog: false,
        travelSetInfo: {
            sn: 0,
            createdUser: '',
            name: '',
            description: '',
            createdTime: '',
            updateTime: '',
            priority: 0,
            status: false
        },
        travelSetDetail: {
            info: {
                sn: 0,
                createdUser: '',
                name: '',
                description: '',
                createdTime: '',
                updateTime: '',
                priority: 0,
                status: false
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
        },
        travelSetSelectItem: {
            sn: 0,
            name: ''
        }
    },
    getters: {
        getTravelSetDialog: (state) => state.travelSetDialog,
        getTravelSetSelectDialog: (state) => state.travelSetSelectDialog,
        getTravelSetDetail: (state) => state.travelSetDetail,
        getTravelSetSelectItem: (state) => state.travelSetSelectItem,
        getTravelSetInfo: (state) => state.travelSetInfo
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
        },
        setTravelSetSelectItem(state, newTravelSetSelectItem){
            state.travelSetSelectItem = newTravelSetSelectItem;
        },
        setTravelSetInfo(state, newTravelSetInfo){
            state.travelSetInfo = newTravelSetInfo;
        }
    }
})
export default store;