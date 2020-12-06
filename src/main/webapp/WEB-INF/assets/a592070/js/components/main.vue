<template>
  <div class="content row">
    <div class="col-12">
      <h1>HIHI</h1>
<!--      <h1>{{getStoreData}}</h1>-->
      <h1>{{storeData}}</h1>
      <travel-set-info></travel-set-info>

      <el-drawer
          title="Travel Set Detail"
          :before-close="handleCloseTravelSet"
          v-if='travelSetDialog'
          :visible.sync='travelSetDialog'
          v-loading="travelSetDetailLoading"

          custom-class="demo-drawer"
          ref="drawer"
          size="70%"
          :show-close="false"
          :destroy-on-close="true">

        <travel-set-detail></travel-set-detail>
        <div>
          <el-button type="primary" v-on:click="cancelTravelSetForm">取 消 關 閉</el-button>
          <el-button type="primary" @click="$refs.drawer.closeDrawer()">{{ travelSetDetailLoading ? '提交中 ...' : '保 存' }}
          </el-button>

        </div>
      </el-drawer>
    </div>
  </div>
</template>

<script>
module.exports = {
  components: {
    "travel-set-info": httpVueLoader(context+'/assets/a592070/js/components/travelSetInfo02.vue'),
    "travel-set-detail": httpVueLoader(context + '/assets/a592070/js/components/travelSetDetail02.vue')
    },
  data() {
    return{
    }
  },
  computed: Vuex.mapState(['storeData', 'travelSetDialog', 'travelSetDetailLoading']),
  methods: {
    handleCloseTravelSet(done) {
      if (this.travelSetDetailLoading) {
        return;
      }
      this.$confirm('確定要提交表單?')
          .then(_ => {
            this.$store.commit('toggleTravelSetDetailLoading');
          })
          .catch(_ => {
          });
    },
    cancelTravelSetForm() {
      console.log("cancel");
      this.$store.commit('toggleTravelSetDialog');
      this.$store.commit('toggleTravelSetDetailLoading');

      clearTimeout(this.timer);
    }
  }
}

</script>