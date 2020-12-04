Vue.use(vuex);
const store = new Vuex.Store({
    state: {
        storeData: "HHHHello",
        travelSetInfoLoading: true,
        travelSetDialog: false,
        travelSetDetailLoading: true,
        travelSetSelectDialog: false,
        travelSetSelectLoading: true,
        currentEditTravelSetInfo: {
            sn: 0,
            createdUser: '',
            name: '',
            description: '',
            createdTime: '',
            updateTime: '',
            priority: 0,
            status: false
        },
        currentEditTravelSetDetail: {
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
            travelSetAttractions: [
                {
                    sn: 0,
                    time: '',
                    attraction: {
                        sn: 0,
                        name: ''
                    }
                }
            ],
            travelSetRestaurants: [
                {
                    sn: 0,
                    time: '',
                    restaurant: {
                        sn: 0,
                        name: ''
                    }
                }
            ],
            travelSetHotels: [
                {
                    sn: 0,
                    time: '',
                    hotel: {
                        sn: 0,
                        name: ''
                    }
                }
            ],
            travelSetCars: [
                {
                    sn: 0,
                    time: '',
                    car: {
                        sn: 0,
                        name: ''
                    }
                }
            ]
        },
        currentEditTravelSetSelectItem: {
            sn: 0,
            name: ''
        }
    },
    getters: {
        getTravelSetInfoLoading: (state) => state.travelSetInfoLoading,
        getTravelSetDialog: (state) => state.travelSetDialog,
        getTravelSetDetailLoading: (state) => state.travelSetDetailLoading,

        getTravelSetSelectDialog: (state) => state.travelSetSelectDialog,
        getTravelSetSelectLoading: (state) => state.travelSetSelectLoading,

        getTravelSetDetail: (state) => state.currentEditTravelSetDetail,
        getTravelSetSelectItem: (state) => state.currentEditTravelSetSelectItem,
        getTravelSetInfo: (state) => state.currentEditTravelSetInfo
    },
    mutations: {
        toggleTravelSetInfoLoading(state){
            state.travelSetInfoLoading = !state.travelSetInfoLoading;
        },
        toggleTravelSetDialog(state){
            state.travelSetDialog = !state.travelSetDialog;
        },
        toggleTravelSetDetailLoading(state){
            state.travelSetDetailLoading = !state.travelSetDetailLoading;
        },


        toggleTravelSetSelectDialog(state){
            state.travelSetSelectDialog = !state.travelSetSelectDialog;
        },
        toggleTravelSetSelectLoading(state){
            state.travelSetSelectLoading = !state.travelSetSelectLoading;
        },

        setTravelSetInfo(state, newTravelSetInfo){
            state.currentEditTravelSetInfo = newTravelSetInfo;
        },
        setTravelSetDetail(state, newTravelSetDetail){
            state.currentEditTravelSetDetail = newTravelSetDetail;
        },
        setTravelSetSelectItem(state, newTravelSetSelectItem){
            state.currentEditTravelSetSelectItem = newTravelSetSelectItem;
        }

    }
})
export default store;