<template>
  <div class="content row">
    <div class="col-12">
      <travel-set-info></travel-set-info>


      <el-drawer
          title="Travel Set Detail"
          :before-close="handleCloseTravelSet"
          v-if='travelSetDialog'
          :visible.sync='travelSetDialog'
          v-loading="travelSetDetailLoading"
          @closed="closeDrawer"
          custom-class="demo-drawer"
          ref="drawer"
          size="70%"
          :show-close="false"
          :destroy-on-close="true">

        <travel-set-detail></travel-set-detail>

            <el-dialog
                title="選 擇 目 標 ID"
                :append-to-body="true"
                v-if="selectItemDialog"
                :visible.sync="selectItemDialog"
                :before-close="handleCloseSelectItem"
                :destroy-on-close="true">
              <travel-set-select-item></travel-set-select-item>
            </el-dialog>
      </el-drawer>
    </div>
  </div>
</template>

<script>
module.exports = {
  components: {
    "travel-set-info": httpVueLoader(context+'/assets/a592070/js/components/travelSet/travelSetInfo02.vue'),
    "travel-set-detail": httpVueLoader(context + '/assets/a592070/js/components/travelSet/travelSetDetail02.vue'),
    "travel-set-select-item": httpVueLoader(context+'/assets/a592070/js/components/travelSet/travelSetSelectItem.vue')
    },
  data() {
    return{
    }
  },
  computed: Vuex.mapState(['travelSetDialog', 'travelSetDetailLoading', 'travelSetInfoLoading', 'travelSetSaved', 'selectItemDialog']),
  methods: {
    handleCloseTravelSet(done) {
    },
    closeDrawer(){
      console.log("closed")
    },
    handleCloseSelectItem(done){
      this.$store.commit('initSelectItemData');
      done();
      this.$store.commit('toggleSelectItemDialog', false);
    }
  }
}

</script>