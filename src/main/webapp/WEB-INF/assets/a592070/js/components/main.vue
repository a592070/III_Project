<template>
  <div class="content row">
    <div class="col-12">
      <travel-set-info></travel-set-info>
      <travel-set-detail></travel-set-detail>
    </div>
  </div>
</template>

<script>

import TravelSetDetail from "./travelSetDetail";
import TravelSetInfo from "./travelSetInfo";
module.exports = {
  components: {TravelSetInfo, TravelSetDetail}
}

</script>