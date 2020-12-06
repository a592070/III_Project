<template>
  <div>
  </div>
</template>

<script>
module.exports = {
  data() {
    return {
      loading: true,
      formLabelWidth: '80px',
      timer: null,
      // travelSetDetail: this.currentEditTravelSetDetail,
      // travelSetDetail: {
      //   travelSetInfo: {
      //     sn: 0,
      //     createdUser: '',
      //     name: '',
      //     description: '',
      //     createdTime: '',
      //     updateTime: '',
      //     priority: 0,
      //     status: false
      //   },
      //   travelSetAttractions: [
      //     {
      //       sn: 0,
      //       time: '',
      //       attraction: {
      //         sn: 0,
      //         name: ''
      //       }
      //     }
      //   ],
      //   travelSetRestaurants: [
      //     {
      //       sn: 0,
      //       time: '',
      //       restaurant: {
      //         sn: 0,
      //         name: ''
      //       }
      //     }
      //   ],
      //   travelSetHotels: [
      //     {
      //       sn: 0,
      //       time: '',
      //       hotel: {
      //         sn: 0,
      //         name: ''
      //       }
      //     }
      //   ],
      //   travelSetCars: [
      //     {
      //       sn: 0,
      //       time: '',
      //       car: {
      //         sn: 0,
      //         name: ''
      //       }
      //     }
      //   ]
      // }
    }
  },
  created: function () {
    console.log("init")
  },
  computed: Vuex.mapState(['currentEditTravelSetInfo', 'currentEditTravelSetDetail']),
  methods: {
    initData() {
      // this.loading = true;

      $.get({
        url: context+'/admin/travelSet/entity/',
        async: false,
        success: function (response) {
          this.travelSetDetail = response;
          // this.loading = false;

          this.$store.commit('setCurrentTravelSetDetail', this.travelSetDetail);
          this.$store.commit('toggleTravelSetDetailLoading');
        }
      });

    },
    resetTravelSetForm(formName){
      // this.loading = true;

      console.log(this.$refs[formName]);
      this.$refs[formName].resetFields();
      // this.setTravelSetDetail(this.travelSetDetail);

      // this.loading = false;
    },
    addTravelSetFormItem(items) {
      items.push({
        id: 0,
        name: 'new',
        time: Date.now()
      });
      console.log(items);
      this.selectTravelSetItemID(items[items.length - 1]);

    },
    removeTravelSetFormItem(items, item) {
      console.log(item);
      let index = items.indexOf(item)
      if (index !== -1) {
        items.splice(index, 1)
      }
      console.log(items);
      this.setTravelSetDetail(this.travelSetDetail);
    },
    selectTravelSetItemID(item) {
      console.log(item);
      this.setTravelSetSelectItem(item);
      this.$store.commit("toggleTravelSetSelectDialog");
    },

    handleSwitchStatus(){

    }
  }
}
</script>