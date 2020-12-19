Vue.use(Vuex);
const travelSetStore = new Vuex.Store({
    state: {
        selectRegion: '全部',
        regions: ['全部'],
        selectItemType: 0,
        itemType: [
            { text: '景點', value: 0},
            { text: '餐廳', value: 1},
            { text: '旅館', value: 2},
        ],
        itemList: [
            {
                sn: 0,
                name: '',
                rating: 0,
                description: '',
                address: '',
                images: ['']
            }
        ],
        pageData: {
            currentPage: 1,
            pageSize: 1,
            totalSize: 1,
            totalPageCount: 1
        },
        selectItemDialog: false,
        selectListLoading: true,

        selectItem: {
            type: 0,
            sn: 0,
            name: '',
            description: '',
            time: null
        },



        isSortDetailData: false,
        travelSetDetailSortDate: {
            sn: 0,
            name: '',
            description: '',
            events: {

            }
        },
        travelSetDetail: {
            travelSetInfo: {
                sn: 0,
                name: '',
                description: '',
            },
            travelSetAttractions: [
                {
                    sn: 0,
                    attraction: {
                        sn: 0,
                        name: ''
                    },
                    time: '',
                }],
            travelSetRestaurants: [
                {
                    sn: 0,
                    restaurant: {
                        sn: 0,
                        name: ''
                    },
                    time: '',
                }
            ],
            travelSetHotels: [
                {
                    sn: 0,
                    hotel: {
                        sn: 0,
                        name: ''
                    },
                    time: '',
                }
            ],
        },


        travelSetInfoLoading: false,
        travelSetInfoDialog: false,
        travelSetInfo: [
            {
                sn: 0,
                createdUser: '',
                name: '',
                description: '',
                createdTime: '',
                updateTime: '',
            },
        ],



        travelSetEditItemDialog: false,
        travelSetDetailLoading: true,

    },
    getters: {
        getSelectRegion: (state) => state.selectRegion,
        getRegions: (state) => state.regions,
        getSelectItemType: (state) => state.selectItemType,
        getItemType: (state) => state.itemType,
        getSelectListLoading: (state) => state.selectListLoading,
        getSelectItemDialog: (state) => state.selectItemDialog,
        getItemList: (state) => state.itemList,
        getPageData: (state) => state.pageData,

        getSelectItem: (state) => state.selectItem,


        getTravelSetEditItemDialog: (state) => state.travelSetEditItemDialog,
        getTravelSetDetailLoading: (state) => state.travelSetDetailLoading,


    },
    mutations: {
        setSelectRegion(state, data){
            state.selectRegion = data;
        },
        setRegions(state, data){
            state.regions = data;
            state.regions.unshift('全部');
        },
        setSelectItemType(state, data){
            state.selectItemType = data;
        },
        setItemType(state, data){
            state.itemType = data;
        },
        setItemList(state, data){
            state.itemList = data;
        },
        addItemList(state, data){
            // data = []
            for (let i = 0; i < data.length; i++) {
                state.itemList.push(data[i]);
            }
        },
        setPageData(state, data){
            state.pageData = data;
        },
        addPage(state){
            state.pageData.currentPage += 1;
        },
        toggleSelectListLoading(state, flag){
            state.selectListLoading = flag;
        },
        toggleSelectItemDialog(state, flag){
            state.selectItemDialog = flag;
        },


        setSelectItem(state, data){
            state.selectItem.type = data.type;
            state.selectItem.sn = data.sn;
            state.selectItem.name = data.name;
            state.selectItem.description = data.description;
        },



        setIsSortDetailData(state, flag){
            state.isSortDetailData = flag;
        },
        setTravelSetDetailSortDate(state, data){
            state.travelSetDetailSortDate = data;
        },
        setTravelSetDetail(state, data){
            state.travelSetDetail.travelSetInfo = data.travelSetInfo;
            state.travelSetDetail.travelSetAttractions = data.travelSetAttractions;
            state.travelSetDetail.travelSetHotels = data.travelSetHotels;
            state.travelSetDetail.travelSetRestaurants = data.travelSetRestaurants;
        },


        toggleTravelSetInfoLoading(state, flag){
            state.travelSetInfoLoading = flag;
        },
        setTravelSetInfo(state, data){
            state.travelSetInfo = data;
        },
        setTravelSetInfoDialog(state, flag){
            state.travelSetInfoDialog = flag;
        },



        setTravelSetEditItemDialog(state, flag){
            state.travelSetEditItemDialog = flag;
        },
        setTravelSetDetailLoading(state, flag){
            state.travelSetDetailLoading = flag;
        },




    },
    actions: {
        initItemListData(state){
            let type = state.getters.getSelectItemType;
            let url = context+'/travelSet/'+type+'/1';

            let region = state.getters.getSelectRegion;
            console.log(region);
            if(region && region !== '全部'){
                url += '/'+region;
            }
            console.log(url);
            return axios.get(url)
                .then(response => {
                    if(response.data) {
                        state.commit('setItemList', response.data.tableData);
                        state.commit('setPageData', response.data.pageData);
                    }
                    return true;
                })
                .catch(() => {
                    return false;
                });
        },
        initRegionsData(state){
            let url = context+'/list.Region';
            axios.get(url)
                .then(response => {
                    state.commit('setRegions', response.data);
                });
        },
        selectedItemListData(state, {region, keyword}){
            let url;
            console.log(region, keyword);
            let type = state.getters.getSelectItemType;

            if(!region || region === "全部") region = "all";

            if(keyword && keyword !== ''){
                url = context+'/travelSet/'+type+'/1/'+region+'/'+keyword;
            }else{
                url = context+'/travelSet/'+type+'/1/'+region;
            }
            console.log(url);
            return axios.get(url)
                .then(response => {
                    state.commit('setItemList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                    return true;
                })
                .catch(() => {
                    return false;
                });
        },
        selectedTravelSetDetailData(state, sn){
            return axios.get(context+'/travelSet/entity/'+sn)
                .then(response => {
                    if(response.data.sortDate) {
                        state.commit("setTravelSetDetailSortDate", response.data.dataSorted);
                        state.commit("setIsSortDetailData", true);
                    }else{
                        state.commit("setIsSortDetailData", false);
                    }
                    let tmp = {
                        travelSetInfo: response.data.data.travelSetInfo,
                        travelSetAttractions: response.data.data.travelSetAttractions,
                        travelSetHotels: response.data.data.travelSetHotels,
                        travelSetRestaurants: response.data.data.travelSetRestaurants
                    }
                    state.commit("setTravelSetDetail", tmp);
                })
        },
        appendItemListData(state, {region, keyword}){
            let type = state.getters.getSelectItemType;

            let url;
            if(!region || region === "全部"){
                region = "all";
            }
            let pageData = state.getters.getPageData;
            if(!keyword || keyword === ''){
                url = context+'/travelSet/'+type+'/'+pageData.currentPage+'/'+region;
            }else{
                url = context+'/travelSet/'+type+'/'+pageData.currentPage+'/'+region+'/'+keyword;
            }
            console.log(url);
            return axios.get(url)
                .then(response => {
                    state.commit('addItemList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                });
        },
        saveTravelSet(state, data){
            let url = context + '/travelSet/save/'+data.travelSetInfo.sn
            let params = {
                travelSetInfo: JSON.stringify(data.travelSetInfo),
                travelSetAttractions: JSON.stringify(data.travelSetAttractions),
                travelSetHotels: JSON.stringify(data.travelSetHotels),
                travelSetRestaurants: JSON.stringify(data.travelSetRestaurants),
            };
            return axios({
                method: 'put',
                url: url,
                data: params
            }).then( response => {
                console.log(response.data);
                if(response.data.message){
                    let tmp = {
                        travelSetInfo: response.data.travelSetInfo,
                        travelSetAttractions: response.data.travelSetAttractions,
                        travelSetHotels: response.data.travelSetHotels,
                        travelSetRestaurants: response.data.travelSetRestaurants,
                    }

                    state.commit("setTravelSetDetail", tmp);
                    state.commit("setTravelSetSaved", true);
                }
                return response.data.message;
            })
        }
    }
})
export default travelSetStore;