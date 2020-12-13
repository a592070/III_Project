<template>
<!--  <div class="row">-->
<!--    <div class="col-md-12 ">-->
<!--      <detail-image></detail-image>-->
<!--    </div>-->
<!--  <div class="col-md-12 hotel-single mt-4 mb-5 ">-->
<!--    <span>Our Best hotels &amp; Rooms</span>-->
<!--    <h2><strong>石 岡 水 壩</strong></h2>-->
<!--    <p class="rate mb-5">-->
<!--      <span class="loc"><a href="#"><i class="icon-map"></i>臺中市 <h5>臺中市422石岡區豐勢路1238號</h5></a></span>-->
<!--      <iframe-->
<!--          width="600"-->
<!--          height="450"-->
<!--          frameborder="0" style="border:0"-->
<!--          src="https://www.google.com/maps/embed/v1/place?key=AIzaSyDVV4ION7MX_-1bG3bDyKBZ75NIVTHKCLA&q=臺中市422石岡區豐勢路1238號"-->
<!--          allowfullscreen>-->
<!--      </iframe>-->
<!--      <el-rate-->
<!--          v-model="rating"-->
<!--          disabled-->
<!--          show-score-->
<!--          text-color="#ff9900"-->
<!--          score-template="{value}">-->
<!--      </el-rate>-->
<!--    </p>-->
<!--    <p>石岡壩係位於大甲溪最下游堰壩，肩負著大台中地區民生用水之重責，其開發歷史可遠溯至日治時期。民國43年，由經濟部會同有關單位組成「大甲溪計畫委員會」，開始推動灌溉、發電、防洪等多目標開發。除在興建多座電廠，更在流域下游處興建水壩，以調節各發電廠尾水，石岡壩便是由前經濟部水資源統一規劃委員會於民國48年提議興建，於民國63年10月31日開工，民國66年10月15日完工。 石岡壩係完全由國人自行設計、施工之混凝土重力壩，自完工後便供應大台中地區與彰化縣部份地區之公共給水、工業用水、農業灌溉用水與台中港船舶用水，與台灣中部地區之經濟發展有著密不可分之關係。 民國88年9月21日發生集集大地震，石岡壩附近受地形隆起及偏移情形，造成石岡壩之堰體、溢洪道閘門、輸水隧道等受到嚴重不等的毀損，致使其原有之引水及調蓄功能嚴重受損，更直接使中部地區面臨嚴重的缺水窘境。 經水利署及中區水資源局的協力下，除以緊急搶修的方式，迅速解決台中地區之供水問題，也進一步擬定石岡壩災後修復之近程、中程及遠程計畫，依序執行。至民國89年底，全部緊急修復工程完工，更於90年底完成新增設之魚道新建工程，使石岡壩在地震後有了新的蛻變風貌，重新出發。*石岡壩位於大甲溪之台中市石岡區，堰全長357公尺，堰壩設有排砂道2座，溢洪道15座（有3座於921地震受損），以及魚道1座。 *石岡壩為水庫主管機關所公告之在槽水庫，用以抬高水位以達到穩定供水的目的。南岸進水口計畫取水量則為45.167立方公尺，除供應台中地區近1.5萬公頃農田灌溉用水外，並供應大台中地區所需之民生用水、工業用水及台中港船舶用水。 *石岡壩基本數據：位置：大甲溪壩型：臥箕式混凝土重力壩堰長：357公尺（溢洪道＋排砂道＋左右岸重力壩）排砂道：閘門2座：寬8.0公尺，高6公尺，堰頂標高約267.3公尺溢洪道：閘門15座：寬12.8公尺，高8公尺，堰頂標高約270.06~271.57公尺南岸進水口標高：268.07公尺魚道：階段式魚道1座(本文選自 經濟部水利署中區水資源局 石岡壩管理中心 網站)</p>-->
<!--    <div class="d-md-flex mt-5 mb-5">-->
<!--      <ul>-->
<!--        <li><h5>門 票 資 訊</h5></li>-->
<!--        <li><h5>交 通 資 訊</h5></li>-->
<!--        <li><h5>開 放 時 間</h5></li>-->
<!--        <li><h5>旅 遊 資 訊</h5></li>-->
<!--      </ul>-->
<!--      <ul class="ml-md-5">-->
<!--        <li>免費參觀</li>-->
<!--        <li>先搭火車到豐原火車站，再轉搭豐原客運往東勢、卓蘭、東勢林場的車子。</li>-->
<!--        <li>08:00-18:00</li>-->
<!--        <li>服務設施 公共電話停車場公廁網路</li>-->
<!--      </ul>-->
<!--    </div>-->
<!--  </div>-->
<!--  </div>-->


    <v-card color="basil" :elevation="100">
      <detail-image></detail-image>
      <v-card-title class="text-center justify-center py-6">
        <h1 class="font-weight-bold display-3 basil--text">
          石 岡 水 壩
        </h1>

      </v-card-title>
      <p class="rate mb-5">
        <el-rate
            v-model="rating"
            disabled
            show-score
            text-color="#ff9900"
            score-template="{value}">
        </el-rate>
        <span class="loc"><a href="#"><i class="icon-map"></i><strong>臺中市</strong> 臺中市422石岡區豐勢路1238號</a></span>
        <iframe
            width="600"
            height="450"
            frameborder="0" style="border:0"
            src=""
            allowfullscreen>
        </iframe>

      </p>
      <v-tabs
          v-model="tab"
          background-color="transparent"
          color="basil"
          grow>
        <v-tab
            v-for="item in items"
            :key="item">
          {{ item }}
        </v-tab>
      </v-tabs>

      <v-tabs-items v-model="tab">
        <v-tab-item
            v-for="item in detail"
            :key="item">
          <v-card
              color="basil"
              flat>
            <v-card-text>{{ item }}</v-card-text>
          </v-card>
        </v-tab-item>
      </v-tabs-items>
    </v-card>

</template>

<script>
module.exports = {
  components: {
    "detail-image": httpVueLoader(context + '/assets/a592070/front/attraction/components/detailImage.vue'),
  },
  data() {
    return {
      rating: 3,
      tab: null,
      items: [
        '簡 介', '門 票 資 訊', '交 通 資 訊', '開 放 時 間', '旅 遊 資 訊'
      ],
      detail: {
        description: '石岡壩係位於大甲溪最下游堰壩，肩負著大台中地區民生用水之重責，其開發歷史可遠溯至日治時期。民國43年，由經濟部會同有關單位組成「大甲溪計畫委員會」，開始推動灌溉、發電、防洪等多目標開發。除在興建多座電廠，更在流域下游處興建水壩，以調節各發電廠尾水，石岡壩便是由前經濟部水資源統一規劃委員會於民國48年提議興建，於民國63年10月31日開工，民國66年10月15日完工。 石岡壩係完全由國人自行設計、施工之混凝土重力壩，自完工後便供應大台中地區與彰化縣部份地區之公共給水、工業用水、農業灌溉用水與台中港船舶用水，與台灣中部地區之經濟發展有著密不可分之關係。 民國88年9月21日發生集集大地震，石岡壩附近受地形隆起及偏移情形，造成石岡壩之堰體、溢洪道閘門、輸水隧道等受到嚴重不等的毀損，致使其原有之引水及調蓄功能嚴重受損，更直接使中部地區面臨嚴重的缺水窘境。 經水利署及中區水資源局的協力下，除以緊急搶修的方式，迅速解決台中地區之供水問題，也進一步擬定石岡壩災後修復之近程、中程及遠程計畫，依序執行。至民國89年底，全部緊急修復工程完工，更於90年底完成新增設之魚道新建工程，使石岡壩在地震後有了新的蛻變風貌，重新出發。*石岡壩位於大甲溪之台中市石岡區，堰全長357公尺，堰壩設有排砂道2座，溢洪道15座（有3座於921地震受損），以及魚道1座。 *石岡壩為水庫主管機關所公告之在槽水庫，用以抬高水位以達到穩定供水的目的。南岸進水口計畫取水量則為45.167立方公尺，除供應台中地區近1.5萬公頃農田灌溉用水外，並供應大台中地區所需之民生用水、工業用水及台中港船舶用水。 *石岡壩基本數據：位置：大甲溪壩型：臥箕式混凝土重力壩堰長：357公尺（溢洪道＋排砂道＋左右岸重力壩）排砂道：閘門2座：寬8.0公尺，高6公尺，堰頂標高約267.3公尺溢洪道：閘門15座：寬12.8公尺，高8公尺，堰頂標高約270.06~271.57公尺南岸進水口標高：268.07公尺魚道：階段式魚道1座(本文選自 經濟部水利署中區水資源局 石岡壩管理中心 網站)',
        ticketInfo: '免費參觀',
        travellingInfo: '先搭火車到豐原火車站，再轉搭豐原客運往東勢、卓蘭、東勢林場的車子。',
        openTime: '08:00-18:00',
        remarks: '服務設施 公共電話停車場公廁網路'
      },
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',

    }
  }
}
</script>
<style>
/* Helper classes */
.basil {
  /*background-color: #FFFBE6 !important;*/
}
.basil--text {
  color: #356859 !important;
}
</style>