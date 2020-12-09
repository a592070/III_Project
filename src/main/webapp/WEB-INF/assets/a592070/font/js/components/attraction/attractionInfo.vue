<template>
  <div class="row justify-content-start mb-5 pb-3">
    <div class="col-md-7 heading-section">
      <span class="subheading">特別推薦</span>
      <h2 class="mb-4"><strong>熱 門</strong> 景 點</h2>
    </div>

    <div style=" height: 100vh; overflow:auto">

      <el-scrollbar style="height: 100%;">
        <ul class="infinite-list" v-infinite-scroll="load" style="padding-right: 10% ;">
          <li v-for="i in count" class="infinite-list-item">
            <div class="row">
              <div class="col-md-6 col-lg-3" v-for="index in 4">
                <div class="destination">

                  <div class="img img-2 d-flex justify-content-center align-items-center">
                    <el-image
                        :src="images[0]"
                        :preview-src-list="images">
                    </el-image>
                  </div>


                  <div class="text p-3">
                    <h3><a href="#">Luxury Restaurant</a></h3>
                    <p class="rate">
                      <i class="icon-star"></i>
                      <i class="icon-star"></i>
                      <i class="icon-star"></i>
                      <i class="icon-star"></i>
                      <i class="icon-star-o"></i>
                      <span>8 Rating</span>
                    </p>
                    <p>Far far away, behind the word mountains, far from the countries</p>
                    <hr>
                    <p class="bottom-area d-flex">
                      <span><i class="icon-map-o"></i> San Franciso, CA</span>
                      <span class="ml-auto">
                          <a type="button" @click="$vuetify.goTo(toDetailInfo, options)">Discover</a></span>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </el-scrollbar>

    </div>
  </div>
</template>

<script>
module.exports = {
  data() {
    return {

    }
  },
  methods: {
    load () {
      this.count += 1
    }
  }
}
</script>