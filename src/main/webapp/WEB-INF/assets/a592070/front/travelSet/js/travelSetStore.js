Vue.use(Vuex);
const travelSetStore = new Vuex.Store({
    state: {
        regions: ['全部'],
        selectItemType: 0,
        itemType: {
            attraction: 0,
            restaurant: 1,
            hotel: 2,
        },
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
        selectListLoading: true,
        pageData: {
            currentPage: 1,
            pageSize: 1,
            totalSize: 1,
            totalPageCount: 1
        },

        selectItemDialog: false,

    },
    getters: {
        getItemList: (state) => state.itemList,
        getSelectListLoading: (state) => state.selectListLoading,
        getPageData: (state) => state.pageData,
        getRegions: (state) => state.regions,
        getSelectItemType: (state) => state.selectItemType,
        getSelectItemDialog: (state) => state.selectItemDialog,

    },
    mutations: {
        setItemList(state, data){
            state.itemList = data;
        },
        addItemList(state, data){
            // data = []
            for (let i = 0; i < data.length; i++) {
                state.itemList.push(data[i]);
            }
        },
        toggleSelectListLoading(state, flag){
            state.selectListLoading = flag;
        },
        setPageData(state, data){
            state.pageData = data;
        },
        addPage(state){
            state.pageData.currentPage += 1;
        },
        setRegions(state, data){
            state.regions = data;
            state.regions.unshift('全部');
        },
        setSelectItemType(state, data){
            state.selectItemType = data;
        },
        toggleSelectItemDialog(state, flag){
            state.selectItemDialog = flag;
        }



    },
    actions: {
        initItemListData(state){
            state.commit('toggleSelectListLoading', true);
            let type = state.getters.getSelectItemType;
            let url = context+'/travelSet/'+type+'/1';
            console.log(url);
            return axios.get(url)
                .then(response => {
                    if(response.data) {
                        state.commit('setItemList', response.data.tableData);
                        state.commit('setPageData', response.data.pageData);
                    }
                    state.commit('toggleSelectListLoading', false);
                    return true;
                })
                .catch(() => {
                    state.commit('toggleSelectListLoading', false);
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
            state.commit('toggleSelectListLoading', true);
            let url;
            console.log(region, keyword);
            let type = state.getters.getSelectItemType;

            if(!region || region == "全部") region = "all";

            if(keyword && keyword != ''){
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
                    state.commit('toggleSelectListLoading', false);
                    return false;
                });
        },
        appendItemListData(state, {region, keyword}){
            state.commit('toggleSelectListLoading', true);
            let type = state.getters.getSelectItemType;

            let url;
            if(!region || region == "全部"){
                region = "all";
            }
            let pageData = state.getters.getPageData;
            if(!keyword || keyword == ''){
                url = context+'/travelSet/'+type+'/'+pageData.currentPage+'/'+region;
            }else{
                url = context+'/travelSet/'+type+'/'+pageData.currentPage+'/'+region+'/'+keyword;
            }
            console.log(url);
            return axios.get(url)
                .then(response => {
                    state.commit('addItemList', response.data.tableData);
                    state.commit('setPageData', response.data.pageData);
                    state.commit('toggleSelectListLoading', false);
                });
        },
    }
})
export default travelSetStore;